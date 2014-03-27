//
//  MobileResource.h
//  loginCampusAuthNZ
//
//  Created by UOC on 14/03/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface MobileResource : NSObject

@property (nonatomic, retain) NSString *ident;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *urlIOS;
@property (nonatomic, retain) NSString *urlMarketIOS;
@property (nonatomic, retain) NSString *nameIOS;
@property (nonatomic, retain) NSString *logoIOS;
@property (nonatomic, retain) NSString *descriptionIOS;
@property (nonatomic, retain) NSString *urlAndroid;
@property (nonatomic, retain) NSString *urlMarketAndroid;
@property (nonatomic, retain) NSString *nameAndroid;
@property (nonatomic, retain) NSString *logoAndroid;
@property (nonatomic, retain) NSString *descriptionAndroid;
//@property (nonatomic, retain) UIImage *photo; // UIImage version of photoUrl

- (void) setDatos:(NSDictionary *)mobileResourcesDictionary;

-(MobileResource *) getMobileResourcesId:(NSString *)idenR withToken:(NSString *)token;

-(MobileResource *) getMobileResourcesByType:(NSString *)type withToken:(NSString *)token;

@end
