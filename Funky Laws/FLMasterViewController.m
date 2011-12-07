//
//  FLMasterViewController.m
//  Funky Laws
//
//  Created by Alexander Alemayhu on 07.12.11.
//  Copyright (c) 2011 Flexnor. All rights reserved.
//

#import "FLMasterViewController.h"

#import "FLDetailViewController.h"

@interface FLMasterViewController()
-(void) configureView;
-(void) openAllView;
-(void) openRandomView;
-(void) openAboutView;
@end

@implementation FLMasterViewController

@synthesize detailViewController = _detailViewController;

-(id) init{
    
    if (self = [super init]) {

    }
    
    return self;
}
							
- (void)dealloc
{
    [_detailViewController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - 
#pragma mark Private Methods

-(void) configureView{

    isAllView = YES;
    isAboutView = isRandomView = NO;
    
    //Set the title for the navbar
    [self setTitle:@"Funky Laws"];
    //Make our navbar and toolbar black
    [[[self navigationController] navigationBar] setTintColor:[UIColor blackColor]];
    [[[self navigationController] toolbar] setTintColor:[UIColor blackColor]];
    //Make the toolbar visible
    self.navigationController.toolbarHidden = NO;    

    
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [self.view addSubview:myTableView];
    
    //Init the buttons for the toolbar
    allViewButItem = [[UIBarButtonItem alloc] initWithTitle:@"All laws" style:UIBarButtonItemStyleBordered 
                                                     target:self action:@selector(openAllView)];
    aboutViewButItem = [[UIBarButtonItem alloc] initWithTitle:@"About" style:UIBarButtonItemStyleBordered 
                                                       target:self action:@selector(openAboutView)];
    randViewButItem = [[UIBarButtonItem alloc] initWithTitle:@"Random" style:UIBarButtonItemStyleBordered 
                                                      target:self action:@selector(openRandomView)];
    
    //We add some FlexibleSpace
    UIBarButtonItem	*space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                              target:nil action:nil];
    
    NSArray *toolbarItems = [NSArray arrayWithObjects:space, allViewButItem, space, randViewButItem, space, aboutViewButItem, space, nil];
    [self setToolbarItems:toolbarItems];
}

-(void) openAllView{
    
    if (isAllView == YES) {
        return ;
    }
    
}

-(void) openAboutView{
    
    [self setTitle:@"About"];
    
    if (isAllView == YES) {
        //Do something to clean up all view
        isAllView = NO;
    }else if (isRandomView == YES) {
       //Do something to clean up random view
        isRandomView = NO;
    }

    isAboutView = YES;
}

-(void) openRandomView{
    
    [self setTitle:@"Random law title"];
    
    if (isAllView == YES) {
        //Do something to clean up all view
        isAllView = NO;
    }else if (isAboutView == YES) {
        //Do something to clean up about view
        isAboutView = NO;
    }
    
    isRandomView = YES;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
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

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    // Configure the cell.
    cell.textLabel.text = [NSString stringWithFormat:@"Cell: %d", indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[[FLDetailViewController alloc] initWithNibName:@"FLDetailViewController" bundle:nil] autorelease];
    }
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
