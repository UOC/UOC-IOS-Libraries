//
//  Message.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Message.h"

@implementation Message

-(void) setDatos:(NSDictionary *)messageDictionary
{
    self.identifier = [messageDictionary objectForKey:@"id"];
    self.subject = [messageDictionary objectForKey:@"subject"];
    self.snippet = [messageDictionary objectForKey:@"snippet"];
    self.date = [messageDictionary objectForKey:@"date"];
    self.color = [messageDictionary objectForKey:@"color"];
    self.status = [messageDictionary objectForKey:@"status"];
    self.from = [messageDictionary objectForKey:@"from"];
    self.to = [messageDictionary objectForKey:@"to"];
    self.cc = [messageDictionary objectForKey:@"cc"];
    self.body = [messageDictionary objectForKey:@"body"];
}


/**
 * Get message's metadata of a communication's resource (board, debate, forum) of the classroom.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenC Clasrooms's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param idenM Message's identifier.
 * @param token the token obtained with the autentication
 * @return Message object with the message's metadata.
 */
-(Message *) getClassroomIdBoardsIdMessagesId:(NSString *)idenC BoardId:(NSString *)idenB MessageId:(NSString *)idenM withToken:(NSString *)token
{
    Message *m = [[Message alloc] init];
    
    NSURL *messageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/messages/%@?access_token=%@", baseUrl , idenC, idenB, idenM, token]];
    
    
    NSData *messageData = [NSData dataWithContentsOfURL:messageURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messageData encoding:NSUTF8StringEncoding]);
    NSDictionary *messageDict = [NSJSONSerialization JSONObjectWithData:messageData options:0 error:nil];
    
    if ([messageDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messageDict valueForKey:@"error"], [messageDict valueForKey:@"error_description"]);
        return m;
    }
    
    [m setDatos:messageDict];
    
    return m;
}


/**
 * Get the message's metadata from a folder of a communication's resource (board, debate, forum) of the classroom.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenC Clasrooms's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param idenF Folder's identifier.
 * @param idenM Message's identifier.
 * @param token the token obtained with the autentication
 * @return Message object with the message's metadata.
 */
-(Message *) getClassroomIdBoardsIdFoldersIdMessagesId:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token
{
    Message *m = [[Message alloc] init];
    
    NSURL *messageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/folders/%@/messages/%@?access_token=%@", baseUrl , idenC, idenB, idenF, idenM, token]];
    
    
    NSData *messageData = [NSData dataWithContentsOfURL:messageURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messageData encoding:NSUTF8StringEncoding]);
    NSDictionary *messageDict = [NSJSONSerialization JSONObjectWithData:messageData options:0 error:nil];
    
    if ([messageDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messageDict valueForKey:@"error"], [messageDict valueForKey:@"error_description"]);
        return m;
    }
    
    [m setDatos:messageDict];
    
    return m;
}


/**
 * Get message's metadata.
 * The user must have given the application the grant READ_MAIL to use these operation.
 *
 * @param idenM Message's identifier.
 * @param token the token obtained with the autentication
 * @return Message object with the message.
 */
-(Message *) getMailMessagesId:(NSString *)idenM withToken:(NSString *)token
{
    Message *m = [[Message alloc] init];
    
    NSURL *messageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/messages/%@?access_token=%@", baseUrl , idenM, token]];
    
    
    NSData *messageData = [NSData dataWithContentsOfURL:messageURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messageData encoding:NSUTF8StringEncoding]);
    NSDictionary *messageDict = [NSJSONSerialization JSONObjectWithData:messageData options:0 error:nil];
    
    if ([messageDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messageDict valueForKey:@"error"], [messageDict valueForKey:@"error_description"]);
        return m;
    }
    
    [m setDatos:messageDict];
    
    return m;
}


/**
 * Get message's metadata of a communication's resource (board, debate, forum) of the subject.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenS Subject's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param idenM Message's identifier.
 * @param token the token obtained with the autentication
 * @return Message object with the message's metadata.
 */
-(Message *) getSubjectsIdBoardsIdMessagesId:(NSString *)idenS BoardId:(NSString *)idenB MessageId:(NSString *)idenM withToken:(NSString *)token
{
    Message *m = [[Message alloc] init];
    
    NSURL *messageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/messages/%@?access_token=%@", baseUrl , idenS, idenB, idenM, token]];
    
    
    NSData *messageData = [NSData dataWithContentsOfURL:messageURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messageData encoding:NSUTF8StringEncoding]);
    NSDictionary *messageDict = [NSJSONSerialization JSONObjectWithData:messageData options:0 error:nil];
    
    if ([messageDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messageDict valueForKey:@"error"], [messageDict valueForKey:@"error_description"]);
        return m;
    }
    
    [m setDatos:messageDict];
    
    return m;
}


/**
 * Get the message's metadata from a folder of a communication's resource (board, debate, forum) of the subject.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenS Subject's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param idenF Folder's identifier.
 * @param idenM Message's identifier.
 * @param token the token obtained with the autentication
 * @return Message object with the message's metadata.
 */
-(Message *) getSubjectsIdBoardsIdFoldersIdMessagesId:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token
{
    Message *m = [[Message alloc] init];
    
    NSURL *messageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/folders/%@/messages/%@?access_token=%@", baseUrl , idenS, idenB, idenF, idenM, token]];
    
    
    NSData *messageData = [NSData dataWithContentsOfURL:messageURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messageData encoding:NSUTF8StringEncoding]);
    NSDictionary *messageDict = [NSJSONSerialization JSONObjectWithData:messageData options:0 error:nil];
    
    if ([messageDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messageDict valueForKey:@"error"], [messageDict valueForKey:@"error_description"]);
        return m;
    }
    
    [m setDatos:messageDict];
    
    return m;
}


/**
 * Send a new mail message to a communication's resource (board, debate, forum) of the classroom.
 * The user must have given the application the grant SEND_BOARD to use these operation.
 *
 * @param idenC Clasrooms's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param postMessage Message object with the data of the messagen to send (recipients, subject, etc).
 * @param token the token obtained with the autentication
 * @return Message object with the created message.
 */
-(Message *) postClassroomsIdBoardsIdMessages:(NSString *)idenC BoardId:(NSString *)idenB Message:(Message *)postMessage withToken:(NSString *)token
{
    Message *m = [[Message alloc] init];
    
    NSDictionary *nouMessage = @{@"id":postMessage.identifier, @"subject":postMessage.subject, @"snippet":postMessage.snippet, @"date":postMessage.date, @"color":postMessage.color, @"status":postMessage.status, @"from":postMessage.from, @"to":postMessage.to, @"cc":postMessage.cc, @"body":postMessage.body};
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:nouMessage options:NSJSONWritingPrettyPrinted error:nil];
    NSURL *messageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/messages?access_token=%@", baseUrl, idenC, idenB, token]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:messageURL];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:jsonData];
    
    
    //Fem el request de manera syncrona.
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    NSDictionary *messageDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if ([messageDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messageDict valueForKey:@"error"], [messageDict valueForKey:@"error_description"]);
        return m;
    }
    
    // Afegim els valors que ens ha tornat en un missatge que retornem.
    [m setDatos:messageDict];
    
    return m;
    
}


/**
 * Send a new mail message.
 * The user must have given the application the grant SEND_MAIL to use these operation.
 *
 * @param postMessage Message object with the data of the messagen to send (recipients, subject, etc).
 * @param token the token obtained with the autentication
 * @return Message object with the created message.
 */
-(Message *) postMailMessages:(Message *)postMessage withToken:(NSString *)token
{
    Message *m = [[Message alloc] init];
    
    NSDictionary *nouMessage = @{@"id":postMessage.identifier, @"subject":postMessage.subject, @"snippet":postMessage.snippet, @"date":postMessage.date, @"color":postMessage.color, @"status":postMessage.status, @"from":postMessage.from, @"to":postMessage.to, @"cc":postMessage.cc, @"body":postMessage.body};
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:nouMessage options:NSJSONWritingPrettyPrinted error:nil];
    NSURL *messageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/messages?access_token=%@", baseUrl, token]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:messageURL];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:jsonData];
    
    
    //Fem el request de manera syncrona.
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    NSDictionary *messageDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if ([messageDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messageDict valueForKey:@"error"], [messageDict valueForKey:@"error_description"]);
        return m;
    }
    
    // Afegim els valors que ens ha tornat en un missatge que retornem.
    [m setDatos:messageDict];
    
    return m;
}


/**
 * Send a new mail message to a communication's resource (board, debate, forum) of the subject.
 * The user must have given the application the grant SEND_BOARD to use these operation.
 *
 * @param idenS Subject's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param postMessage Message object with the data of the messagen to send (recipients, subject, etc).
 * @param token the token obtained with the autentication
 * @return Message object with the created message.
 */
-(Message *) postSubjectsIdBoardsIdMessages:(NSString *)idenS BoardId:(NSString *)idenB Message:(Message *)postMessage withToken:(NSString *)token
{
    Message *m = [[Message alloc] init];
    
    NSDictionary *nouMessage = @{@"id":postMessage.identifier, @"subject":postMessage.subject, @"snippet":postMessage.snippet, @"date":postMessage.date, @"color":postMessage.color, @"status":postMessage.status, @"from":postMessage.from, @"to":postMessage.to, @"cc":postMessage.cc, @"body":postMessage.body};
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:nouMessage options:NSJSONWritingPrettyPrinted error:nil];
    NSURL *messageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/messages?access_token=%@", baseUrl, idenS, idenB, token]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:messageURL];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:jsonData];
    
    
    //Fem el request de manera syncrona.
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    NSDictionary *messageDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if ([messageDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messageDict valueForKey:@"error"], [messageDict valueForKey:@"error_description"]);
        return m;
    }
    
    // Afegim els valors que ens ha tornat en un missatge que retornem.
    [m setDatos:messageDict];
    
    return m;
}

@end
