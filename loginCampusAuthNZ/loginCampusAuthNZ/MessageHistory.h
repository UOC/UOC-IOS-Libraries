//
//  MessageHistory.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageHistoryDetail.h"
#import "Constants.h"

@interface MessageHistory : NSObject

@property (nonatomic, retain) NSString *identifier; // Message's identifier.
@property (nonatomic, retain) NSMutableArray *details; // Action list.

-(void) setDatos:(NSDictionary *)historyDictionary;

-(MessageHistory *) getClassroomsIdBoardsIdFoldersIdMessagesIdHistory:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token;

-(MessageHistory *) getMailMessagesIdHistory:(NSString *)idenM withToken:(NSString *)token;

-(MessageHistory *) getSubjectsIdBoardsIdFoldersIdMessagesIdHistory:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token;


@end
