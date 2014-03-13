//
//  MessageBody.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface MessageBody : NSObject

@property (nonatomic, retain) NSString *identifier; //Message's identifier.
@property (nonatomic, retain) NSString *body; //Message's body.

-(void) setDatos:(NSDictionary *) bodyDictionary;

-(MessageBody *) getClassroomsIdBoardsIdFoldersIdMessagesIdBody:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token;

-(MessageBody *) getMailMessagesIdBody:(NSString *)idenM withToken:(NSString *)token;

-(MessageBody *) getSubjectsIdBoardsIdFoldersIdMessagesIdBody:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token;

@end
