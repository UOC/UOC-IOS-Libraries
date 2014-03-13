//
//  Setting.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingValue.h"

@interface Setting : NSObject

@property (nonatomic, retain) NSString *identifier; //Setting identifier.
@property (nonatomic, retain) NSString *title; //Setting title.
@property (nonatomic, retain) NSString *description; //Setting description.
@property (nonatomic, retain) NSString *section; //Setting section.
@property (nonatomic, retain) NSString *url; //Configuration URL of the setting (optional).
@property (nonatomic, retain) NSString *value; //Current value of the settting. It doesn't make sense if URL field has value.
@property (nonatomic, retain) NSMutableArray *values; //Available vallues for the setting.

-(void) setDatos:(NSDictionary *) settingDictionary;

@end
