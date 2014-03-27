//
//  MobileResourceList.m
//  loginCampusAuthNZ
//
//  Created by UOC on 14/03/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import "MobileResourceList.h"

@implementation MobileResourceList


- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *resource in [dict objectForKey:@"mobileResources"]) {
        MobileResource *r = [[MobileResource alloc] init];
        [r setDatos:resource];
        [self.mobileResources addObject:r];
    }
}


/**
 * Get the list of resources available for mobile
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param token the token obtained with the autentication
 * @return Array of Messages with the unread messages of the given folder of the communication's resource.
 */
- (NSMutableArray *) getMobileResources:(NSString *)token
{
    self.mobileResources = [[NSMutableArray alloc] init];
    
    NSURL *resourcesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mobileresources?access_token=%@", baseUrl, token]];
    
    NSData *resourcesData = [NSData dataWithContentsOfURL:resourcesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:resourcesData encoding:NSUTF8StringEncoding]);
    if(resourcesData != nil){
        NSDictionary *resourcesDict = [NSJSONSerialization JSONObjectWithData:resourcesData options:0 error:nil];
    
        if ([resourcesDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [resourcesDict valueForKey:@"error"], [resourcesDict valueForKey:@"error_description"]);
            return self.mobileResources;
        }
    
        [self setDatos:resourcesDict];
    }
    return self.mobileResources;
}
@end
