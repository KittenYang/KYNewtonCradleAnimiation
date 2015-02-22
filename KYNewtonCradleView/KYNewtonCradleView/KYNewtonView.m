//
//  KYNewtonView.m
//  KYNewtonCradleView
//
//  Created by Kitten Yang on 2/22/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "KYNewtonView.h"



@implementation KYNewtonView


-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.ballView_1.layer.cornerRadius = self.ballView_1.bounds.size.width / 2;
        self.ballView_2.layer.cornerRadius = self.ballView_2.bounds.size.width / 2;
        self.ballView_3.layer.cornerRadius = self.ballView_3.bounds.size.width / 2;
    }
    return self;
    
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.ballView_1.layer.cornerRadius = self.ballView_1.bounds.size.width / 2;
        self.ballView_2.layer.cornerRadius = self.ballView_2.bounds.size.width / 2;
        self.ballView_3.layer.cornerRadius = self.ballView_3.bounds.size.width / 2;

    }
    return self;
}

-(void)startAnimation{
    
    CAShapeLayer* circle = [[CAShapeLayer alloc] init];
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect textRect = CGRectMake(self.bounds.size.width/4, (self.bounds.size.height-self.bounds.size.width/2)/2, self.bounds.size.width/2, self.bounds.size.width/2);
    float midX = CGRectGetMidX(textRect);
    float midY = CGRectGetMidY(textRect);
    CGAffineTransform t = CGAffineTransformConcat(
                                                  CGAffineTransformConcat(
                                                                          CGAffineTransformMakeTranslation(-midX, -midY),
                                                                          CGAffineTransformMakeRotation(-1.57079633/0.99)),
                                                  CGAffineTransformMakeTranslation(midX, midY));
    CGPathAddEllipseInRect(path, &t, textRect);
    circle.path = path;
    circle.frame = self.bounds;
    circle.fillColor = [UIColor clearColor].CGColor;
    circle.strokeColor = [UIColor blackColor].CGColor;
    circle.lineWidth = 60.0f;
    [self.layer addSublayer:circle];
    
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 15.0f;
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat:1.0f];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [circle addAnimation:animation forKey:@"strokeEnd"];
    
    
    UILabel* label = [[UILabel alloc] init];
    label.text = @"Test Text";
    label.font = [UIFont systemFontOfSize:20.0f];
    label.center = CGPathGetCurrentPoint(path);
    label.transform = CGAffineTransformMakeRotation(1.57079633);
    [label sizeToFit];
    [self.layer addSublayer:label.layer];
    
    CAKeyframeAnimation* textAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    textAnimation.duration = 15.0f;
    textAnimation.path = path;
    textAnimation.rotationMode = kCAAnimationRotateAuto;
    textAnimation.calculationMode = kCAAnimationCubicPaced;
    textAnimation.removedOnCompletion = NO;
    [label.layer addAnimation:textAnimation forKey:@"position"];
}


@end
