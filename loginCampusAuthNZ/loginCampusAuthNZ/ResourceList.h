//
//  ResourceList.h
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Resource.h"
#import "Constants.h"

@interface ResourceList : NSObject

@property (nonatomic, retain) NSMutableArray *resources;

- (void)setDatos:(NSDictionary *)dict;

- (NSMutableArray *) getClassroomsIdResources:(NSString *)idenC withToken:(NSString *)token;

- (NSMutableArray *) getSubjectsIdResources:(NSString *)idenS withToken:(NSString *)token;

@end
