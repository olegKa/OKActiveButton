//
//  OKViewController.m
//  OKActiveButton
//
//  Created by olegKa on 12/10/2016.
//  Copyright (c) 2016 olegKa. All rights reserved.
//



#import "OKViewController.h"
#import <OKActiveButton/OKActiveButton.h>

@interface OKViewController ()
{
    __weak IBOutlet OKActiveButton *button;
}
@end

@implementation OKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)button:(id)sender {
    button.isActivity = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        button.isActivity = NO;
    });
}

- (IBAction)switchShadow:(UISwitch *)sender {
    button.shadowHidden = !sender.on;
}

- (IBAction)switchGradient:(UISwitch *)sender {
    button.gradientHidden = !sender.on;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
