//
//  Board.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Board.h"

@implementation Board

-(void) setDatos:(NSDictionary *)boardDictionary
{
    self.identifier = [boardDictionary objectForKey:@"id"];
    self.subtype = [boardDictionary objectForKey:@"subtype"];
    self.title = [boardDictionary objectForKey:@"title"];
    self.code = [boardDictionary objectForKey:@"code"];
    self.domainId = [boardDictionary objectForKey:@"domainId"];
    self.unreadMessages = [boardDictionary objectForKey:@"unreadMessages"];
    self.totalMessages = [boardDictionary objectForKey:@"totalMessages"];
}


/**
 * Get the data of a communication's resource (board, debate, forum) of the classroom.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param idenC Clasrooms's identifier
 * @param idenB Identifier of the communication's resource.
 * @param token the token obtained with the autentication
 * @return Board object with the data of the communication's resource.
 */
- (Board *) getClassroomsIdBoardsId:(NSString *)idenC BoardId:(NSString *)idenB withToken:(NSString *)token
{
    Board *b = [[Board alloc] init];
    
    NSURL *boardURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@?access_token=%@", baseUrl , idenC, idenB, token]];
    
    
    NSData *boardData = [NSData dataWithContentsOfURL:boardURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:boardData encoding:NSUTF8StringEncoding]);
    NSDictionary *boardDict = [NSJSONSerialization JSONObjectWithData:boardData options:0 error:nil];
    
    if ([boardDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [boardDict valueForKey:@"error"], [boardDict valueForKey:@"error_description"]);
        return b;
    }
    
    [b setDatos:boardDict];
    
    return b;
}



/**
 * Get the data of a communication's resource (board, debate, forum) of the subject.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param idenS Subject's identifier
 * @param idenB Identifier of the communication's resource.
 * @param token the token obtained with the autentication
 * @return Board object with the data of the communication's resource.
 */
- (Board *) getSubjectsIdBoardsId:(NSString *)idenS BoardId:(NSString *)idenB withToken:(NSString *)token
{
    Board *b = [[Board alloc] init];
    
    NSURL *boardURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@?access_token=%@", baseUrl , idenS, idenB, token]];
    
    
    NSData *boardData = [NSData dataWithContentsOfURL:boardURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:boardData encoding:NSUTF8StringEncoding]);
    NSDictionary *boardDict = [NSJSONSerialization JSONObjectWithData:boardData options:0 error:nil];
    
    if ([boardDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [boardDict valueForKey:@"error"], [boardDict valueForKey:@"error_description"]);
        return b;
    }
    
    [b setDatos:boardDict];
    
    return b;
}

@end
