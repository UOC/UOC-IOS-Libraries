//
//  UserList.h
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Constants.h"

@interface UserList : NSObject

@property (nonatomic, retain) NSMutableArray *users;

- (void)setDatos:(NSDictionary *)dict;

- (NSMutableArray *) getClassroomsIdPeople:(NSString *)idenC withToken:(NSString *)token;

- (NSMutableArray *) getClassroomsIdPeopleStudents:(NSString *)idenC withToken:(NSString *)token;

- (NSMutableArray *) getClassroomsIdPeopleTeachers:(NSString *)idenC withToken:(NSString *)token;

- (NSMutableArray *) getPeopleIdTutors:(NSString *)idenP withToken:(NSString *)token;

- (NSMutableArray *) getUserTutors:(NSString *)token;
@end
