//
//  HZPasswordView.m
//  HuiXianxia
//
//  Created by kwep_vbn on 15/12/10.
//  Copyright © 2015年 com.huixianxia.c. All rights reserved.
//
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#import "KNPasswordView.h"
#import "Masonry.h"

@interface KNPasswordView()<UITextFieldDelegate>

@property (assign, nonatomic) NSInteger passwordCount;
@property (strong, nonatomic) UITextField *realTF;
@property (strong, nonatomic) NSMutableArray *buttonsContainer;
@end


@implementation KNPasswordView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.passwordCount = 6;
        [self setup];
    }
    return self;
}

- (instancetype)initWithPasswordCount:(NSInteger)count {
    self = [super init];
    if (self) {
        self.passwordCount = count;
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.passwordCount = 6;
        [self setup];
    }
    return self;
}

- (void)setup {
    
    self.layer.borderColor = UIColorFromRGB(0xeaeaea).CGColor;
    self.layer.borderWidth = 1.0f;
    self.layer.cornerRadius = 3.0f;
    self.clipsToBounds = YES;
    self.buttonsContainer = @[].mutableCopy;
    
    UIView *preVLineView = nil;
    UIButton *preButton = nil;
    for (int i = 0; i< self.passwordCount; i ++) {
        UIButton *item = [[UIButton alloc] init];
        item.backgroundColor = [UIColor whiteColor];
        [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [item addTarget:self action:@selector(itemDidTaped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:item];
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(preVLineView?preVLineView.mas_right:self.mas_left);
            make.top.and.bottom.equalTo(self);
            if (preButton) {
                make.width.and.height.equalTo(preButton);
            }
        }];
        preButton = item;
        if (i != 5) {
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = UIColorFromRGB(0xeaeaea);
            [self addSubview:lineView];
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(preButton.mas_right);
                make.width.equalTo(@1);
                make.top.and.bottom.equalTo(self);
            }];
            preVLineView = lineView;
        }
        [self.buttonsContainer addObject:item];
    }
    [preButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self);
    }];
    
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectZero];
    tf.hidden = YES;
    tf.delegate = self;
    tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    tf.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:tf];
    [tf addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    self.realTF = tf;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if([string isEqualToString:@"\n"])
    {
        //按回车关闭键盘
        [textField resignFirstResponder];
        return NO;
    }
    else if(string.length == 0)
    {
        //判断是不是删除键
        return YES;
    }
    else if(textField.text.length >= self.passwordCount)
    {
        //输入的字符个数大于6，则无法继续输入，返回NO表示禁止输入
        return NO;
    }
    else
    {
        return YES;
    }
}

- (void)showKeyboard:(BOOL)show {
    show?[self.realTF becomeFirstResponder]:[self.realTF resignFirstResponder];
}

- (void)itemDidTaped:(id)sender {
    self.realTF.isFirstResponder?[self.realTF resignFirstResponder]:[self.realTF becomeFirstResponder];
}

- (void)textFieldDidChange:(id)sender {
    [self showPasswordLength:self.realTF.text.length];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didUpdatePass:inView:)]) {
        [self.delegate didUpdatePass:self.realTF.text inView:self];
    }
}

- (void)showPasswordLength:(NSInteger)length {
    [self.buttonsContainer enumerateObjectsUsingBlock:^(UIButton *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setTitle:@"" forState:UIControlStateNormal];
    }];
    
    for (int i = 0; i < length; i ++) {
        UIButton *item = self.buttonsContainer[i];
        [item setTitle:@"●" forState:UIControlStateNormal];
    }
}


@end
