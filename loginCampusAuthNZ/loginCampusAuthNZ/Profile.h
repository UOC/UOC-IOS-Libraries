//
//  Profile.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface Profile : NSObject

@property (nonatomic, retain) NSString *appId;//Environment identifier of the profile.
@property (nonatomic, retain) NSString *app; //Profile environment in the current language of the user.
@property (nonatomic, retain) NSString *identifier; //Profile identifier, has the following format: APP-USERTYPE-USERSUBTYPE-LANG.
@property (nonatomic, retain) NSString *userSubtypeId; //Identifier of the User's subtype of the profile.
@property (nonatomic, retain) NSString *userType; //User type of the profile (TYPE) in the current language of the user.
@property (nonatomic, retain) NSString *usertypeId; //Identifier of the user type of the profile (TYPE).
@property (nonatomic, retain) NSString *userSubtype; //User Subtype of the profile (SUBTYPE) in the current language of the user.
@property (nonatomic, retain) NSString *language; //Language of the profile. Some environments have only one language o don't have the current language of the user. This field contains the language of the profile.

-(void) setDatos:(NSDictionary *) profileDictionary;

-(Profile *) getPeopleIdProfilesCurrent:(NSString *)iden withToken:(NSString *)token;

-(Profile *) getUserProfilesCurrent:(NSString *)token;

-(Profile *) putUserProfilesCurrent:(Profile *)putProfile withToken:(NSString *)token;


@end
