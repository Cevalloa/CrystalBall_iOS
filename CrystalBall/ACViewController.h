//
//  ACViewController.h
//  CrystalBall
//
//  Created by Alex Cevallos on 5/12/14.
//  Copyright (c) 2014 AlexCevallos. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ACCrystalBall;

@interface ACViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;
@property (strong, nonatomic) ACCrystalBall *crystalBall;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

-(void) makePrediction;
@end
