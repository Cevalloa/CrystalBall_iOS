//
//  ACViewController.m
//  CrystalBall
//
//  Created by Alex Cevallos on 5/12/14.
//  Copyright (c) 2014 AlexCevallos. All rights reserved.
//

#import "ACViewController.h"
#import "ACCrystalBall.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ACViewController ()

@end

@implementation ACViewController {
    SystemSoundID soundEffect;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
     
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"crystal_ball" ofType:@"mp3"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID(CFBridgingRetain(soundURL), &soundEffect);
    
    self.crystalBall = [[ACCrystalBall alloc] init];
    
    
    NSMutableArray *animationArray = [[NSMutableArray alloc] init];
    for ( int i = 0; i <60; i++){
        int endingDigit = i + 1;
        [animationArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"CB000%02d", endingDigit]]];

    }
   // NSLog(@"%@", animationArray);
    
    self.backgroundImageView.animationImages = animationArray;
    self.backgroundImageView.animationDuration = 2.5f;
    self.backgroundImageView.animationRepeatCount = 1;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Prediction
-(void)makePrediction{
    [self.backgroundImageView startAnimating];
    self.predictionLabel.text = [self.crystalBall randomPrediction];
    AudioServicesPlaySystemSound(soundEffect);
    
    [UIView animateWithDuration:6.0 animations:^{
        self.predictionLabel.alpha = 1.0f;
    }];
}


#pragma mark - Motion Events

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    self.predictionLabel.text = nil;
    self.predictionLabel.alpha = 0.0f;
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [self makePrediction];
    }
}

-(void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"motion cancelled");
}

#pragma mark  - Touch Events

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.predictionLabel.text = nil;
    self.predictionLabel.alpha = 0.0f;

}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self makePrediction];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touches cancelled");
}
@end
