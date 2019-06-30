//
//  Header.h
//  PursePossword
//
//  Created by 董婷 on 2019/6/29.
//  Copyright © 2019 DT. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define UIColorFromHEX(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define WIDTH6                  375.0

#define XX_6(value)             (1.0 * (value) * kScreenWidth / WIDTH6)

// 常用字体大小
#define Font_XX6(value)         [UIFont systemFontOfSize:ceil(XX_6(value))]

#endif /* Header_h */
