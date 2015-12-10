//
//  ViewController.m
//  passwordDemo
//
//  Created by kwep_vbn on 15/12/10.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import "ViewController.h"
#import "HZPasswordView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    HZPasswordView *view = [[HZPasswordView alloc] initWithPasswordCount:6];
    view.frame = CGRectMake(0, 0, 300, 40);
    view.center = self.view.center;
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end