//
//  MessageList.h
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"
#import "Constants.h"

@interface MessageList : NSObject

@property (nonatomic, retain) NSMutableArray *messages;

- (void)setDatos:(NSDictionary *)dict;

- (NSMutableArray *) getClassroomsIdBoardsIdMessages:(NSString *)idenC BoardId:(NSString *)idenB withToken:(NSString *)token;

- (NSMutableArray *) getClassroomsIdBoardsIdMessagesUnread:(NSString *)idenC BoardId:(NSString *)idenB withToken:(NSString *)token;

- (NSMutableArray *) getClassroomsIdBoardsIdFoldersIdMessages:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF withToken:(NSString *)token;

- (NSMutableArray *) getClassroomsIdBoardsIdFoldersIdMessagesUnread:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF withToken:(NSString *)token;

- (NSMutableArray *) getMailMessages:(NSString *)token;

- (NSMutableArray *) getMailMessagesUnread:(NSString *)token;

- (NSMutableArray *) getMailFoldersIdMessages:(NSString *)idenF withToken:(NSString *)token;

- (NSMutableArray *) getMailFoldersIdMessagesUnread:(NSString *)idenF withToken:(NSString *)token;

- (NSMutableArray *) getSubjectsIdBoardsIdMessages:(NSString *)idenS BoardId:(NSString *)idenB withToken:(NSString *)token;

- (NSMutableArray *) getSubjectsIdBoardsIdMessagesUnread:(NSString *)idenS BoardId:(NSString *)idenB withToken:(NSString *)token;

- (NSMutableArray *) getSubjectsIdBoardsIdFoldersIdMessages:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF withToken:(NSString *)token;

- (NSMutableArray *) getSubjectsIdBoardsIdFoldersIdMessagesUnread:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF withToken:(NSString *)token;

@end
