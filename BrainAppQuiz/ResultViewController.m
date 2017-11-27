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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.confetti = [[PHConfettiView alloc] initWithFrame:self.view.bounds];
    self.confetti.colors = @[[UIColor colorWithRed:0.95 green:0.40 blue:0.27 alpha:1.0],
                                 [UIColor colorWithRed:1.00 green:0.78 blue:0.36 alpha:1.0],
                                 [UIColor colorWithRed:0.48 green:0.78 blue:0.64 alpha:1.0],
                                 [UIColor colorWithRed:0.30 green:0.76 blue:0.85 alpha:1.0],
                                 [UIColor colorWithRed:0.58 green:0.39 blue:0.55 alpha:1.0]];
    self.confetti.type = PHConfettiTypeConfetti;
    
    [self.view addSubview:self.confetti];
    [self.confetti startConfetti];

    


}
    // start Animation
   
    
            
    
    // Do any additional setup after loading the view
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

@end
