//
//  PursePopupView.m
//  PursePossword
//
//  Created by 董婷 on 2019/6/29.
//  Copyright © 2019 DT. All rights reserved.
//

#import "PursePopupView.h"
#import "SetPosswordView.h"

#define AnimationTimeInterval 0.25
@interface PursePopupView ()<UITextFieldDelegate>
@property (nonatomic, strong) UIView *superView;
@property (nonatomic, strong) UIView *payPopupView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) SetPosswordView *payPasswordView;

@end

@implementation PursePopupView

#pragma mark -lifeCycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = UIColorFromHEX(0xffffff);
        [self createUI];
    }
    return self;
}

- (void)createUI{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.superView];
    self.superView.frame = window.frame;
    
    UITapGestureRecognizer *tapView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidePayPopView)];
    [self.superView addGestureRecognizer:tapView];
    
    [self.superView addSubview:self];
    [self addSubview:self.titleLabel];
    [self addSubview:self.closeButton];
    [self addSubview:self.lineView];
    [self addSubview:self.payPasswordView];
    
    
}

#pragma mark -Public

- (void)showPayPopView
{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:AnimationTimeInterval animations:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.superView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];
    } completion:nil];
}

- (void)hidePayPopView
{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:AnimationTimeInterval animations:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.superView.alpha = 0.0;
        strongSelf.frame = CGRectMake(strongSelf.frame.origin.x, kScreenWidth, strongSelf.frame.size.width, strongSelf.frame.size.height);
    } completion:^(BOOL finished) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.superView removeFromSuperview];
        strongSelf.superView = nil;
    }];
}

- (void)didInputPayPasswordError
{
    [self.payPasswordView didInputPasswordError];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self hidePayPopView];
}

#pragma mark -Setter/Getter

- (SetPosswordView *)payPasswordView
{
    if (!_payPasswordView)
    {
        _payPasswordView = [[SetPosswordView alloc]initWithFrame:CGRectMake(0, 66, kScreenWidth, 50)];
        __weak typeof(self) weakSelf = self;
        _payPasswordView.completionBlock = ^(NSString *password) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if ([strongSelf.delegate respondsToSelector:@selector(didPasswordInputFinished:)])
            {
                [strongSelf.delegate didPasswordInputFinished:password];
            }
        };
    }
    return _payPasswordView;
}

- (UIView *)superView
{
    if (!_superView)
    {
        _superView = [[UIView alloc] init];
    }
    return _superView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
        _titleLabel.textColor = UIColorFromHEX(0x444444);
        _titleLabel.font = Font_XX6(16);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"请输入钱包密码";
    }
    return _titleLabel;
}

- (UIButton *)closeButton
{
    if (!_closeButton)
    {
        _closeButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 17, 15, 15)];
        [_closeButton setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(hidePayPopView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}

- (UIView *)lineView
{
    if (!_lineView)
    {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 51, kScreenWidth, 1)];
        _lineView.backgroundColor = UIColorFromHEX(0xEEEEEE);
    }
    return _lineView;
}

@end
