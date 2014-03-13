//
//  Resource.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Resource.h"

@implementation Resource

-(void) setDatos:(NSDictionary *)resourceDictionary
{
    self.identifier = [resourceDictionary objectForKey:@"id"];
    self.type = [resourceDictionary objectForKey:@"type"];
    self.subtype = [resourceDictionary objectForKey:@"subtype"];
    self.title = [resourceDictionary objectForKey:@"title"];
    self.code = [resourceDictionary objectForKey:@"code"];
    self.domainId = [resourceDictionary objectForKey:@"domainId"];
}


/**
 * Get the data of a resource of the classroom.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param idenC Clasrooms's identifier
 * @param idenR Resource's identifier.
 * @param token the token obtained with the autentication
 * @return Resource object with resource's data.
 */
-(Resource *) getClassroomsIdResourcesId:(NSString *)idenC ResourceId:(NSString *)idenR withToken:(NSString *)token
{
    Resource *r = [[Resource alloc] init];
    
    NSURL *resourceURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/resources/%@?access_token=%@", baseUrl , idenC, idenR, token]];
    
    
    NSData *resourceData = [NSData dataWithContentsOfURL:resourceURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:resourceData encoding:NSUTF8StringEncoding]);
    NSDictionary *resourceDict = [NSJSONSerialization JSONObjectWithData:resourceData options:0 error:nil];
    
    if ([resourceDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [resourceDict valueForKey:@"error"], [resourceDict valueForKey:@"error_description"]);
        return r;
    }
    
    [r setDatos:resourceDict];
    
    return r;
}


/**
 * Get the data of a resource of the subject.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param idenS Subject's identifier
 * @param idenR Resource's identifier.
 * @param token the token obtained with the autentication
 * @return Resource object with resource's data.
 */
-(Resource *) getSubjectsIdResourcesId:(NSString *)idenS ResourceId:(NSString *)idenR withToken:(NSString *)token
{
    Resource *r = [[Resource alloc] init];
    
    NSURL *resourceURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/resources/%@?access_token=%@", baseUrl , idenS, idenR, token]];
    
    
    NSData *resourceData = [NSData dataWithContentsOfURL:resourceURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:resourceData encoding:NSUTF8StringEncoding]);
    NSDictionary *resourceDict = [NSJSONSerialization JSONObjectWithData:resourceData options:0 error:nil];
    
    if ([resourceDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [resourceDict valueForKey:@"error"], [resourceDict valueForKey:@"error_description"]);
        return r;
    }
    
    [r setDatos:resourceDict];
    
    return r;
}


/**
 * Create a new resource inside the classroom. The user must be a lecturer of the classroom to be able to create the resource.
 * The user must have given the application the grant WRITE to use these operation.
 *
 * @param idenC Clasrooms's identifier
 * @param postResource Resource to create.
 * @param token the token obtained with the autentication
 * @return Created resource.
 */
-(Resource *) postClassroomsIdResources:(NSString *)idenC resource:(Resource *)postResource withToken:(NSString *)token
{
    Resource *r = [[Resource alloc] init];
    
    NSDictionary *nouResource = @{@"id":postResource.identifier, @"type":postResource.type, @"subtype":postResource.subtype, @"title":postResource.title, @"code":postResource.code, @"domainId":postResource.domainId};
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:nouResource options:NSJSONWritingPrettyPrinted error:nil];
    NSURL *resourcesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/resources?access_token=%@", baseUrl, idenC, token]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:resourcesURL];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:jsonData];
    
    
    //Fem el request de manera syncrona.
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    NSDictionary *resouceDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if ([resouceDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [resouceDict valueForKey:@"error"], [resouceDict valueForKey:@"error_description"]);
        return r;
    }
    
    // Afegim els valors que ens ha tornat en un recurs que retornem.
    [r setDatos:resouceDict];
    
    return r;
}

@end
