//
//  ALQuickPopoutView.m
//  QuickPopout
//
//  Created by Andrew Little on 2013-04-28.
//  Copyright (c) 2013 Andrew Little. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ALQuickPopoutView.h"

#define QuickPopoutRegularSizedSideLength 264.0
#define QuickPopoutFullSizedSideLength 300.0

@implementation ALQuickPopoutView

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self) {
        [self roundCornersAndAddBorderToPopout];
    }
    return self;
}

-(void)roundCornersAndAddBorderToPopout {
    
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    self.layer.borderWidth = 1.0;
}

-(CGRect)fullSizedQuickPopoutFrame {
    
    CGFloat originX = (self.superview.frame.size.width - QuickPopoutFullSizedSideLength)/2;
    CGFloat originY = (self.superview.frame.size.height - QuickPopoutFullSizedSideLength)/2;
    
    return CGRectMake(originX, originY, QuickPopoutFullSizedSideLength, QuickPopoutFullSizedSideLength);
}

-(CGRect)regularSizedQuickPopoutFrame {
    
    CGFloat originX = (self.superview.frame.size.width - QuickPopoutRegularSizedSideLength)/2;
    CGFloat originY = (self.superview.frame.size.height - QuickPopoutRegularSizedSideLength)/2;
    
    return CGRectMake(originX, originY, QuickPopoutRegularSizedSideLength, QuickPopoutRegularSizedSideLength);
}

-(CGRect)zeroSizedQuickPopoutFrame {
    
    CGFloat originX = (self.superview.frame.size.width)/2;
    CGFloat originY = (self.superview.frame.size.height)/2;
    
    return CGRectMake(originX, originY, 0, 0);
}


-(void)show {
    
    self.frame = [self zeroSizedQuickPopoutFrame];
    
    [UIView animateWithDuration:0.20 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.frame = [self fullSizedQuickPopoutFrame];
    }
                     completion:^(BOOL finished){
                         
                         [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                             
                             self.frame = [self regularSizedQuickPopoutFrame];
                             
                         } completion:^(BOOL finished){
                             
                         }];
                     }];
}

-(void)hide {
    
    if (self.frame.size.height == 0) {
        return;
    }
    else {
        [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            self.frame = [self fullSizedQuickPopoutFrame];
        }
                         completion:^(BOOL finished){
                             
                             [UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                                 
                                 self.frame = [self zeroSizedQuickPopoutFrame];
                                 
                             } completion:^(BOOL finished){
                                 
                             }];
                         }];
    }
}
@end
