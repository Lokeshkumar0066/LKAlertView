//
//  DrawAlertView.m
//  CustomAlert
//
//  Created by Apple on 12/07/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import "DrawAlertView.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "UIFont+Fontutils.h"
#import "CALayer+LayerUtils.h"
#define MESSAGEDEFAULTCOLOR [UIColor blackColor]
#define TITLEDEFAULTCOLOR [UIColor blackColor]

@interface DrawAlertView(){
    NSString *strAlertTitle;
    NSString *strAlertText;
    NSString *btnCancelTitle;
    NSString *btnDoneTitle;
    NSString *btnOkTitle;
}
@end

@implementation DrawAlertView


- (id)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setUpView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]) {
        [self setUpView];
    }
    return self;
}


- (void)setUpView{
    [self CornorRadius];
    [self drawAnCircle];
    self.lblTitle.text = strAlertTitle;
    self.lblMessage.text = strAlertText;
    [self setColorFormatToAllControls];
    [self allActionCalls];
    [self loadEmoji];
    [self checkButtonAccessability];
    [self changeTheFontSize];

}

- (void)CornorRadius{
    [self.viewAlert.layer setTheCornorRadius];
    [self.okBtn.layer setCornorRadiusForButtons];
    [self.DoneBtn.layer setCornorRadiusForButtons];
    [self.cancelBtn.layer setCornorRadiusForButtons];
}

- (void)drawAnCircle{
    [self.imgEmoji.layer makeCircle:self.imgEmoji];
}

- (void)setColorFormatToAllControls{
    self.lblMessage.textColor = (self.messageColor)?self.messageColor:MESSAGEDEFAULTCOLOR;
    self.lblTitle.textColor = (self.titleColor)?self.titleColor:TITLEDEFAULTCOLOR;
    
    [self.okBtn setTitleColor:(self.buttonTextColor)?self.buttonTextColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:(self.buttonTextColor)?self.buttonTextColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.DoneBtn setTitleColor:(self.buttonTextColor)?self.buttonTextColor:[UIColor redColor] forState:UIControlStateNormal];
}

- (void) loadEmoji{
    self.imgEmoji.image = (self.isEmojiFailure)?[UIImage imageNamed:@"images.jpeg"]:[UIImage imageNamed:@"2705.png"];
    if (self.isEmojiFailure) {
        self.okBtn.backgroundColor = [UIColor redColor];
        self.cancelBtn.backgroundColor = [UIColor redColor];
        self.DoneBtn.backgroundColor = [UIColor redColor];
    }else{
        self.okBtn.backgroundColor = (self.buttonBgColor)?self.buttonBgColor:[UIColor whiteColor];
        self.cancelBtn.backgroundColor = (self.buttonBgColor)?self.buttonBgColor:[UIColor whiteColor];
        self.DoneBtn.backgroundColor = (self.buttonBgColor)?self.buttonBgColor:[UIColor whiteColor];
    }
}


- (void) changeTheFontSize{
    [self.lblTitle.font fontStyle:@"MarkerFelt-Wide" fontSize:18.0];
    [self.lblMessage.font fontStyle:@"Chalkduster" fontSize:17.0];
}


- (void)allActionCalls{
    [self.okBtn addTarget:self action:@selector(BtnOK:) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelBtn addTarget:self action:@selector(BtnCancel:) forControlEvents:UIControlEventTouchUpInside];
    [self.DoneBtn addTarget:self action:@selector(BtnDone:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)show{
    UIViewController *topController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
//    [topController addChildViewController:self];
    [topController.view addSubview:self];
//    [self didMoveToParentViewController:topController];
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.alpha = 0.0f;
    self.frame = topController.view.bounds;
    
    self.viewAlert.alpha     = 0.0f;

    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.alpha = 1.0f;
    } completion:nil];

    self.viewAlert.center = CGPointMake((self.bounds.size.width/2.0), (self.bounds.size.height/2.0)-10);
    [UIView animateWithDuration:0.2 delay:0.1  options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.viewAlert.alpha = 1.0f;
        self.viewAlert.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
    } completion:nil];
    
}

- (void)dismissShareViewController{
    [self endEditing:YES];
    [UIView animateWithDuration:0.25 delay:0.0  options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.viewAlert.alpha = 0.0f;
        self.viewAlert.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0 - 5);
    } completion:nil];
    
    [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.alpha = 0.0f;
    } completion:nil];
    [self removeFromSuperview];
//    [self removeFromParentViewController];
}

- (void)tapGesture :(UITapGestureRecognizer *)gesture{
    [self dismissShareViewController];
}

//+ (DrawAlertView *)initlization{
//    DrawAlertView *view = [[[NSBundle mainBundle] loadNibNamed:@"DrawAlertView" owner:self options:nil] objectAtIndex:0];
//    return view;
//}

+ (id)loadFromNib:(NSString *)name classToLoad:(Class)classToLoad {
    NSString *frameworkBundleID = @"com.iifl.Analti.IIFLAlert";
    NSBundle *frameworkBundle = [NSBundle bundleWithIdentifier:frameworkBundleID];
    NSArray *bundle = [frameworkBundle loadNibNamed:name owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:classToLoad]) {
            return object;
        }
    }
    return nil;
}

- (void)initWithDelegate:(id<DrawProtocolDelegate>)delegate message:(NSString *)message title:(NSString *)title btnOK:(NSString *)btnOK btnCancel:(NSString *)btnCancel btnDone:(NSString *)btnDone{
    self.delegate = delegate;
    [self addTitle:message title:title btnOK:btnOK btnCancel:btnCancel btnDone:btnDone];
    [self show];
    [self setUpView];
}

- (void)addTitle :(NSString *)message title:(NSString *)title btnOK:(NSString *)btnOK btnCancel:(NSString *)btnCancel btnDone:(NSString *)btnDone{
    strAlertTitle = title;
    strAlertText = message;
    btnCancelTitle = btnCancel;
    btnDoneTitle = btnDone;
    btnOkTitle = btnOK;
}


- (void)checkButtonAccessability{
    if ([self IsValidObject:btnOkTitle]) {
        [self.okBtn setTitle:btnOkTitle forState:UIControlStateNormal];
        self.DoneBtn.hidden = YES;
        self.cancelBtn.hidden = YES;
        self.okBtn.hidden = NO;
    }else if ([self IsValidObject:btnDoneTitle] && [self IsValidObject:btnCancelTitle]){
        [self.DoneBtn setTitle:btnDoneTitle forState:UIControlStateNormal];
        [self.cancelBtn setTitle:btnCancelTitle forState:UIControlStateNormal];
        self.DoneBtn.hidden = NO;
        self.cancelBtn.hidden = NO;
        self.okBtn.hidden = YES;
    }
}

- (BOOL)IsValidObject:(id)obj {
    if ([obj isKindOfClass:[NSObject class]] && ![obj isKindOfClass:[NSNull class]] && (obj != nil)){
        return YES;
    }
    return NO;
}

- (void)BtnCancel:(UIButton *)sender {
    NSLog(@"Cancel");
    if ([self.delegate respondsToSelector:@selector(actionDelegateIntoButtons:)]) {
        [self.delegate actionDelegateIntoButtons:@"Cancel"];
         [self dismissShareViewController];
    }
}

- (void)BtnDone:(UIButton *)sender {
    NSLog(@"Done");
   if ([self.delegate respondsToSelector:@selector(actionDelegateIntoButtons:)]) {
        [self.delegate actionDelegateIntoButtons:@"Done"];
        [self dismissShareViewController];
    }
}

- (void)BtnOK:(UIButton *)sender {
    NSLog(@"OK");
    if ([self.delegate respondsToSelector:@selector(actionDelegateIntoButtons:)]) {
        [self.delegate actionDelegateIntoButtons:@"Ok"];
         [self dismissShareViewController];
    }
}


@end
