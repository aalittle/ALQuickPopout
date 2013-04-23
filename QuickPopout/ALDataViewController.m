//
//  ALDataViewController.m
//  QuickPopout
//
//  Created by Andrew Little on 2013-04-23.
//  Copyright (c) 2013 Andrew Little. All rights reserved.
//

#import "ALDataViewController.h"

@interface ALDataViewController ()

@end

@implementation ALDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

@end
