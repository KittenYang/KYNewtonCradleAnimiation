//
//  ViewController.m
//  KYNewtonCradleView
//
//  Created by Kitten Yang on 2/21/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *ballView_1;
@property (strong, nonatomic) IBOutlet UIView *ballView_2;
@property (strong, nonatomic) IBOutlet UIView *ballView_3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ballView_1.layer.cornerRadius = self.ballView_1.bounds.size.width / 2;
    self.ballView_2.layer.cornerRadius = self.ballView_2.bounds.size.width / 2;
    self.ballView_3.layer.cornerRadius = self.ballView_3.bounds.size.width / 2;
}

-(void)startAnimation{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
