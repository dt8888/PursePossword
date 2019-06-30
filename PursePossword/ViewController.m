//
//  ViewController.m
//  PursePossword
//
//  Created by 董婷 on 2019/6/29.
//  Copyright © 2019 DT. All rights reserved.
//

#import "ViewController.h"
#import "PursePopupView.h"
#import "Header.h"
@interface ViewController ()<PursePopupViewDelegate>

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) PursePopupView *payPopupView;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.button];
}

- (void)buttonAction
{
    self.payPopupView = [[PursePopupView alloc]initWithFrame:CGRectMake(0, XX_6(310), kScreenWidth, kScreenHeight)];
    self.payPopupView.delegate = self;
    [self.payPopupView showPayPopView];
}

#pragma mark - ZJPayPopupViewDelegate

- (void)didClickForgetPasswordButton
{
    NSLog(@"点击了忘记密码");
}

- (void)didPasswordInputFinished:(NSString *)password
{
    if ([password isEqualToString:@"123456"])
    {
        NSLog(@"输入的密码正确");
    }
    else
    {
        NSLog(@"输入错误:%@",password);
        [self.payPopupView didInputPayPasswordError];
    }
}




- (UIButton *)button
{
    if (!_button)
    {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.frame = CGRectMake(100, 200, kScreenWidth - 2 * 100, 50);
        [_button setTitle:@"点击密码输入" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
@end
