//
//  ALDataViewController.h
//  QuickPopout
//
//  Created by Andrew Little on 2013-04-23.
//  Copyright (c) 2013 Andrew Little. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALDataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;

@end
