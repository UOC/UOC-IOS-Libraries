//
//  Person.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Profile.h"
#import "Constants.h"

@interface Person : NSObject

@property (nonatomic, retain) NSString *identifier; //Person's Identifier.
@property (nonatomic, retain) NSString *username; //Person's username
@property (nonatomic, retain) NSString *name; //Person's Name.
@property (nonatomic, retain) NSString *surname1; //Person's first surname.
@property (nonatomic, retain) NSString *surname2; //Person's last surname.
@property (nonatomic, retain) NSString *email; //Person's email address.
@property (nonatomic, retain) NSMutableArray *profiles; //Person's profile list.
@property (nonatomic, retain) NSString *userNumber; //Person's number inside Campus
@property (nonatomic, retain) NSString *hobbies; //Person's hobbies.
@property (nonatomic, retain) NSString *skills; //Person's competences
@property (nonatomic, retain) NSString *about; //Person's about text.
@property (nonatomic, retain) NSString *NGOes; //NGO where person is involved.
@property (nonatomic, retain) NSString *languages; //Person's speaking languages.
@property (nonatomic, retain) NSString *secondaryEmail; //Person's alternative email address.
@property (nonatomic, retain) NSString *blog; //Person's blog.
@property (nonatomic, retain) NSString *personalSite; //Person's personal website.
@property (nonatomic, retain) NSDate *lastUpdate; //Date when the public data of the person were last updated.

-(void) setDatos:(NSDictionary *) personDictionary;

-(Person *) getPeopleId:(NSString *)iden withToken:(NSString *)token;

@end
