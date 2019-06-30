//
//  SetPosswordView.h
//  PursePossword
//
//  Created by 董婷 on 2019/6/29.
//  Copyright © 2019 DT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^InputPasswordCompletionBlock)(NSString *password);
@interface SetPosswordView : UIView
@property (nonatomic,copy)InputPasswordCompletionBlock completionBlock;

/** 更新输入框数据 */
- (void)updateLabelBoxWithText:(NSString *)text;

/** 抖动输入框 */
- (void)startShakeViewAnimation;

- (void)didInputPasswordError;
@end

NS_ASSUME_NONNULL_END
