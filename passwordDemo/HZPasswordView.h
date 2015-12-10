//
//  HZPasswordView.h
//  HuiXianxia
//
//  Created by kwep_vbn on 15/12/10.
//  Copyright © 2015年 com.huixianxia.c. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HZPasswordViewProtocol <NSObject>

- (void)didUpdatePass:(id)text inView:(UIView *)view;

@end

@interface HZPasswordView : UIView

@property (weak, nonatomic) id <HZPasswordViewProtocol> delegate;

- (instancetype)initWithPasswordCount:(NSInteger)count;

- (void)showKeyboard:(BOOL)show;

@end
