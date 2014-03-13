//
//  Classroom.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface Classroom : NSObject

@property (nonatomic, retain) NSString *identifier; //Classroom's identifier.
@property (nonatomic, retain) NSString *title; //Classroom's title.
@property (nonatomic, retain) NSString *color; //Color the user ha assigned to the classroom.
@property (nonatomic, retain) NSString *fatherId; //Identifier of the classroom's parent.
@property (nonatomic, retain) NSString *assignments; //Assignment list of the user inside the classroom.
@property (nonatomic, retain) NSString *code; //Classroom's code.
@property (nonatomic, retain) NSString *shortTitle; //Classroom's short title.

- (void) setDatos:(NSDictionary *)classroomDictionary;

- (Classroom *) getClassroomsId:(NSString *)iden withToken:(NSString *)token;


@end
