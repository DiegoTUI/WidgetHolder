//
//  TUIViewController.m
//  WidgetHolder
//
//  Created by Diego Lafuente on 12/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "TUIViewController.h"

@interface TUIViewController () <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *bigWebView;
@property (strong, nonatomic) IBOutlet UIWebView *smallWebView;

@end

@implementation TUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _bigWebView.delegate = self;
    _smallWebView.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
    NSString *bigUrl = @"http://54.246.80.107/widgets/index.html";
    NSString *mashoop = @"http://54.246.80.107/";
    NSString *google = @"http://www.google.com";
    NSURLRequest *bigRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:bigUrl]];
    [_bigWebView loadRequest:bigRequest];
    
    NSURLRequest *smallRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://54.246.80.107/widgets/index2.html"]];
    [_smallWebView loadRequest:smallRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if ( navigationType == UIWebViewNavigationTypeLinkClicked ) {
        [[UIApplication sharedApplication] openURL:[request URL]];
        return NO;
    }
    
    return YES;
}

@end
