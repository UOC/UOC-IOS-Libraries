//
//  EventList.m
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import "EventList.h"

@implementation EventList

- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *events in [dict objectForKey:@"events"]) {
        Event *e = [[Event alloc] init];
        [e setDatos:events];
        [self.events addObject:e];
    }
}

/**
 * Get the events of the calendar. If there isn't any parameter it return all the events of the current week.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param token the token obtained with the autentication
 * @return Array of Events with calendar's events.
 */
- (NSMutableArray *) getCalendarEvents:(NSString *)token
{
    self.events = [[NSMutableArray alloc] init];
    
    NSURL *eventsURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@calendar/events?access_token=%@", baseUrl, token]];
    
    NSData *eventsData = [NSData dataWithContentsOfURL:eventsURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:eventsData encoding:NSUTF8StringEncoding]);
    NSDictionary *eventsDict = [NSJSONSerialization JSONObjectWithData:eventsData options:0 error:nil];
    
    if ([eventsDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [eventsDict valueForKey:@"error"], [eventsDict valueForKey:@"error_description"]);
        return self.events;
    }
    
    [self setDatos:eventsDict];
    
    return self.events;
}


@end
