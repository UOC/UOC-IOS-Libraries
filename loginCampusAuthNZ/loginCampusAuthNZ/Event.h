//
//  Event.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Constants.h"

@interface Event : NSObject

@property (nonatomic, retain) NSString *identifier; //Identifier of the event.
@property (nonatomic, retain) NSString *url; //URL of the event.
@property (nonatomic, retain) NSString *summary; //Summary of the event.
@property (nonatomic, retain) NSDate *start; //Start date.
@property (nonatomic, retain) NSDate *end; //End date.

- (void) setDatos:(NSDictionary *)eventDictionary;

- (Event *) getCalendarEventsId:(NSString *)iden withToken:(NSString *)token;

- (Event *) postCalendarEvents:(Event *)postEvent withToken:(NSString *)token;

@end
