//
//  FolderList.h
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Folder.h"
#import "Constants.h"

@interface FolderList : NSObject

@property (nonatomic, retain) NSMutableArray *folders;

- (void)setDatos:(NSDictionary *)dict;

- (NSMutableArray *) getClassroomsIdBoardsIdFolders:(NSString *)idenC BoardId:(NSString *)idenB withToken:(NSString *)token;

- (NSMutableArray *) getMailFolders:(NSString *)token;

- (NSMutableArray *) getSubjectsIdBoardsIdFolders:(NSString *)idenS BoardId:(NSString *)idenB withToken:(NSString *)token;

@end
