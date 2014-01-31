//
//  AppDelegate.h
//  Sample
//
//  Created by Sujit Anand on 1/24/14.
//  Copyright (c) 2014 Sujit Anand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    MainViewController *mvc;
}

@property (strong, nonatomic) UIWindow *window;

@end
