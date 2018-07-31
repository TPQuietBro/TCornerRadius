//
//  UIView+TCornerRadius.h
//  TViewCornerRadius
//
//  Created by 唐鹏 on 2018/7/31.
//  Copyright © 2018年 唐鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct TCornerRadius
{
    float topLeftRadius;
    float topRightRadius;
    float bottomLeftRadius;
    float bottomRightRadius;
}TRadius;

TRadius TMakeCornerRadius(float topLeft,float topRight,float bottomLeft,float bottomRight);
TRadius TCornerRadiusZero(void);


@interface UIView (TCornerRadius)
/**
 设置四个角的圆角

 @param cornerRadius 圆角半径
 */
- (void)setCornerRadius:(CGFloat)cornerRadius;
/**
 设置指定角的相同圆角

 @param cornerRadius 圆角半径
 @param rectCorner 指定角
 */
- (void)setCornerRadius:(CGFloat)cornerRadius rectCorner:(UIRectCorner)rectCorner;
/**
 设置指定角的不同圆角
 
 @param cornerRadius 圆角半径结构体
 @param rectCorner 指定角
 */
- (void)setMultiCornerRadius:(TRadius)cornerRadius rectCorner:(UIRectCorner)rectCorner;

@end
