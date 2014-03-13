//
//  SettingList.h
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Setting.h"
#import "Constants.h"

@interface SettingList : NSObject

@property (nonatomic, retain) NSMutableArray *settings;

- (void)setDatos:(NSDictionary *)dict;

- (NSMutableArray *) getUserSettings:(NSString *)token;

@end
