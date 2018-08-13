//
//  CALayer+LayerUtils.h
//  CustomAlert
//
//  Created by Apple on 27/07/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface CALayer (LayerUtils)
- (void) setTheCornorRadius;
-(void)setCornorRadiusForButtons;
-(void)makeCircle :(UIImageView *)image;
@end
