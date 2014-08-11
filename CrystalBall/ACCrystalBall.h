//
//  ACCrystalBall.h
//  CrystalBall
//
//  Created by Alex Cevallos on 5/14/14.
//  Copyright (c) 2014 AlexCevallos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACCrystalBall : NSObject {
    NSArray *_predictions;
}

@property(strong, nonatomic, readonly) NSArray *predictions;

-(NSString *) randomPrediction;

@end
