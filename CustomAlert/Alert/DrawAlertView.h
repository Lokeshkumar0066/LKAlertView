//
//  DrawAlertView.h
//  CustomAlert
//
//  Created by Apple on 12/07/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DrawProtocolDelegate <NSObject>
- (void)actionDelegateIntoButtons :(NSString *)btnTitle;
@end

@interface DrawAlertView : UIView
@property (nonatomic,weak) id <DrawProtocolDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblMessage;

@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *DoneBtn;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;

@property (weak, nonatomic) IBOutlet UIView *viewAlert;
@property (weak, nonatomic) IBOutlet UIImageView *imgEmoji;

- (void)initWithDelegate:(id<DrawProtocolDelegate>)delegate message:(NSString *)message title:(NSString *)title btnOK:(NSString *)btnOK btnCancel:(NSString *)btnCancel btnDone:(NSString *)btnDone;
+ (DrawAlertView *)initlization;
+ (id)loadFromNib:(NSString *)name classToLoad:(Class)classToLoad;
@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewWidth;

@property (nonatomic, strong) UIColor *messageColor;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *buttonTextColor;
@property (nonatomic, strong) UIColor *buttonBgColor;
@property (nonatomic, assign) BOOL isEmojiFailure;
@end


