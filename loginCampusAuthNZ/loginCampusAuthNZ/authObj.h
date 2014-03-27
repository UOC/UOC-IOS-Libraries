//
//  authObj.h
//  loginCampusAuthNZ
//
//  Created by UOC on 19/02/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "PDKeychainBindings.h"


@interface authObj : NSObject

@property (retain) NSString *accessToken;
@property (retain) NSString *tokenType;
@property (retain) NSString *refreshToken;
@property (retain) NSNumber *expiresIn;
@property (retain) NSString *scope;
@property (retain) NSDate *expirationDate;


- (void) setAuth:(NSDictionary *)dict;
- (BOOL) shouldRefreshToken;
- (void) updateExpirationDate;
- (void) refreshAccessToken;
@end
