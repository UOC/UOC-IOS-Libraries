//
//  MessageHistory.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MessageHistory.h"

@implementation MessageHistory

-(void)setDatos:(NSDictionary *)historyDictionary
{
    self.details = [[NSMutableArray alloc] init];
    
    self.identifier = [historyDictionary objectForKey:@"id"];
    for (NSDictionary *detail in [historyDictionary objectForKey:@"details"]) {
        MessageHistoryDetail *d = [[MessageHistoryDetail alloc] init];
        [d setDatos:detail];
        [self.details addObject:d];
    }
}


/**
 * Get message's historic actions from a folder of a communication's resource (board, debate, forum) of the classroom.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenC Clasrooms's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param idenF Folder's identifier.
 * @param idenM Message's identifier.
 * @param token the token obtained with the autentication
 * @return MessageHistory object with message's historic actions.
 */
-(MessageHistory *) getClassroomsIdBoardsIdFoldersIdMessagesIdHistory:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token
{
    MessageHistory *h = [[MessageHistory alloc] init];
    NSURL *messagehistoryURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/folders/%@/messages/%@/history?access_token=%@", baseUrl , idenC, idenB, idenF, idenM, token]];
    
    NSData *messagehistoryData = [NSData dataWithContentsOfURL:messagehistoryURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagehistoryData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagehistoryDict = [NSJSONSerialization JSONObjectWithData:messagehistoryData options:0 error:nil];
    
    if ([messagehistoryDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagehistoryDict valueForKey:@"error"], [messagehistoryDict valueForKey:@"error_description"]);
        return h;
    }
    
    [h setDatos:messagehistoryDict];
    return h;
}


/**
 * Get message's historic actions.
 * The user must have given the application the grant READ_MAIL to use these operation.
 *
 * @param idenM Message identifier.
 * @param token the token obtained with the autentication
 * @return MessageHistory object with message's historic actions.
 */
-(MessageHistory *) getMailMessagesIdHistory:(NSString *)idenM withToken:(NSString *)token
{
    MessageHistory *h = [[MessageHistory alloc] init];
    NSURL *messagehistoryURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/messages/%@/history?access_token=%@", baseUrl, idenM, token]];
    
    NSData *messagehistoryData = [NSData dataWithContentsOfURL:messagehistoryURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagehistoryData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagehistoryDict = [NSJSONSerialization JSONObjectWithData:messagehistoryData options:0 error:nil];
    
    if ([messagehistoryDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagehistoryDict valueForKey:@"error"], [messagehistoryDict valueForKey:@"error_description"]);
        return h;
    }
    
    [h setDatos:messagehistoryDict];
    return h;

}


/**
 * Get message's historic actions from a folder of a communication's resource (board, debate, forum) of the subject.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenS Subject's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param idenF Folder's identifier.
 * @param idenM Message's identifier.
 * @param token the token obtained with the autentication
 * @return MessageHistory object with message's historic actions.
 */
-(MessageHistory *) getSubjectsIdBoardsIdFoldersIdMessagesIdHistory:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token
{
    MessageHistory *h = [[MessageHistory alloc] init];
    NSURL *messagehistoryURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/folders/%@/messages/%@/history?access_token=%@", baseUrl , idenS, idenB, idenF, idenM, token]];
    
    NSData *messagehistoryData = [NSData dataWithContentsOfURL:messagehistoryURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagehistoryData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagehistoryDict = [NSJSONSerialization JSONObjectWithData:messagehistoryData options:0 error:nil];
    
    if ([messagehistoryDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagehistoryDict valueForKey:@"error"], [messagehistoryDict valueForKey:@"error_description"]);
        return h;
    }
    
    [h setDatos:messagehistoryDict];
    return h;
}

@end
