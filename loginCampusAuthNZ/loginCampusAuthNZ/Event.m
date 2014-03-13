//
//  Event.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Event.h"

@implementation Event

- (void) setDatos:(NSDictionary *)eventDictionary
{
    self.identifier = [eventDictionary objectForKey:@"id"];
    self.url        = [eventDictionary objectForKey:@"url"];
    self.summary    = [eventDictionary objectForKey:@"summary"];
    self.start      = [self parserDate:[eventDictionary objectForKey:@"start"]];
    self.end        = [self parserDate:[eventDictionary objectForKey:@"end"]];
}

- (NSDate *)parserDate:(NSString *)dateString
{
    [NSDateFormatter setDefaultFormatterBehavior:NSDateFormatterBehavior10_4];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSSz"];
    
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:dateString];
    
    return dateFromString;
}

/**
 * Get an event from the calendar. The event's date must be between the current date and 6 months earlier.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param iden Event identifier.
 * @param token the token obtained with the autentication
 * @return Event object with event's data or null if event can't be found.
 */
- (Event *) getCalendarEventsId:(NSString *)iden withToken:(NSString *)token{
    
    Event *e = [[Event alloc] init];
    
    NSURL *eventURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@calendar/events/%@?access_token=%@", baseUrl , iden, token]];
    
    
    NSData *eventData = [NSData dataWithContentsOfURL:eventURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:eventData encoding:NSUTF8StringEncoding]);
    NSDictionary *eventDict = [NSJSONSerialization JSONObjectWithData:eventData options:0 error:nil];
        
    if ([eventDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [eventDict valueForKey:@"error"], [eventDict valueForKey:@"error_description"]);
        return e;
    }
        
    [e setDatos:eventDict];
   
    return e;
}


/**
 * Creates a new event.
 * The user must have given the application the grant WRITE to use these operation.
 *
 * @param postEvent Event to create.
 * @param token the token obtained with the autentication
 * @return Event created.
 */
- (Event *) postCalendarEvents:(Event *)postEvent withToken:(NSString *)token
{
    // Definim el format de data que vol el servidor
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    //Agafem l'event que se'ns ha passat i el posem en un diccionari
    NSDictionary *nouEvent = @{@"id":postEvent.identifier,@"url":postEvent.url,@"summary":postEvent.summary,@"start":[dateFormat stringFromDate:postEvent.start],@"end":[dateFormat stringFromDate:postEvent.end]};
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:nouEvent options:NSJSONWritingPrettyPrinted error:nil];
    NSURL *eventURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@calendar/events?access_token=%@", baseUrl, token]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:eventURL];
    
    //Indiquem que el tipus d'accio que voldrem fer sera un POST
    [request setHTTPMethod:@"POST"];
    //El format de les dades estara en json.
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:jsonData];
    
    
    //Fem el request de manera syncrona.
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    Event *e = [[Event alloc] init];
    NSDictionary *eventDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if ([eventDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [eventDict valueForKey:@"error"], [eventDict valueForKey:@"error_description"]);
        return e;
    }
    
    // Afegim els valors que ens ha tornat en un event que retornem.
    [e setDatos:eventDict];
    return e;
}

@end
