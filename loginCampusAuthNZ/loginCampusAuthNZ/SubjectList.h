//
//  SubjectList.h
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Subject.h"
#import "Constants.h"

@interface SubjectList : NSObject

@property (nonatomic, retain) NSMutableArray *subjects;

- (void)setDatos:(NSDictionary *)dict;

- (NSMutableArray *) getSubjects:(NSString *)token;


@end
