//
//  ViewController.m
//  CustomAlert
//
//  Created by Apple on 12/07/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()<DrawProtocolDelegate>{
    DrawAlertView *drawAlertObj;
}
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    drawAlertObj = [[DrawAlertView alloc] init];
    drawAlertObj.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Btnclick:(id)sender {
    
    DrawAlertView *objAlert = [DrawAlertView initlization];//[DrawAlertView loadFromNib:@"DrawAlertView" classToLoad:[DrawAlertView class]]; //[DrawAlertView initlization];
 /*
    objAlert.messageColor = [UIColor lightGrayColor];
    objAlert.titleColor = [UIColor darkGrayColor];
    objAlert.buttonBgColor = [UIColor colorWithRed:0.0f/255.0f green:143.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    objAlert.buttonTextColor = [UIColor whiteColor];
    objAlert.isEmojiFailure = NO;
  */
    
    [objAlert initWithDelegate:self message:@"Learning is project created to capture time where some R&D is required for development, it is to be used for KT and Understanding new technology." title:@"Alert!!" btnOK:nil btnCancel:@"Cancel" btnDone:@"Done"];
}

- (void)actionDelegateIntoButtons :(NSString *)btnTitle{
    if ([btnTitle isEqualToString:@"Cancel"]) {

    }else if ([btnTitle isEqualToString:@"Done"]){
        
    }else if ([btnTitle isEqualToString:@"Ok"]){
        
    }
}


@end
