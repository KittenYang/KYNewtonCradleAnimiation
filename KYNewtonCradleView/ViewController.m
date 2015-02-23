//
//  ViewController.m
//  KYNewtonCradleView
//
//  Created by Kitten Yang on 2/21/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ballView_1.layer.cornerRadius = self.ballView_1.bounds.size.width / 2;
    self.ballView_2.layer.cornerRadius = self.ballView_2.bounds.size.width / 2;
    self.ballView_3.layer.cornerRadius = self.ballView_3.bounds.size.width / 2;
    
    [self startAnimation];
}



-(void)startAnimation{
    
    //-----1--------
    UIBezierPath *circlePath_1 = [UIBezierPath bezierPath];
    [circlePath_1 moveToPoint:CGPointMake(160-40, 568/2)];

    [circlePath_1 addArcWithCenter:CGPointMake(160, 568/2) radius:40 startAngle:(180*M_PI)/180 endAngle:(360*M_PI)/180 clockwise:NO];
    UIBezierPath *circlePath_1_2 = [UIBezierPath bezierPath];
    [circlePath_1_2 addArcWithCenter:CGPointMake(160, 568/2) radius:40 startAngle:0 endAngle:(180*M_PI)/180 clockwise:NO];
    [circlePath_1 appendPath:circlePath_1_2];
    
    
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = circlePath_1.CGPath;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.calculationMode = kCAAnimationCubic;
    animation.repeatCount = 1;
    animation.duration = 1.5;
    animation.delegate = self;
    animation.autoreverses = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    
    [self.ballView_1.layer addAnimation:animation forKey:@"animation"];
    
    
    //------2--------
    UIBezierPath *circlePath_2 = [UIBezierPath bezierPath];
    [circlePath_2 moveToPoint:CGPointMake(160+40, 568/2)];
    
    [circlePath_2 addArcWithCenter:CGPointMake(160, 568/2) radius:40 startAngle:(0*M_PI)/180 endAngle:(180*M_PI)/180 clockwise:NO];
    UIBezierPath *circlePath_2_2 = [UIBezierPath bezierPath];
    [circlePath_2_2 addArcWithCenter:CGPointMake(160, 568/2) radius:40 startAngle:(180 *M_PI)/180 endAngle:(360*M_PI)/180 clockwise:NO];
    [circlePath_2 appendPath:circlePath_2_2];
    
    
    CAKeyframeAnimation *animation_2=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation_2.path = circlePath_2.CGPath;
    animation_2.removedOnCompletion = NO;
    animation_2.fillMode = kCAFillModeForwards;
    animation_2.repeatCount = 1;
    animation_2.beginTime = 0;
    animation_2.duration =1.5 ;
    animation_2.autoreverses = NO;
    animation_2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.ballView_3.layer addAnimation:animation_2 forKey:@"Rotation"];

}


- (void)animationDidStart:(CAAnimation *)anim{
    
    [UIView animateWithDuration:0.3 delay:0.1 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.ballView_1.transform = CGAffineTransformMakeTranslation(-40, 0);
        self.ballView_1.transform = CGAffineTransformScale(self.ballView_1.transform, 0.5, 0.5);
        
        self.ballView_3.transform = CGAffineTransformMakeTranslation(40, 0);
        self.ballView_3.transform = CGAffineTransformScale(self.ballView_3.transform, 0.5, 0.5);
        
        self.ballView_2.transform = CGAffineTransformScale(self.ballView_2.transform, 0.5, 0.5);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:0.1 options:UIViewAnimationOptionCurveEaseIn  | UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.ballView_1.transform = CGAffineTransformIdentity;
            self.ballView_3.transform = CGAffineTransformIdentity;
            self.ballView_2.transform = CGAffineTransformIdentity;
            
        } completion:nil];
    }];

}


-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self startAnimation];
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
