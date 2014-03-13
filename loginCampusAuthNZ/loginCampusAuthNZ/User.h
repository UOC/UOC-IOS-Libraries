//
//  User.h
//  Llibreria
//
//  Created by UOC on 17/05/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface User : NSObject

@property (nonatomic, retain) NSString *identifier; //User identifier.
@property (nonatomic, retain) NSString *username;//Username inside Virtual Campus.
@property (nonatomic, retain) NSString *name;//User's name.
@property (nonatomic, retain) NSString *number;//User's number.
@property (nonatomic, retain) NSString *fullname;//User's full name.
@property (nonatomic, retain) NSString *language;//User's language in ISO format.
@property (nonatomic, retain) NSString *sessionID;//Identifier of the user's current session inside Virtual Campus. It only contains data in the Get User's data call.
@property (nonatomic, retain) NSString *email;//User's mail address
@property (nonatomic, retain) NSString *photoUrl;//User's photo url

@property (nonatomic, retain) UIImage *photo; // UIImage version of photoUrl

- (void) setDatos:(NSDictionary *)userDictionary;
-(User *) getUser:(NSString *) token;
@end
