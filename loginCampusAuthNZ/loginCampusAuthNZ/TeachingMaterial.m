//
//  TeachingMaterial.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "TeachingMaterial.h"

@implementation TeachingMaterial

-(void) setDatos:(NSDictionary *)materialDictionary
{
    self.identifier = [materialDictionary objectForKey:@"id"];
    self.type = [materialDictionary objectForKey:@"type"];
    self.title = [materialDictionary objectForKey:@"title"];
    self.url = [materialDictionary objectForKey:@"url"];
}


/**
 * Get a learning material from the classroom.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param idenC Clasrooms's identifier
 * @param idenM Learning material's identifier.
 * @param token the token obtained with the autentication
 * @return TeachingMaterial object with the learning material or null if it doesn't exist.
 */
-(TeachingMaterial *) getClassroomsIdMaterialsId:(NSString *)idenC MaterialId:(NSString *)idenM withToken:(NSString *)token
{
    TeachingMaterial *m = [[TeachingMaterial alloc] init];
    
    NSURL *materialURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/materials/%@?access_token=%@", baseUrl , idenC, idenM, token]];
    
    
    NSData *materialData = [NSData dataWithContentsOfURL:materialURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:materialData encoding:NSUTF8StringEncoding]);
    NSDictionary *materialDict = [NSJSONSerialization JSONObjectWithData:materialData options:0 error:nil];
    
    if ([materialDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [materialDict valueForKey:@"error"], [materialDict valueForKey:@"error_description"]);
        return m;
    }
    
    [m setDatos:materialDict];
    
    return m;
}


/**
 * Create a new learning material inside the classroom. The user must be a lecturer of the classroom to be able to create the learning material.
 * The user must have given the application the grant WRITE to use these operation.
 *
 * @param idenC Clasrooms's identifier
 * @param postMaterial Learning material to create.
 * @param token the token obtained with the autentication
 * @return Learning material newly created.
 */
-(TeachingMaterial *) postClassroomsIdMaterials:(NSString *)idenC material:(TeachingMaterial *)postMaterial withToken:(NSString *)token
{
    TeachingMaterial *m = [[TeachingMaterial alloc] init];
    
    NSDictionary *nouMaterial = @{@"id":postMaterial.identifier,@"type":postMaterial.type,@"title":postMaterial.title,@"url":postMaterial.url};
   
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:nouMaterial options:NSJSONWritingPrettyPrinted error:nil];
    NSURL *materialsURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/materials?access_token=%@", baseUrl, idenC, token]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:materialsURL];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:jsonData];
    
    
    //Fem el request de manera syncrona.
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    NSDictionary *materialDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if ([materialDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [materialDict valueForKey:@"error"], [materialDict valueForKey:@"error_description"]);
        return m;
    }
    
    // Afegim els valors que ens ha tornat en un material que retornem.
    [m setDatos:materialDict];
    
    return m;
}
@end
