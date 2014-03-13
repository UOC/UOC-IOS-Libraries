//
//  MessageHistoryDetail.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MessageHistoryDetail.h"

@implementation MessageHistoryDetail

-(void) setDatos:(NSDictionary *)detailDictionary
{
    self.action = [detailDictionary objectForKey:@"action"];
    self.date = [detailDictionary objectForKey:@"date"];
    self.name = [detailDictionary objectForKey:@"name"];
    self.time = [detailDictionary objectForKey:@"time"];
}

@end
