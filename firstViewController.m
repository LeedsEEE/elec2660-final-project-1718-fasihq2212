//
//  firstViewController.m
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 26/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "firstViewController.h"

@interface firstViewController ()

@end

@implementation firstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.welcanimate shine];
    [self.swipanimate shine];
    
    //function to animate
    
    // Do any additional setup after loading the view.
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
#pragma mark Description

/*
 In this view controller, the user is welcomes to the main screen where the user can swipe to see the choices of questions. The MMDrawercontroller is initialised in this view controller. The welcome and swipe label are animated using RQShineLabel , a UILabel subclass
 

 */


@end
