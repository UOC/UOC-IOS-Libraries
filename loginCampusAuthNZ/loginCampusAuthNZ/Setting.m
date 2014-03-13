//
//  Setting.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Setting.h"

@implementation Setting

-(void) setDatos:(NSDictionary *)settingDictionary
{
    self.values = [[NSMutableArray alloc] init];
    
    self.identifier = [settingDictionary objectForKey:@"id"];
    self.title = [settingDictionary objectForKey:@"title"];
    self.description = [settingDictionary objectForKey:@"description"];
    self.section = [settingDictionary objectForKey:@"section"];
    self.url = [settingDictionary objectForKey:@"url"];
    self.value = [settingDictionary objectForKey:@"value"];
    for (NSDictionary *val in [settingDictionary objectForKey:@"values"])
    {
        SettingValue *v = [[SettingValue alloc]init];
        [v setDatos:val];
        [self.values addObject:v];
    }
}

@end
