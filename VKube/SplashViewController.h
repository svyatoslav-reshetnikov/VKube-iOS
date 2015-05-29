//
//  ViewController.h
//  VKube
//
//  Created by SVYAT on 02.04.15.
//  Copyright (c) 2015 HiT2B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VKSdk.h>

@interface SplashViewController : UIViewController <VKSdkDelegate>

@property(nonatomic, retain) IBOutlet UIImageView *logo;
@property(nonatomic, retain) IBOutlet UIImageView *man;

@property(nonatomic, retain) IBOutlet UIButton *fbLogin;
@property(nonatomic, retain) IBOutlet UIButton *vkLogin;

- (IBAction)facebookLogin:(id)sender;
- (IBAction)vkontakteLogin:(id)sender;

@end

