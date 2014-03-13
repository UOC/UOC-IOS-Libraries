//
//  Message.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface Message : NSObject

@property (nonatomic, retain) NSString *identifier; //Message's identifier.
@property (nonatomic, retain) NSString *subject; //Message's subject.
@property (nonatomic, retain) NSString *snippet; //First characters of the message.
@property (nonatomic, retain) NSString *date; //Message's date.
@property (nonatomic, retain) NSNumber *color; //Color mark of the message.
@property (nonatomic, retain) NSNumber *status; //Message's status.
@property (nonatomic, retain) NSString *from; //Message's sender.
@property (nonatomic, retain) NSString *to; //Message's recipients.
@property (nonatomic, retain) NSString *cc; //Message's copy recipients.
@property (nonatomic, retain) NSString *body; //Message's body.

-(void) setDatos:(NSDictionary *)messageDictionary;

-(Message *) getClassroomIdBoardsIdMessagesId:(NSString *)idenC BoardId:(NSString *)idenB MessageId:(NSString *)idenM withToken:(NSString *)token;

-(Message *) getClassroomIdBoardsIdFoldersIdMessagesId:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token;

-(Message *) getMailMessagesId:(NSString *)idenM withToken:(NSString *)token;

-(Message *) getSubjectsIdBoardsIdMessagesId:(NSString *)idenS BoardId:(NSString *)idenB MessageId:(NSString *)idenM withToken:(NSString *)token;

-(Message *) getSubjectsIdBoardsIdFoldersIdMessagesId:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token;

-(Message *) postClassroomsIdBoardsIdMessages:(NSString *)idenC BoardId:(NSString *)idenB Message:(Message *)postMessage withToken:(NSString *)token;

-(Message *) postMailMessages:(Message *)postMessage withToken:(NSString *)token;

-(Message *) postSubjectsIdBoardsIdMessages:(NSString *)idenS BoardId:(NSString *)idenB Message:(Message *)postMessage withToken:(NSString *)token;
@end
