//
//  EventList.h
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"
#import "Constants.h"

@interface EventList : NSObject

@property (nonatomic, retain) NSMutableArray *events;

- (void)setDatos:(NSDictionary *)dict;

- (NSMutableArray *) getCalendarEvents:(NSString *)token;

@end
