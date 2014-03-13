//
//  SettingValue.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "SettingValue.h"

@implementation SettingValue

-(void) setDatos:(NSDictionary *)valueDictionary
{
    self.description = [valueDictionary objectForKey:@"description"];
    self.value = [valueDictionary objectForKey:@"value"];
}

@end
