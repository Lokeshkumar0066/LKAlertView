//
//  UIFont+Fontutils.m
//  CustomAlert
//
//  Created by Apple on 27/07/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import "UIFont+Fontutils.h"

@implementation UIFont (Fontutils)

- (UIFont *)fontStyle :(NSString *)fontFamilyName fontSize:(CGFloat)fontSize{
    return [UIFont fontWithName:fontFamilyName size:fontSize];
}




@end
