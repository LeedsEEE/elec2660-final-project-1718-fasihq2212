//
//  ResultViewController.m
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 25/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ResultViewController.h"


@interface ResultViewController ()

@end

@implementation ResultViewController

@synthesize passedonteststring;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.resultfinish];
    
    self.resultfinish.text = self.passedonteststring;
       [self.resultfinish shine];
    
    
    
    self.confetti = [[PHConfettiView alloc] initWithFrame:self.view.bounds];
    self.confetti.colors = @[[UIColor colorWithRed:0.95 green:0.40 blue:0.27 alpha:1.0],
                                 [UIColor colorWithRed:1.00 green:0.78 blue:0.36 alpha:1.0],
                                 [UIColor colorWithRed:0.48 green:0.78 blue:0.64 alpha:1.0],
                                 [UIColor colorWithRed:0.30 green:0.76 blue:0.85 alpha:1.0],
                                 [UIColor colorWithRed:0.58 green:0.39 blue:0.55 alpha:1.0]];
    self.confetti.type = PHConfettiTypeConfetti;
   
    
    [self.view addSubview:self.confetti];
    [self.confetti startConfetti];
    
    [self.view addSubview:self.tryagainprop];
     [self.view addSubview:self.chooseagainprop];

    


}
    // start Animation
   
    
            
    
    // Do any additional setup after loading the view
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"tryagainsegue"]){
        
        ThirdViewController *tryagainassign = (ThirdViewController *) segue.destinationViewController;
        tryagainassign.testtype = self.passedonteststring;
        
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}



- (IBAction)tryagain:(id)sender {
}

- (IBAction)chooseanother:(id)sender {
    
    
    
    AppDelegate *appdel = (AppDelegate*)[[UIApplication sharedApplication] delegate]; //created a type for app delegate. it has been imported here.
    
    
    UIStoryboard *mainstory = [UIStoryboard storyboardWithName: @"Main" bundle:nil]; //create a story board
    
    UIViewController *leftview = [mainstory instantiateViewControllerWithIdentifier:@"LeftTableViewController"];     //creating UI view controllers called left view,,right view etc. We are not going to use right as I only want the left view to slide out
    
    UIViewController *centreview = [mainstory instantiateViewControllerWithIdentifier:@"CentreViewController"];
    
    
    UINavigationController *leftnav = [[UINavigationController alloc] initWithRootViewController: leftview]; //create navigation controllers from the view controllers.
    UINavigationController *centrenav = [[UINavigationController alloc] initWithRootViewController: centreview];
    
    self.callfuncsidep = [[MMDrawerController alloc]initWithCenterViewController:centrenav leftDrawerViewController:leftnav]; //assign the navigation  controllers to leftdrawer/right drawer etc..
    
    self.callfuncsidep.openDrawerGestureModeMask = MMOpenDrawerGestureModePanningCenterView;
    self.callfuncsidep.closeDrawerGestureModeMask = MMCloseDrawerGestureModePanningCenterView;
    
    
    [self.callfuncsidep setMaximumLeftDrawerWidth:270];
    
    [self.callfuncsidep  setDrawerVisualStateBlock:[MMDrawerVisualState swingingDoorVisualStateBlock]]; //This is the animation block.. different ones can be used such as parallax etc
    
    appdel.window.rootViewController = self.callfuncsidep; // We are getting the window variable from app delegate and declaring it here. Normally, _window.rootViewController would have been used
    [appdel.window makeKeyAndVisible];
    

}
@end
