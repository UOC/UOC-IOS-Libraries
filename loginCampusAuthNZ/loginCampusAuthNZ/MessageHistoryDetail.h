//
//  MessageHistoryDetail.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageHistoryDetail : NSObject

@property (nonatomic, retain) NSString *action; //Action.
@property (nonatomic, retain) NSString *date; //Date.
@property (nonatomic, retain) NSString *name; //Name.
@property (nonatomic, retain) NSString *time; //Hora.

-(void) setDatos:(NSDictionary *)detailDictionary;

@end
