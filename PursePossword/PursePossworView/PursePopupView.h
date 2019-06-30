//
//  PursePopupView.h
//  PursePossword
//
//  Created by 董婷 on 2019/6/29.
//  Copyright © 2019 DT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
NS_ASSUME_NONNULL_BEGIN


@protocol PursePopupViewDelegate <NSObject>

- (void)didPasswordInputFinished:(NSString *)password;

@end

@interface PursePopupView : UIView
@property (nonatomic, weak) id <PursePopupViewDelegate> delegate;
@property(nonatomic,strong)NSString *titleName;
- (void)showPayPopView;
- (void)hidePayPopView;
- (void)didInputPayPasswordError;


@end

NS_ASSUME_NONNULL_END
