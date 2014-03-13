//
//  MessageBody.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MessageBody.h"

@implementation MessageBody

-(void) setDatos:(NSDictionary *)bodyDictionary
{
    self.identifier = [bodyDictionary objectForKey:@"id"];
    self.body = [bodyDictionary objectForKey:@"body"];
}


/**
 * Get body of a message from a folder of a communication's resource (board, debate, forum) of the classroom.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenC Classroom's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param idenF Folder's identifier.
 * @param idenM Message's identifier.
 * @param token the token obtained with the autentication
 * @return MessageBody object with the body of the message.
 */
-(MessageBody *) getClassroomsIdBoardsIdFoldersIdMessagesIdBody:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token
{
    MessageBody *b = [[MessageBody alloc] init];
    NSURL *messagebodyURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/folders/%@/messages/%@/body?access_token=%@", baseUrl , idenC, idenB, idenF, idenM, token]];

    NSData *messagebodyData = [NSData dataWithContentsOfURL:messagebodyURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagebodyData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagebodyDict = [NSJSONSerialization JSONObjectWithData:messagebodyData options:0 error:nil];
    
    if ([messagebodyDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagebodyDict valueForKey:@"error"], [messagebodyDict valueForKey:@"error_description"]);
        return b;
    }
    
    [b setDatos:messagebodyDict];
    return b;
}


/**
 * Get the body of the message with id as identifier.
 * The user must have given the application the grant READ_MAIL to use these operation.
 *
 * @param idenM Message identifier.
 * @param token the token obtained with the autentication
 * @return MessageBody object with the body of the message.
 */
-(MessageBody *) getMailMessagesIdBody:(NSString *)idenM withToken:(NSString *)token
{
    MessageBody *b = [[MessageBody alloc] init];
    NSURL *messagebodyURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/messages/%@/body?access_token=%@", baseUrl ,  idenM, token]];
    
    NSData *messagebodyData = [NSData dataWithContentsOfURL:messagebodyURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagebodyData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagebodyDict = [NSJSONSerialization JSONObjectWithData:messagebodyData options:0 error:nil];
    
    if ([messagebodyDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagebodyDict valueForKey:@"error"], [messagebodyDict valueForKey:@"error_description"]);
        return b;
    }
    
    [b setDatos:messagebodyDict];
    return b;
}


/**
 * Get body of a message from a folder of a communication's resource (board, debate, forum) of the subject.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenS Subject's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param idenF Folder's identifier.
 * @param idenM Message's identifier.
 * @param token the token obtained with the autentication
 * @return MessageBody object with the body of the message.
 */
-(MessageBody *) getSubjectsIdBoardsIdFoldersIdMessagesIdBody:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token
{
    MessageBody *b = [[MessageBody alloc] init];
    NSURL *messagebodyURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/folders/%@/messages/%@/body?access_token=%@", baseUrl , idenS, idenB, idenF, idenM, token]];
    
    NSData *messagebodyData = [NSData dataWithContentsOfURL:messagebodyURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagebodyData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagebodyDict = [NSJSONSerialization JSONObjectWithData:messagebodyData options:0 error:nil];
    
    if ([messagebodyDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagebodyDict valueForKey:@"error"], [messagebodyDict valueForKey:@"error_description"]);
        return b;
    }
    
    [b setDatos:messagebodyDict];
    return b;
}
@end
