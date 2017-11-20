//
//  BeginSecondViewController.m
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 19/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "BeginSecondViewController.h"

@interface BeginSecondViewController ()

@end

@implementation BeginSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.typeoftestlabel.text = self.typee.typeoftest; //declaring the variables here 'typee' is the class for the type of test and description
    self.descriptionlabel.text = self.typee.desc;
    
//Line break code from stack overflow -- https://stackoverflow.com/questions/990221/multiple-lines-of-text-in-uilabel ////
    
    
    self.descriptionlabel.lineBreakMode = NSLineBreakByWordWrapping; // These two lines of code have been implemented so that there is a word wrap with the UILabel. Since its a long descripion, it looks better when the text is word wrapped as opposed to one long line.
    self.descriptionlabel.numberOfLines = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backbuttonpressed:(UIButton *)sender { //similar to the initial view controller, when the go back button is pressed, the side panel in the welcome screen is initiated
    
    ///////////////////// MMDDrawerController by MutualMobile-- fetched from Github.com////////////////////////
    ///////////////Implementation of code from https://www.youtube.com/watch?v=snYmY138RIs by Akash Patel/////

    
    
    AppDelegate *appdel = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    
    UIStoryboard *mainstory = [UIStoryboard storyboardWithName: @"Main" bundle:nil]; //create a story board
    
    UIViewController *leftview = [mainstory instantiateViewControllerWithIdentifier:@"LeftTableViewController"];     //creating UI view controllers called left view,,right view etc. We are not going to use right as I only want the left view to slide out
    
    UIViewController *centreview = [mainstory instantiateViewControllerWithIdentifier:@"CentreViewController"];
    
    
    UINavigationController *leftnav = [[UINavigationController alloc] initWithRootViewController: leftview]; //create navigation controllers from the view controllers.
    UINavigationController *centrenav = [[UINavigationController alloc] initWithRootViewController: centreview];
    
    self.drawercontroller = [[MMDrawerController alloc]initWithCenterViewController:centrenav leftDrawerViewController:leftnav]; //assign the navigation  controllers to leftdrawer/right drawer etc..
    
    self.drawercontroller.openDrawerGestureModeMask = MMOpenDrawerGestureModePanningCenterView;
    self.drawercontroller.closeDrawerGestureModeMask = MMCloseDrawerGestureModePanningCenterView;
    
    
    
    
    [self.drawercontroller  setDrawerVisualStateBlock:[MMDrawerVisualState swingingDoorVisualStateBlock]]; //This is the animation block.. different ones can be used such as parallax etc
    
    appdel.window.rootViewController = self.drawercontroller; // We are getting the window variable from app delegate and declaring it here. Normally, _window.rootViewController would have been used
    [appdel.window makeKeyAndVisible];
    

}
@end
