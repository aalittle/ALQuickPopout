//
//  ALModelController.h
//  QuickPopout
//
//  Created by Andrew Little on 2013-04-23.
//  Copyright (c) 2013 Andrew Little. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALDataViewController;

@interface ALModelController : NSObject <UIPageViewControllerDataSource>

- (ALDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(ALDataViewController *)viewController;

@end
