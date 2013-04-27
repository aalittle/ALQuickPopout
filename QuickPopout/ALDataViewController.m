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
    [self roundCornersAndAddBorderToPopout];
    [self hideQuickPopout];
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

    [self displayQuickPopout];
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

-(void)roundCornersAndAddBorderToPopout {
    
    self.quickPopoutView.layer.cornerRadius = 10;
    self.quickPopoutView.layer.masksToBounds = YES;
    self.quickPopoutView.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    self.quickPopoutView.layer.borderWidth = 1.0;
}

-(CGRect)fullSizedQuickPopoutFrame {
    
    CGFloat originX = (self.containerView.frame.size.width - QuickPopoutFullSizedSideLength)/2;
    CGFloat originY = (self.containerView.frame.size.height - QuickPopoutFullSizedSideLength)/2;
    
    return CGRectMake(originX, originY, QuickPopoutFullSizedSideLength, QuickPopoutFullSizedSideLength);
}

-(CGRect)regularSizedQuickPopoutFrame {
    
    CGFloat originX = (self.containerView.frame.size.width - QuickPopoutRegularSizedSideLength)/2;
    CGFloat originY = (self.containerView.frame.size.height - QuickPopoutRegularSizedSideLength)/2;

    return CGRectMake(originX, originY, QuickPopoutRegularSizedSideLength, QuickPopoutRegularSizedSideLength);
}

-(CGRect)zeroSizedQuickPopoutFrame {
    
    CGFloat originX = (self.containerView.frame.size.width)/2;
    CGFloat originY = (self.containerView.frame.size.height)/2;
    
    return CGRectMake(originX, originY, 0, 0);
}

-(void)displayQuickPopout {
    
    self.quickPopoutView.frame = [self zeroSizedQuickPopoutFrame];
        
    [UIView animateWithDuration:0.20 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.quickPopoutView.frame = [self fullSizedQuickPopoutFrame];
    }
    completion:^(BOOL finished){
    
        [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
            self.quickPopoutView.frame = [self regularSizedQuickPopoutFrame];

        } completion:^(BOOL finished){
        
        }];
    }];
}

-(void)hideQuickPopout {
    
    if (self.quickPopoutView.frame.size.height == 0) {
        return;
    }
    else {
        [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            self.quickPopoutView.frame = [self fullSizedQuickPopoutFrame];
         }
         completion:^(BOOL finished){
             
             [UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                 
                 self.quickPopoutView.frame = [self zeroSizedQuickPopoutFrame];
                 NSLog(@"x%f y%f", self.quickPopoutView.frame.origin.x, self.quickPopoutView.frame.origin.y);
                 
             } completion:^(BOOL finished){
                 
             }];
         }];
    }
}


- (IBAction)tapGestureHandler:(id)sender {
    
    [self hideQuickPopout];
}

@end
