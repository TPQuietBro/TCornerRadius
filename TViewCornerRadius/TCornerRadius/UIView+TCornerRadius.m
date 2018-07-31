//
//  UIView+TCornerRadius.m
//  TViewCornerRadius
//
//  Created by 唐鹏 on 2018/7/31.
//  Copyright © 2018年 唐鹏. All rights reserved.
//

#import "UIView+TCornerRadius.h"

#define TRadiusZero TCornerRadiusZero()

TRadius TMakeCornerRadius(float topLeft,float topRight,float bottomLeft,float bottomRight){
    TRadius tRadius;
    tRadius.topLeftRadius = topLeft;
    tRadius.topRightRadius = topRight;
    tRadius.bottomLeftRadius = bottomLeft;
    tRadius.bottomRightRadius = bottomRight;
    return tRadius;
}

TRadius TCornerRadiusZero(){
    TRadius tRadius;
    tRadius.topLeftRadius = 0;
    tRadius.topRightRadius = 0;
    tRadius.bottomLeftRadius = 0;
    tRadius.bottomRightRadius = 0;
    return tRadius;
}

@implementation UIView (TCornerRadius)

- (void)setCornerRadius:(CGFloat)cornerRadius{
    [self setCornerRadius:cornerRadius multiRadius:TRadiusZero rectCorner:UIRectCornerAllCorners];
}

- (void)setCornerRadius:(CGFloat)cornerRadius rectCorner:(UIRectCorner)rectCorner{
    [self setCornerRadius:cornerRadius multiRadius:TRadiusZero rectCorner:rectCorner];
}

- (void)setMultiCornerRadius:(TRadius)cornerRadius rectCorner:(UIRectCorner)rectCorner{
    [self setCornerRadius:0 multiRadius:cornerRadius rectCorner:rectCorner];
}

- (void)setCornerRadius:(CGFloat)cornerRadius multiRadius:(TRadius)multiRadius rectCorner:(UIRectCorner)rectCorner{
    CGSize radiusSize;
    if (cornerRadius != 0) {
        radiusSize = CGSizeMake(cornerRadius, cornerRadius);
        [self addShapeLayerWithRadiusSize:radiusSize rectCorner:rectCorner];
    } else {
        NSLog(@"corner : %zd",rectCorner);
        /*
         1    2    4    8    3    5    9    6    10    12    7    11    13    14    15
         */
        switch (rectCorner) {
            case 1:
            {
                radiusSize = CGSizeMake(multiRadius.topLeftRadius, multiRadius.topLeftRadius);
                [self addShapeLayerWithRadiusSize:radiusSize rectCorner:UIRectCornerTopLeft];
            }
                break;
            case 2:
            {
                radiusSize = CGSizeMake(multiRadius.topRightRadius, multiRadius.topRightRadius);
                [self addShapeLayerWithRadiusSize:radiusSize rectCorner:UIRectCornerTopRight];
            }
                break;
            case 3:
            {
                CGSize radiusSize1 = CGSizeMake(multiRadius.topLeftRadius, multiRadius.topLeftRadius);
                [self addShapeLayerWithRadiusSize:radiusSize1 rectCorner:UIRectCornerBottomLeft];
                
                CGSize radiusSize2 = CGSizeMake(multiRadius.topRightRadius, multiRadius.topRightRadius);
                [self addShapeLayerWithRadiusSize:radiusSize2 rectCorner:UIRectCornerBottomRight];
            }
                break;
            case 4:
            {
                radiusSize = CGSizeMake(multiRadius.bottomLeftRadius, multiRadius.bottomLeftRadius);
                [self addShapeLayerWithRadiusSize:radiusSize rectCorner:UIRectCornerBottomLeft];
            }
                break;
            case 8:
            {
                radiusSize = CGSizeMake(multiRadius.bottomRightRadius, multiRadius.bottomRightRadius);
                [self addShapeLayerWithRadiusSize:radiusSize rectCorner:UIRectCornerBottomRight];
            }
                break;
            case UIRectCornerAllCorners:
            {
                NSAssert(rectCorner != UIRectCornerAllCorners, @"unsupport UIRectCornerAllCorners");
            }
                break;
        }
    }
    self.backgroundColor = [UIColor clearColor];
}

- (void)addShapeLayerWithRadiusSize:(CGSize)radiusSize rectCorner:(UIRectCorner)rectCorner{
    UIBezierPath *bPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:radiusSize];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bPath.CGPath;
    shapeLayer.fillColor = self.backgroundColor.CGColor;
    [self.layer addSublayer:shapeLayer];
}


@end
