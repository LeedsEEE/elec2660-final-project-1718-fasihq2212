//
//  AppDelegate.h
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 18/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDrawerController.h" //Declaration

@interface AppDelegate : UIResponder <UIApplicationDelegate>

//Here we are declaring the variables in order to use the side panel

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) MMDrawerController *drawercontroller; //Declaration





@end

