//
//  PersonList.h
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Constants.h"

@interface PersonList : NSObject

@property (nonatomic, retain) NSMutableArray *people;

- (void)setDatos:(NSDictionary *)dict;

- (NSMutableArray *) getPeople:(NSString *)token;


@end
