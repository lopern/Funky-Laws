//
//  FLDetailViewController.h
//  Funky Laws
//
//  Created by Alexander Alemayhu on 07.12.11.
//  Copyright (c) 2011 Flexnor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
