//
//  LDTaoBaoViewController.m
//  Aidapei
//
//  Created by Mr.Mac on 16/8/4.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "LDTaoBaoViewController.h"

@interface LDTaoBaoViewController ()

@end

@implementation LDTaoBaoViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.navigationItem.title = self.text;
    
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"total_back_btn"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    
    NSString *URL = self.URL;
    
    NSURL *url = [NSURL URLWithString:URL];
    
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    
    [self.view addSubview:webView];
    
    
    
    
    
    
    
    
}

-(void)back{
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}




@end
