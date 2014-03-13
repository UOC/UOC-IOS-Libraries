//
//  SettingValue.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingValue : NSObject

@property (nonatomic, retain) NSString *description; //Description
@property (nonatomic, retain) NSString *value; //Value

-(void) setDatos:(NSDictionary *)valueDictionary;

@end
