//
//  ClassroomList.h
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Classroom.h"
#import "Constants.h"

@interface ClassroomList : NSObject

@property (nonatomic, retain) NSMutableArray *classrooms;

- (void)setDatos:(NSDictionary *)dict;

- (NSMutableArray *) getClassrooms:(NSString *)token;

- (NSMutableArray *) getClassroomsIdGroups:(NSString *)idenC withToken:(NSString *)token;

@end
