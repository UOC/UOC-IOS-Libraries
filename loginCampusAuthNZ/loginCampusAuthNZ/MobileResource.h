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
@property (nonatomic, retain) NSString *url_ios;
@property (nonatomic, retain) NSString *url_market_ios;
@property (nonatomic, retain) NSString *name_ios;
@property (nonatomic, retain) NSString *logo_ios;
@property (nonatomic, retain) NSString *info_ios;
@property (nonatomic, retain) NSString *url_android;
@property (nonatomic, retain) NSString *url_market_android;
@property (nonatomic, retain) NSString *name_android;
@property (nonatomic, retain) NSString *logo_android;
@property (nonatomic, retain) NSString *info_android;
//@property (nonatomic, retain) UIImage *photo; // UIImage version of photoUrl

- (void) setDatos:(NSDictionary *)mobileResourcesDictionary;

-(MobileResource *) getMobileResourcesId:(NSString *)idenR withToken:(NSString *)token;

-(MobileResource *) getMobileResourcesByType:(NSString *)type withToken:(NSString *)token;

@end
