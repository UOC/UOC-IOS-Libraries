//
//  MessageList.m
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MessageList.h"

@implementation MessageList

- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *message in [dict objectForKey:@"messages"]) {
        Message *m = [[Message alloc] init];
        [m setDatos:message];
        [self.messages addObject:m];
    }
}


/**
 * Get the list of messages of the Inbox folder of a communication's resource (board, debate, forum) of the classroom.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenC Clasrooms's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param token the token obtained with the autentication
 * @return Array of Messages with the messages of the Inbox folder of the communication's resource.
 */
- (NSMutableArray *) getClassroomsIdBoardsIdMessages:(NSString *)idenC BoardId:(NSString *)idenB withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/messages?access_token=%@", baseUrl,idenC, idenB, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}


/**
 * Get the list of unread messages of the Inbox folder of a communication's resource (board, debate, forum) of the classroom.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenC Clasrooms's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param token the token obtained with the autentication
 * @return Array of Messages with the unread messages of the Inbox folder of the communication's resource.
 */
- (NSMutableArray *) getClassroomsIdBoardsIdMessagesUnread:(NSString *)idenC BoardId:(NSString *)idenB withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/messages/unread?access_token=%@", baseUrl,idenC, idenB, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}


/**
 * Get the list of messages of a folder from a communication's resource (board, debate, forum) of the classroom.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenC Clasrooms's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param idenF Folder's identifier.
 * @param token the token obtained with the autentication
 * @return Array of Messages with the messages of the given folder of the communication's resource.
 */
- (NSMutableArray *) getClassroomsIdBoardsIdFoldersIdMessages:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/folders/%@/messages?access_token=%@", baseUrl,idenC, idenB, idenF, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}


/**
 * Get the list of unread messages of a folder from a communication's resource (board, debate, forum) of the classroom.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenC Clasrooms's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param idenF Folder's identifier.
 * @param token the token obtained with the autentication
 * @return Array of Messages with the messages of the given folder of the communication's resource.
 */
- (NSMutableArray *) getClassroomsIdBoardsIdFoldersIdMessagesUnread:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/folders/%@/messages/unread?access_token=%@", baseUrl,idenC, idenB, idenF, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}


/**
 * Get the messages of folder Inbox.
 * The user must have given the application the grant READ_MAIL to use these operation.
 *
 * @param token the token obtained with the autentication
 * @return Array with the messages of the Inbox folder.
 */
- (NSMutableArray *) getMailMessages:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/messages?access_token=%@", baseUrl, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}


/**
 * Get the unread messages of folder Inbox.
 * The user must have given the application the grant READ_MAIL to use these operation.
 *
 * @param token the token obtained with the autentication
 * @return Array with the unread messages of the Inbox folder.
 */
- (NSMutableArray *) getMailMessagesUnread:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/messages/unread?access_token=%@", baseUrl, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}


/**
 * Get the messages of folder id.
 * The user must have given the application the grant READ_MAIL to use these operation.
 *
 * @param idenF Folder's identifier.
 * @param token the token obtained with the autentication
 * @return Array with the messages of the given folder.
 */
- (NSMutableArray *) getMailFoldersIdMessages:(NSString *)idenF withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/folders/%@/messages?access_token=%@", baseUrl, idenF,token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}


/**
 * Get the unread messages of folder id.
 * The user must have given the application the grant READ_MAIL to use these operation.
 *
 * @param idenF Folder's identifier.
 * @param token the token obtained with the autentication
 * @return Array with the unread messages of the given folder.
 */
- (NSMutableArray *) getMailFoldersIdMessagesUnread:(NSString *)idenF withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/folders/%@/messages/unread?access_token=%@", baseUrl, idenF,token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}


/**
 * Get the list of messages of the Inbox folder of a communication's resource (board, debate, forum) of the subject.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenS Subject's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param token the token obtained with the autentication
 * @return Array of Messages with the messages of the Inbox folder of the communication's resource.
 */
- (NSMutableArray *) getSubjectsIdBoardsIdMessages:(NSString *)idenS BoardId:(NSString *)idenB withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/messages?access_token=%@", baseUrl, idenS, idenB, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}


/**
 * Get the list of unread messages of the Inbox folder of a communication's resource (board, debate, forum) of the subject.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenS Subject's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param token the token obtained with the autentication
 * @return Array of Messages with the unread messages of the Inbox folder of the communication's resource.
 */
- (NSMutableArray *) getSubjectsIdBoardsIdMessagesUnread:(NSString *)idenS BoardId:(NSString *)idenB withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/messages/unread?access_token=%@", baseUrl, idenS, idenB, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}


/**
 * Get the list of messages of a folder from a communication's resource (board, debate, forum) of the subject.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenS Subject's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param idenF Folder's identifier.
 * @param token the token obtained with the autentication
 * @return Array of Messages with the messages of the given folder of the communication's resource.
 */
- (NSMutableArray *) getSubjectsIdBoardsIdFoldersIdMessages:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/folders/%@/messages?access_token=%@", baseUrl, idenS, idenB, idenF, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}


/**
 * Get the list of unread messages of a folder from a communication's resource (board, debate, forum) of the subject.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenS Subject's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param idenF Folder's identifier.
 * @param token the token obtained with the autentication
 * @return Array of Messages with the unread messages of the given folder of the communication's resource.
 */
- (NSMutableArray *) getSubjectsIdBoardsIdFoldersIdMessagesUnread:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/folders/%@/messages/unread?access_token=%@", baseUrl, idenS, idenB, idenF, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}

@end
