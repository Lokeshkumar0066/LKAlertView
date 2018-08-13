# LKAlertView
LKAlertView is a Flat Customizable AlertView for iOS (Objective C). You can use the LKAlertView for display some information like a  AlertView, Toast, etc.

![alert](https://user-images.githubusercontent.com/26429027/44019202-bd17a3bc-9efb-11e8-8a3e-fdc01bc5b91f.gif)


# Features
AlertView Customization
Easy & Quick Integration

# Requirements
iOS 9.0+                
Xcode 9.1+                
Swift 4.0+                

# Manual
You can directly add the LKAlertView Library into your Xcode project.

Now, you can show AlertView with status message:

### Objective C

DrawAlertView *objAlert = [DrawAlertView loadFromNib:@"DrawAlertView" classToLoad:[DrawAlertView class]];                
[objAlert initWithDelegate:self message:@"Learning is project created to capture time where some R&D is required for development, it is to be used for KT and Understanding new technology." title:@"Alert!!" btnOK:nil btnCancel:@"Cancel" btnDone:@"Done"];


# Customization
### Objective C

objAlert.messageColor = [UIColor lightGrayColor];                                                                    
objAlert.titleColor = [UIColor darkGrayColor];                                                                    
objAlert.buttonBgColor = [UIColor colorWithRed:0.0f/255.0f green:143.0f/255.0f blue:0.0f/255.0f alpha:1.0];                  
objAlert.buttonTextColor = [UIColor whiteColor];                                                                    
objAlert.isEmojiFailure = NO;                                                                    
