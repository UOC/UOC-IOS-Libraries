//
//  BoardList.h
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"
#import "Constants.h"


@interface BoardList : NSObject

@property (nonatomic, retain) NSMutableArray *boards;

- (void)setDatos:(NSDictionary *)dict;

- (NSMutableArray *) getClassroomsIdBoards:(NSString *)idenC withToken:(NSString *)token;

- (NSMutableArray *) getSubjectsIdBoards:(NSString *)idenS withToken:(NSString *)token;

@end
