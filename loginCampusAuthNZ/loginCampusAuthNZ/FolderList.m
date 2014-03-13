//
//  FolderList.m
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import "FolderList.h"

@implementation FolderList

- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *folders in [dict objectForKey:@"folders"]) {
        Folder *f = [[Folder alloc] init];
        [f setDatos:folders];
        [self.folders addObject:f];
    }
}


/**
 * Get the list of folders of a communication's resource (board, debate, forum) of the classroom.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenC Classroom's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param token the token obtained with the autentication
 * @return Array of Folders with the list of folders of the communication's resource.
 */
- (NSMutableArray *) getClassroomsIdBoardsIdFolders:(NSString *)idenC BoardId:(NSString *)idenB withToken:(NSString *)token
{
    self.folders = [[NSMutableArray alloc] init];
    
    NSURL *foldersURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/folders?access_token=%@", baseUrl, idenC, idenB, token]];
    
    NSData *foldersData = [NSData dataWithContentsOfURL:foldersURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:foldersData encoding:NSUTF8StringEncoding]);
    NSDictionary *foldersDict = [NSJSONSerialization JSONObjectWithData:foldersData options:0 error:nil];
    
    if ([foldersDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [foldersDict valueForKey:@"error"], [foldersDict valueForKey:@"error_description"]);
        return self.folders;
    }
    
    [self setDatos:foldersDict];
    
    return self.folders;
}


/**
 * Get the folder list of the user that is using the application.
 * The user must have given the application the grant READ_MAIL to use these operation.
 *
 * @param token the token obtained with the autentication
 * @return Array of Folders with user's folders.
 */
- (NSMutableArray *) getMailFolders:(NSString *)token
{
    self.folders = [[NSMutableArray alloc] init];
    
    NSURL *foldersURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/folders?access_token=%@", baseUrl, token]];
    
    NSData *foldersData = [NSData dataWithContentsOfURL:foldersURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:foldersData encoding:NSUTF8StringEncoding]);
    NSDictionary *foldersDict = [NSJSONSerialization JSONObjectWithData:foldersData options:0 error:nil];
    
    if ([foldersDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [foldersDict valueForKey:@"error"], [foldersDict valueForKey:@"error_description"]);
        return self.folders;
    }
    
    [self setDatos:foldersDict];
    
    return self.folders;
}


/**
 * Get the list of folders of a communication's resource (board, debate, forum) of the subject.
 * The user must have given the application the grant READ_BOARD to use these operation.
 *
 * @param idenS Subject's identifier.
 * @param idenB Identifier of the communication's resource.
 * @param token the token obtained with the autentication
 * @return Array of Folders with the list of folders of the communication's resource.
 */
- (NSMutableArray *) getSubjectsIdBoardsIdFolders:(NSString *)idenS BoardId:(NSString *)idenB withToken:(NSString *)token
{
    self.folders = [[NSMutableArray alloc] init];
    
    NSURL *foldersURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/folders?access_token=%@", baseUrl, idenS, idenB, token]];
    
    NSData *foldersData = [NSData dataWithContentsOfURL:foldersURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:foldersData encoding:NSUTF8StringEncoding]);
    NSDictionary *foldersDict = [NSJSONSerialization JSONObjectWithData:foldersData options:0 error:nil];
    
    if ([foldersDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [foldersDict valueForKey:@"error"], [foldersDict valueForKey:@"error_description"]);
        return self.folders;
    }
    
    [self setDatos:foldersDict];
    
    return self.folders;
}
@end
