//
//  FLDetailViewController.m
//  Funky Laws
//
//  Created by Alexander Alemayhu on 07.12.11.
//  Copyright (c) 2011 Flexnor. All rights reserved.
//

#import "FLDetailViewController.h"

@interface FLDetailViewController ()
- (void)configureView;
@end

@implementation FLDetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;


-(id) initWithDescription:(NSString *)aDescription{
    
    if (self = [super init]) {
        lawDescription = [aDescription copy];
    }
    
    return self;
}

- (void)dealloc
{
    [lawDescription release];
    [_detailItem release];
    [_detailDescriptionLabel release];
    [super dealloc];
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release]; 
        _detailItem = [newDetailItem retain]; 

        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    //Add the the law description
    UITextView *textView = [[[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)] autorelease];    
    [textView setText:lawDescription];
    [textView setFont:[UIFont fontWithName:@"Arial" size:20]];
    
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{   
    //Hide the toolbar
    self.navigationController.toolbarHidden = YES;  
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

							
@end
