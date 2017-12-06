//
//  ViewController.m
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 18/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.buttonp.layer setBorderWidth:1.0];
    [self.buttonp.layer setBorderColor:[[UIColor blackColor] CGColor]];
  
    }
// Here we are using the setborderwidth function in order to set a border for the 'Begin" button.

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


 #pragma mark - Navigation
- (IBAction)action1button:(UIButton *)sender{
  
    
    AppDelegate *appdel = (AppDelegate*)[[UIApplication sharedApplication] delegate]; //created a type for app delegate. it has been imported here.

    
    UIStoryboard *mainstory = [UIStoryboard storyboardWithName: @"Main" bundle:nil]; //create a story board
    
    UIViewController *leftview = [mainstory instantiateViewControllerWithIdentifier:@"LeftTableViewController"];     //creating UI view controllers called left view,,right view etc. We are not going to use right as I only want the left view to slide out
    
    UIViewController *centreview = [mainstory instantiateViewControllerWithIdentifier:@"CentreViewController"];
    
    
    UINavigationController *leftnav = [[UINavigationController alloc] initWithRootViewController: leftview]; //create navigation controllers from the view controllers.
    UINavigationController *centrenav = [[UINavigationController alloc] initWithRootViewController: centreview];

    self.drawercontroller = [[MMDrawerController alloc]initWithCenterViewController:centrenav leftDrawerViewController:leftnav]; //assign the navigation  controllers to leftdrawer/right drawer etc..
    
    self.drawercontroller.openDrawerGestureModeMask = MMOpenDrawerGestureModePanningCenterView;
    self.drawercontroller.closeDrawerGestureModeMask = MMCloseDrawerGestureModePanningCenterView;
    [self.drawercontroller setMaximumLeftDrawerWidth:270];

    
    [self.drawercontroller  setDrawerVisualStateBlock:[MMDrawerVisualState swingingDoorVisualStateBlock]]; //This is the animation block.. different ones can be used such as parallax etc
    
    appdel.window.rootViewController = self.drawercontroller; // We are getting the window variable from app delegate and declaring it here. Normally, _window.rootViewController would have been used
    [appdel.window makeKeyAndVisible];
    

}


// Here we are going to carry out the side drawer when the Begin button is pressed. It does not work when this code below is inserted into the viewdidload function in the welcome view controller. We are using the app delegate to set the root view controller.
//First, the main storyboard is initialised and the left view contoller and centre view controller is begin instantiated. Each of these view controller have been given story board ids called left table view controller and centre view controller. We use:

//UIViewController *leftview = [mainstory instantiateViewControllerWithIdentifier:@"LeftTableViewController"];
//UIViewController *centreview = [mainstory instantiateViewControllerWithIdentifier:@"CentreViewController"];


// Next we are going to initiate navaigation controllers to the view controllers. This is because for the MMDrawercontroller to work, we need to create navigation controllers. Centrenav and leftnav are the two navigation controllers created

//self.drawercontroller = [[MMDrawerController alloc]initWithCenterViewController:centrenav leftDrawerViewController:leftnav];

// The properties of the panel are then set and drawer controller is initiated.



///////////////////// MMDDrawerController by MutualMobile-- fetched from Github.com////////////////////////
///////////////Implementation of code from https://www.youtube.com/watch?v=snYmY138RIs by Akash Patel/////



@end
