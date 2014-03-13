//
//  ProfileList.h
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Profile.h"
#import "Constants.h"

@interface ProfileList : NSObject

@property (nonatomic, retain) NSMutableArray *profiles;

- (void)setDatos:(NSDictionary *)dict;

- (NSMutableArray *) getPeopleIdProfiles:(NSString *)idenP withToken:(NSString *)token;

- (NSMutableArray *) getUserProfiles:(NSString *)token;


@end
