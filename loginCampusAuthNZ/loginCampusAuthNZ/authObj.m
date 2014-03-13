//
//  authObj.m
//  loginCampusAuthNZ
//
//  Created by UOC on 19/02/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import "authObj.h"

@implementation authObj

- (void) setAuth:(NSDictionary *)dict
{
    self.accessToken = [dict objectForKey:@"access_token"];
    NSLog(@"setAuth - %@", self.accessToken);
    self.tokenType = [dict objectForKey:@"token_type"];
    self.refreshToken = [dict objectForKey:@"refresh_token"];
    self.expiresIn = [dict objectForKey:@"expires_in"];
    self.scope = [dict objectForKey:@"scope"];
    [self updateExpirationDate];
}


- (void) updateExpirationDate {
    NSDate *date = nil;
    NSNumber *expiresIn = self.expiresIn;
    if (expiresIn) {
        unsigned long deltaSeconds = [expiresIn unsignedLongValue];
        if (deltaSeconds > 0) {
            date = [NSDate dateWithTimeIntervalSinceNow:deltaSeconds];
        }
    }
    self.expirationDate = date;
}



// Aquesta funcio s'hauria de cridar abans de fer una crida a l'API
- (BOOL)shouldRefreshToken {
    // We should refresh the access token when it's missing or nearly expired
    // and we have a refresh token
    NSLog(@"entra shouldRefreshToken");
    BOOL shouldRefresh = NO;
    NSString *accessToken = self.accessToken;
    NSString *refreshToken = self.refreshToken;
    
    BOOL hasRefreshToken = ([refreshToken length] > 0);
    BOOL hasAccessToken = ([accessToken length] > 0);
    
    // Determine if we need to refresh the access token
    if (hasRefreshToken) {
        if (!hasAccessToken) {
            shouldRefresh = YES;
        } else {
            // We'll consider the token expired if it expires 60 seconds from now
            // or earlier
            NSDate *expirationDate = self.expirationDate;
            NSTimeInterval timeToExpire = [expirationDate timeIntervalSinceNow];
            if (expirationDate == nil || timeToExpire < 60.0) {
                // access token has expired, or will in a few seconds
                shouldRefresh = YES;
            }
        }
    }
    return shouldRefresh;
}

- (void) refreshAccessToken
{
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    NSString *refreshToken = self.refreshToken;
    
    NSString *postString = [NSString stringWithFormat:@"client_id=%@" \
                      "&client_secret=%@" \
                      "&grant_type=refresh_token" \
                      "&refresh_token=%@" ,
                      [stdDefaults objectForKey:@"client"], [stdDefaults objectForKey:@"secret"], refreshToken];
    
    NSMutableURLRequest *tokenRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlToken]];
    
    [tokenRequest setHTTPMethod:@"POST"];
    [tokenRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    //Actualitzem el token de manera syncrona.
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:tokenRequest
                                         returningResponse:&response
                                                     error:&error];
    NSLog(@"refreshData - %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    if(data != nil){
        NSDictionary *oAuth = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        [stdDefaults setValue:[oAuth objectForKey:@"access_token"] forKey:@"access_token"];
        [stdDefaults setValue:[oAuth objectForKey:@"refresh_token"] forKey:@"refresh_token"]; //Guardem el refresh per si canvies.
        [self setAuth:oAuth];
    }

}


@end
