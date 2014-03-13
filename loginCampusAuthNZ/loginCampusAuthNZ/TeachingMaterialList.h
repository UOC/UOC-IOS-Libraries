//
//  TeachingMaterialList.h
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TeachingMaterial.h"
#import "Constants.h"

@interface TeachingMaterialList : NSObject

@property (nonatomic, retain) NSMutableArray *materials;

- (void)setDatos:(NSDictionary *)dict;

- (NSMutableArray *) getClassroomsIdMaterials:(NSString *)idenC withToken:(NSString *)token;

@end
