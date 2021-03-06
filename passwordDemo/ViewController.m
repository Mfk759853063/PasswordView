//
//  ViewController.m
//  passwordDemo
//
//  Created by kwep_vbn on 15/12/10.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import "ViewController.h"
#import "KNPasswordView.h"

@interface ViewController()<KNPasswordViewProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    KNPasswordView *view = [[KNPasswordView alloc] initWithPasswordCount:6];
    view.frame = CGRectMake(0, 0, 300, 40);
    view.center = self.view.center;
    [self.view addSubview:view];
    view.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didUpdatePass:(id)text inView:(UIView *)view {
    NSLog(@"%@",text);
}

- (UIKeyboardType)passwordKeyBoardType {
    return UIKeyboardTypeDefault;
}

@end
