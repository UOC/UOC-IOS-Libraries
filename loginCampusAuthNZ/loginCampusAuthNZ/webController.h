//
//  webController.h
//  loginCampusAuthNZ
//
//  Created by UOC on 17/02/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface webController : UIViewController<UIWebViewDelegate, NSURLConnectionDataDelegate,  NSURLConnectionDelegate>

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, retain) NSData *rebut;
@property (nonatomic, weak) NSString *extra;

- (void)accessTokenGET:(NSString *)code;

@end

typedef NS_ENUM(NSInteger, OAPIConnectionType) {
    OAPIConnectionRequestType,
    OAPIConnectionTokenExchangeType,
    OAPIConnectionTokenRenewType
};

@interface OpenAPIURLConnection : NSURLConnection

@property (strong, nonatomic) NSString *rId;
@property (assign, nonatomic) OAPIConnectionType requestType;
@property (strong, nonatomic) NSString *notification;

@end
