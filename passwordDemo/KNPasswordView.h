//
//  HZPasswordView.h
//  HuiXianxia
//
//  Created by kwep_vbn on 15/12/10.
//  Copyright © 2015年 com.huixianxia.c. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KNPasswordViewProtocol <NSObject>

- (void)didUpdatePass:(id)text inView:(UIView *)view;

- (UIKeyboardType)passwordKeyBoardType;

@end

@interface KNPasswordView : UIView

@property (weak, nonatomic) id <KNPasswordViewProtocol> delegate;

- (instancetype)initWithPasswordCount:(NSInteger)count;

- (void)showKeyboard:(BOOL)show;

@end
