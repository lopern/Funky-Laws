//
//  FLMasterViewController.h
//  Funky Laws
//
//  Created by Alexander Alemayhu on 07.12.11.
//  Copyright (c) 2011 Flexnor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FLDetailViewController;

@interface FLMasterViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    UITableView *myTableView;
    
    UIBarButtonItem *allViewButItem;
    UIBarButtonItem *randViewButItem;
    UIBarButtonItem *aboutViewButItem;
    
    //keep track of which view is visible
    BOOL isAllView, isAboutView, isRandomView;
    
    NSMutableArray *lawContainer;
}

@property (strong, nonatomic) FLDetailViewController *detailViewController;

@end
