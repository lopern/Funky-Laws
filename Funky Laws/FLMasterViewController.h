//
//  FLMasterViewController.h
//  Funky Laws
//
//  Created by Alexander Alemayhu on 07.12.11.
//  Copyright (c) 2011 Flexnor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FLDetailViewController;

@interface FLMasterViewController : UITableViewController

@property (strong, nonatomic) FLDetailViewController *detailViewController;

@end
