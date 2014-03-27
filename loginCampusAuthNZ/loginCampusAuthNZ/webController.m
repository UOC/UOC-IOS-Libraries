//
//  webController.m
//  loginCampusAuthNZ
//
//  Created by UOC on 17/02/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import "webController.h"
#import "Constants.h"


@interface webController ()

@end

@implementation webController

@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //NSLog(@"nib - %@",nibNameOrNil);
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self != nil) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.webView.delegate = self;
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    NSURL *urlReq;
    if([stdDefaults objectForKey:@"secret"]==FALSE){
        urlReq= [NSURL URLWithString:[[NSString alloc] initWithFormat:@"%@?%@client_id=%@&redirect_uri=%@&response_type=code",urlAuth, self.extra, idClient, urlRedirect]];
    }
    else{
        PDKeychainBindings *keychainDef = [PDKeychainBindings sharedKeychainBindings];
       
        urlReq= [NSURL URLWithString:[[NSString alloc] initWithFormat:@"%@?%@client_id=%@&redirect_uri=%@&response_type=code",urlAuth, self.extra, [keychainDef objectForKey:@"client"], urlRedirect]];
    }
    NSURLRequest *req = [NSURLRequest requestWithURL:urlReq];
    [self.webView setScalesPageToFit:YES];
    [self.webView loadRequest:req];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) webViewDidFinishLoad:(UIWebView *)webView2{
    // Intentarem fer un get de l'access_token
    /* if([webView2.request URL].query != nil){
        NSDictionary *dict = [self parseQueryString:[webView2.request URL].query];
        for (id key in dict) {
            NSLog(@"key: %@, value: %@ \n", key, [dict objectForKey:key]);
        }
    } */
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // NSLog(@"webView shouldStartLoadWithRequest");
    NSString *urlRequest = [[request URL] absoluteString];
    
    //NSLog(@"%@",urlRequest);
    if ([urlRequest rangeOfString:@"?code="].location == NSNotFound) {
        NSMutableDictionary* details = [NSMutableDictionary dictionary];
        [details setValue:@"No token request code provided after redirection from OAuth provider" forKey:NSLocalizedDescriptionKey];
        return YES;
    }
    else{
        NSString *tokenRequestCode = [urlRequest substringFromIndex:[urlRequest rangeOfString:@"?code="].location+6];
        [self accessTokenGET:tokenRequestCode];
        return NO;
    }

    return YES;
}

- (void)accessTokenGET:(NSString *)code
{
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];

    //NSLog(@"accessTokenExchange - %@", code);
    NSString *postString;
    if([stdDefaults objectForKey:@"secret"]==FALSE){
    postString = [NSString stringWithFormat:@"client_id=%@" \
                            "&client_secret=%@" \
                            "&grant_type=authorization_code" \
                            "&code=%@" \
                            "&redirect_uri=%@",
                            idClient, secretClient, code, urlRedirect];
    }
    else {
        PDKeychainBindings *keychainDef = [PDKeychainBindings sharedKeychainBindings];

        postString = [NSString stringWithFormat:@"client_id=%@" \
                      "&client_secret=%@" \
                      "&grant_type=authorization_code" \
                      "&code=%@" \
                      "&redirect_uri=%@",
                      [keychainDef objectForKey:@"client"], [keychainDef objectForKey:@"secret"], code, urlRedirect];
    }
    NSMutableURLRequest *tokenRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlToken]];
    
    [tokenRequest setHTTPMethod:@"POST"];
    [tokenRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    [NSURLConnection connectionWithRequest:tokenRequest delegate:self];
    //accessTokenExchangeConnection.requestType = OAPIConnectionTokenExchangeType;
    
}

- (void) webViewDidStartLoad:(UIWebView *)webView2{
    //NSLog(@"Start -%@", [webView2.request URL]);
}

- (NSDictionary *)parseQueryString:(NSString *)query {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:6];
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    
    for (NSString *pair in pairs) {
        NSArray *elements = [pair componentsSeparatedByString:@"="];
        NSString *key = [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *val = [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [dict setObject:val forKey:key];
    }
    return dict;
}



#pragma mark - NSURLConnectionDelegate methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // NSLog(@"connection didReceiveResponse");
    // NSLog(@"response = %@", [response description]);
    self.receivedData = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    PDKeychainBindings *keychainDef = [PDKeychainBindings sharedKeychainBindings];

    //NSLog(@"connection didReceiveData - %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    
    NSDictionary *tokens = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    [stdDefaults setValue:@"OK" forKey:@"access_token"];
    [stdDefaults setValue:@"OK" forKey:@"refresh_token"];
    [keychainDef setObject:[tokens objectForKey:@"access_token"] forKey:@"access_token"];
    [keychainDef setObject:[tokens objectForKey:@"refresh_token"] forKey:@"refresh_token"];
    
   
    
    if (_receivedData == nil){
        [stdDefaults setBool:YES forKey:@"registrada"];
        _receivedData = [[NSMutableData alloc] initWithData:data];
        if([stdDefaults objectForKey:@"secret"]==FALSE){

        }
        else {
            [stdDefaults setBool:TRUE forKey:@"nextView"];

        }
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[self navigationController] popViewControllerAnimated:YES];
    }
    else{
        [stdDefaults setBool:YES forKey:@"registrada"];
        [_receivedData appendData:data];
        if([stdDefaults objectForKey:@"secret"]==FALSE){
            
        }
        else {
            [stdDefaults setBool:TRUE forKey:@"nextView"];

        }
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[self navigationController] popViewControllerAnimated:YES];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // NSLog(@"connection didFailWithError");
    // NSMutableDictionary *errorInfo = [NSMutableDictionary dictionaryWithObject:error forKey:@"error"];
    
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    // NSLog(@"connectionDidFinishLoading");
}


@end
