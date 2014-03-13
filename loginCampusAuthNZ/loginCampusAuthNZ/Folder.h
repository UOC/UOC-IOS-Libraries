//
//  Folder.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface Folder : NSObject

@property (nonatomic, retain) NSString *identifier; //Folder's identifier.
@property (nonatomic, retain) NSString *name; // Folder's name.
@property (nonatomic, retain) NSNumber *unreadMessages; // Number of unread messages.
@property (nonatomic, retain) NSNumber *totalMessages; // Number of messages.

-(void) setDatos:(NSDictionary *)folderDictionary;

- (Folder *) getClassroomsIdBoardsIdFoldersInbox:(NSString *)idenC BoardId:(NSString *)idenB withToken:(NSString *)token;


- (Folder *) getClassroomsIdBoardsIdFoldersId:(NSString *)idenC BoardId:(NSString *)idenB  FolderId:(NSString *)idenF withToken:(NSString *)token;

- (Folder *) getMailFoldersInbox:(NSString *)token;

- (Folder *) getMailFoldersId:(NSString *)iden withToken:(NSString *)token;

- (Folder *) getSubjectsIdBoardsIdFoldersInbox:(NSString *)idenS BoardId:(NSString *)idenB withToken:(NSString *)token;

- (Folder *) getSubjectsIdBoardsIdFoldersId:(NSString *)idenS BoardId:(NSString *)idenB  FolderId:(NSString *)idenF withToken:(NSString *)token;

- (Folder *) postClassroomsIdBoardsIdMessagesIdMoveId:(NSString *)idenC BoardId:(NSString *)idenB MessageId:(NSString *)idenM Destination:(NSString *)idenDest withToken:(NSString *)token;

- (Folder *) postClassroomsIdBoardsIdFoldersIdMessagesIdMoveId:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM Destination:(NSString *)idenDest withToken:(NSString *)token;

- (Folder *) postMailFolders:(Folder *)postFolder withToken:(NSString *)token;

- (Folder *) postMailMessagesIdMoveId:(NSString *)idenM Destination:(NSString *)idenDest withToken:(NSString *)token;

- (Folder *) postMailFoldersIdMessagesIdMoveId:(NSString *)idenF MessageId:(NSString *)idenM Destination:(NSString *)idenDest withToken:(NSString *)token;

- (Folder *) postSubjectsIdBoardsIdMessagesIdMoveId:(NSString *)idenS BoardId:(NSString *)idenB MessageId:(NSString *)idenM Destination:(NSString *)idenDest withToken:(NSString *)token;

- (Folder *) postSubjectsIdBoardsIdFoldersIdMessagesIdMoveId:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM Destination:(NSString *)idenDest withToken:(NSString *)token;

@end
