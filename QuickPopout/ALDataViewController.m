//
//  ALDataViewController.m
//  QuickPopout
//
//  Created by Andrew Little on 2013-04-23.
//  Copyright (c) 2013 Andrew Little. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ALDataViewController.h"

@interface ALDataViewController ()

@end

@implementation ALDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    [self roundCornersAndAddBorderToContainerView];
    [self roundCornersAndSetBackgroundOnButton];
    [self.quickPopoutView hide];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (IBAction)onTapActionButton:(id)sender {

    [self.quickPopoutView show];
}

#define QuickPopoutRegularSizedSideLength 264.0
#define QuickPopoutFullSizedSideLength 300.0

-(void)roundCornersAndSetBackgroundOnButton {
    
    self.actionButton.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:180.0/255.0 blue:0 alpha:1.0];
    self.actionButton.layer.cornerRadius = 5;
    self.actionButton.layer.masksToBounds = YES;
}

-(void)roundCornersAndAddBorderToContainerView {
    
    self.containerView.layer.cornerRadius = 5;
    self.containerView.layer.masksToBounds = YES;
    self.containerView.layer.borderColor = [[UIColor colorWithRed:244.0/255.0 green:180.0/255.0 blue:0 alpha:1.0] CGColor];
    self.containerView.layer.borderWidth = 1.0;
}

- (IBAction)tapGestureHandler:(id)sender {
    
    [self.quickPopoutView hide];
}

@end
