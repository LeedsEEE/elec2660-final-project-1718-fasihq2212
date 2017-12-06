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

@synthesize passedonteststring, label, finalscorealpha, passedonscore;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tryagainprop.layer setBorderWidth:1.0];
    [self.tryagainprop.layer setBorderColor:[[UIColor blackColor] CGColor]];
    
    [self.chooseagainprop.layer setBorderWidth:1.0];
    [self.chooseagainprop.layer setBorderColor:[[UIColor blackColor] CGColor]];
    

    [self.view addSubview:self.resultfinish];
    [self.view addSubview:self.finalscorealpha];
 

    self.resultfinish.text = self.passedonteststring;
       [self.resultfinish shine];
    
    self.confetti = [[PHConfettiView alloc] initWithFrame:self.view.bounds];
    self.confetti.colors = @[[UIColor colorWithRed:0.95 green:0.40 blue:0.27 alpha:1.0],
                                 [UIColor colorWithRed:1.00 green:0.78 blue:0.36 alpha:1.0],
                                 [UIColor colorWithRed:0.48 green:0.78 blue:0.64 alpha:1.0],
                                 [UIColor colorWithRed:0.30 green:0.76 blue:0.85 alpha:1.0],
                                 [UIColor colorWithRed:0.58 green:0.39 blue:0.55 alpha:1.0]];
    self.confetti.type = PHConfettiTypeConfetti;
    [self.finalscorealpha shine];
    
    [self.view addSubview:self.confetti];
    [self.confetti startConfetti];
    
    [self.view addSubview:self.tryagainprop];
     [self.view addSubview:self.chooseagainprop];
    [self.view addSubview:self.infooutlet];
    
    self.timeshine.text = [NSString stringWithFormat:@"Time: %.2f seconds", self.passedontime];
    self.scoreshine.text = [NSString stringWithFormat:@"Score: %li", (long)self.passedonscore];
    
    [self.timeshine shine];
    [self.scoreshine shine];
    self.label = [[DPScrollNumberLabel alloc] initWithNumber:@(0) font:[UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:40] textColor:[UIColor grayColor] rowNumber:5];
    
    self.label.frame = CGRectMake(210, 500, self.label.frame.size.width, self.label.frame.size.height);
    
    [self.view addSubview:self.label];


    [self performSelector:@selector(displayfinalscore) withObject:nil afterDelay:3.0];
    
    
    

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
    
    if ([segue.identifier isEqualToString:@"backtonorm"]){
        
        ThirdViewController *tryagainassign = (ThirdViewController *) segue.destinationViewController;
        tryagainassign.testtype = self.passedonteststring;
    }
    
    else {
        
        TrueFalseViewController *dec = (TrueFalseViewController *) segue.destinationViewController;
        dec.truefalsetest = self.passedonteststring;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}



- (IBAction)tryagain:(id)sender {
    
    
    if ([self.passedonteststring isEqualToString:@"General Knowledge"] || [self.passedonteststring isEqualToString:@"Numerical Reasoning"]){
        
        [self performSegueWithIdentifier:@"backtonorm" sender:self];
    }
    
    else {
        
        [self performSegueWithIdentifier:@"backtotrue" sender:self];

    }
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

-(void) displayfinalscore{
    
    if (self.passedonscore <10){
        
        int score = (self.passedonscore * 1) + (1000/self.passedontime);
        [self.label changeToNumber:@(score) animated:YES];
        NSLog(@"first");
    }
    
    else if (self.passedonscore >=10 && self.passedonscore <15){
        
        int score = (self.passedonscore * 2.5) + (1000/self.passedontime);
        [self.label changeToNumber:@(score) animated:YES];
         NSLog(@"sec");

    }
    else if (self.passedonscore >=15 && self.passedonscore <20){
        
        int score = (self.passedonscore * 3.5) + (1000/self.passedontime);
        [self.label changeToNumber:@(score) animated:YES];
         NSLog(@"third");

        
    }
    else if (self.passedonscore >=20 && self.passedonscore <25){
        
        int score = (self.passedonscore * 5) + (1000/self.passedontime);
        [self.label changeToNumber:@(score) animated:YES];
         NSLog(@"fourth");

        
    }
    
    else if (self.passedonscore >=25 && self.passedonscore <30){
        
        int score = (self.passedonscore * 6) + (1000/self.passedontime);
        [self.label changeToNumber:@(score) animated:YES];
        NSLog(@"fifth");
        
    }
    
    else if (self.passedonscore>=30){
        
        int score = (self.passedonscore * 8) + (1000/self.passedontime);
        [self.label changeToNumber:@(score) animated:YES];
         NSLog(@"six");
        

    }
    

    [ProgressHUD showSuccess];
}


@end
