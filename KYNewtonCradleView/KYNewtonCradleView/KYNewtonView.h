//
//  KYNewtonView.h
//  KYNewtonCradleView
//
//  Created by Kitten Yang on 2/22/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KYNewtonView : UIView

@property (strong, nonatomic) IBOutlet UIView *ballView_1;
@property (strong, nonatomic) IBOutlet UIView *ballView_2;
@property (strong, nonatomic) IBOutlet UIView *ballView_3;


-(void)startAnimation;
@end
