//
//  MobileResourceList.h
//  loginCampusAuthNZ
//
//  Created by UOC on 14/03/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "MobileResource.h"

@interface MobileResourceList : NSObject

@property (nonatomic, retain) NSMutableArray *mobileResources;

- (void)setDatos:(NSDictionary *)dict;

- (NSMutableArray *) getMobileResources:(NSString *)token;

@end
