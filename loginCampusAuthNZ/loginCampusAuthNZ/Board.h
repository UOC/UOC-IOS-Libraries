//
//  Board.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface Board : NSObject

@property (nonatomic, retain) NSString *identifier; //Identifier of the communication's resource.
@property (nonatomic, retain) NSString *subtype; //Subtype of resource.
@property (nonatomic, retain) NSString *title; //Title of the communication's resource.
@property (nonatomic, retain) NSString *code; //Code of the communciation's resource. Used to compose the resource's URL
@property (nonatomic, retain) NSString *domainId; //Identifier of the classroom where this resource is in.
@property (nonatomic, retain) NSNumber *unreadMessages; //Number of unread messages.
@property (nonatomic, retain) NSNumber *totalMessages; //Number of messages.

- (void) setDatos:(NSDictionary *)boardDictionary;

- (Board *) getClassroomsIdBoardsId:(NSString *)idenC BoardId:(NSString *)idenB withToken:(NSString *)token;

- (Board *) getSubjectsIdBoardsId:(NSString *)idenS BoardId:(NSString *)idenB withToken:(NSString *)token;
@end
