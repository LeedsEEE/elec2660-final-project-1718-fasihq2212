//
//  failViewController.m
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 02/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "failViewController.h"

@interface failViewController ()

@end

@implementation failViewController

@synthesize  functest;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scorefinalnegative.text = @"You achieved a score below 0!"; // The user is notified that the score has fallen below 0. label is then animated using RQShineLabel
    [self.scorefinalnegative shine];
    [self.tryagainp.layer setBorderWidth:1.0];
    [self.tryagainp.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.chooseanother.layer setBorderWidth:1.0];
    [self.chooseanother.layer setBorderColor:[[UIColor blackColor] CGColor]]; //  The try again button and go back button are given borders.
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"tryfromfail"]){  //The same failviewcontroller is linked with the ThirdViewController (General Knowledge and Numerical Reasoning) and TrueFalseViewController ( true or false trivia). We will pass on data to the relevant view controller depending on the segue being called and this depends on the type of test that was passed on to this view controller from either ThirdViewController or TrueFalseviewController.
        
        ThirdViewController *final = (ThirdViewController*) segue.destinationViewController;
        final.testtype = self.functest;
    }
    
    else if ([segue.identifier isEqualToString:@"tryagaintrue"]){
        
        TrueFalseViewController *trivia = (TrueFalseViewController *) segue.destinationViewController;
        trivia.truefalsetest = self.functest;
        
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)failtry:(UIButton *)sender {  //The try again button determines the segue performed.
    
    if ([self.functest isEqualToString:@"Numerical Reasoning"] || [self.functest isEqualToString:@"General Knowledge"]){ // if the self.func test is General Knowledge or Numerical Reasoning (ie the user has come from ThirdViewController) the tryfromfail segue is carried out. The corresponding preparation is carried out in prepareforsegue
    
    [self performSegueWithIdentifier:@"tryfromfail" sender:self];
}
    
    else {
        
        [self performSegueWithIdentifier:@"tryagaintrue" sender:self];
    }

}

- (IBAction)choosefail:(UIButton *)sender { // If the user chooses to choose another category, the same code used to come up with the MMDrawerController is used.
    
    
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
@end
