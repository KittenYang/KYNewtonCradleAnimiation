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
    
    [self setAnchorPoint:CGPointMake(1.5, 0.5) forView:self.ballView_1];
    [self setAnchorPoint:CGPointMake(-0.5, 0.5) forView:self.ballView_3];
    
    self.ballView_1.layer.cornerRadius = self.ballView_1.bounds.size.width / 2;
    self.ballView_2.layer.cornerRadius = self.ballView_2.bounds.size.width / 2;
    self.ballView_3.layer.cornerRadius = self.ballView_3.bounds.size.width / 2;
    
    [self startAnimation];
}

-(void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view
{
    CGPoint newPoint = CGPointMake(view.layer.bounds.size.width * anchorPoint.x,
                                   view.layer.bounds.size.height * anchorPoint.y);
    CGPoint oldPoint = CGPointMake(view.layer.bounds.size.width * view.layer.anchorPoint.x,
                                   view.layer.bounds.size.height * view.layer.anchorPoint.y);
    
    newPoint = CGPointApplyAffineTransform(newPoint, view.transform);
    oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform);
    
    CGPoint position = view.layer.position;
    
    position.x -= oldPoint.x;
    position.x += newPoint.x;
    
    position.y -= oldPoint.y;
    position.y += newPoint.y;
    
    view.layer.position = position;
    view.layer.anchorPoint = anchorPoint;
}



-(void)startAnimation{

    CAKeyframeAnimation *newtonBallRotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    newtonBallRotationAnimation.duration = 3.000;
    newtonBallRotationAnimation.values = @[@(0.000), @(-3.142*2)];
    newtonBallRotationAnimation.keyTimes = @[@(0.000), @(1.000)];
    newtonBallRotationAnimation.beginTime = 0;
    newtonBallRotationAnimation.repeatCount = 3;

    [self.ballView_1.layer addAnimation:newtonBallRotationAnimation forKey:@"Untitled Animation_Rotation"];
    
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
