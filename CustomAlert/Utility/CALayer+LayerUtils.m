//
//  CALayer+LayerUtils.m
//  CustomAlert
//
//  Created by Apple on 27/07/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import "CALayer+LayerUtils.h"

@implementation CALayer (LayerUtils)

-(void)setTheCornorRadius
{
    self.cornerRadius = 4.0f;
    self.masksToBounds = NO;
    self.shadowColor = [UIColor blackColor].CGColor;
    self.shadowOffset = CGSizeMake(0.0f, 5.0f);
    self.shadowOpacity = 0.5f;
}

-(void)setCornorRadiusForButtons
{
    self.cornerRadius = 2.0f;
    self.masksToBounds = NO;
    self.shadowColor = [UIColor blackColor].CGColor;
    self.shadowOffset = CGSizeMake(0.0f, 5.0f);
    self.shadowOpacity = 0.5f;
}

-(void)makeCircle :(UIImageView *)image{
    self.cornerRadius = image.frame.size.width/2;
    self.masksToBounds = YES;
}

@end
