//
//  FLMasterViewController.m
//  Funky Laws
//
//  Created by Alexander Alemayhu on 07.12.11.
//  Copyright (c) 2011 Flexnor. All rights reserved.
//

#import "FLMasterViewController.h"
#import "FLDetailViewController.h"
#import "Plist.h"
#import "LawObject.h"

@interface FLMasterViewController()
-(void) configureData;
-(void) configureView;
-(void) openAllView;
-(void) openRandomView;
-(void) openAboutView;
@end

@implementation FLMasterViewController

@synthesize detailViewController = _detailViewController;

-(id) init{
    
    if (self = [super init]) {
        
        [self configureData];
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

-(void) configureData{
    
    int lawCount = 100;
    NSRange range = NSMakeRange(0, 19);
    lawContainer = [[NSMutableArray alloc] init];
    
    NSString *plistName = @"Funny laws";
    Plist *plist = [[Plist alloc] init];
    
    NSDictionary *lawDict = [[NSDictionary alloc] initWithDictionary:[plist readPlist:plistName]];
    
    for (int i = 1; i <= lawCount; i++) {
        
        NSString *lawKey = [NSString stringWithFormat:@"%d", i];        
        NSString *lawDesc = [lawDict objectForKey:lawKey];
        NSString *lawTitle = [lawDesc substringWithRange:range];
        
        LawObject *law = [[[LawObject alloc] initWithTitle:lawTitle description:lawDesc] autorelease];        
        [lawContainer addObject:law];
    }
    
}

-(void) configureView{

    isAllView = YES;
    isAboutView = isRandomView = NO;

    //Set the title for the navbar
    [self setTitle:@"Menu"];
    //Make our navbar and toolbar black
    [[[self navigationController] navigationBar] setTintColor:[UIColor blackColor]];
    [[[self navigationController] toolbar] setTintColor:[UIColor blackColor]];
      
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    [self.view addSubview:myTableView];
    
    //Init the buttons for the toolbar
    allViewButItem = [[[UIBarButtonItem alloc] initWithTitle:@"All laws" style:UIBarButtonItemStyleBordered 
                                                     target:self action:@selector(openAllView)] autorelease];
    aboutViewButItem = [[[UIBarButtonItem alloc] initWithTitle:@"About" style:UIBarButtonItemStyleBordered 
                                                       target:self action:@selector(openAboutView)] autorelease];
    randViewButItem = [[[UIBarButtonItem alloc] initWithTitle:@"Random" style:UIBarButtonItemStyleBordered 
                                                      target:self action:@selector(openRandomView)] autorelease];
    
    //We add some FlexibleSpace
    UIBarButtonItem	*space = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                              target:nil action:nil] autorelease];
    
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
    //Make the toolbar visible
    self.navigationController.toolbarHidden = NO;  
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
    return 100;
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
    
    LawObject *law = [lawContainer objectAtIndex:indexPath.row];
    
    // Configure the cell.
    cell.textLabel.text = law.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    LawObject *law = [lawContainer objectAtIndex:indexPath.row];
        
    self.detailViewController = [[[FLDetailViewController alloc] initWithDescription:law.description] autorelease];
    self.detailViewController.title = law.title;
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
