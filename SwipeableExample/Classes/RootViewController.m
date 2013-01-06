//
//  RootViewController.m
//  SwipeableExample
//
//  Created by Tom Irving on 16/06/2010.
//  Copyright Tom Irving 2010. All rights reserved.
//

#import "RootViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation RootViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	
	[self.tableView setRowHeight:54];
	[self.navigationItem setTitle:@"Swipeable TableView"];
    [super viewDidLoad];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
	
	ExampleCell * cell = (ExampleCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) cell = [[ExampleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    [cell setDelegate:self];
	[cell setText:[NSString stringWithFormat:@"Swipe me! (Row %i)", indexPath.row]];
	[cell setDelegate:self];
	
    return cell;
}

#pragma mark -
#pragma mark Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Cell Selected" 
														 message:[NSString stringWithFormat:@"You tapped cell %i", indexPath.row]
														delegate:nil 
											   cancelButtonTitle:@"OK" 
											   otherButtonTitles:nil];
	
	[alertView show];
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	[super tableView:tableView didSelectRowAtIndexPath:indexPath];
}


static void completionCallback(SystemSoundID soundID, void * clientData) {
	AudioServicesRemoveSystemSoundCompletion(soundID);
}

- (void)tableView:(UITableView *)tableView didSwipeCellAtIndexPath:(NSIndexPath *)indexPath {
	
	[super tableView:tableView didSwipeCellAtIndexPath:indexPath];
	
	NSString * path = [[NSBundle mainBundle] pathForResource:@"tick" ofType:@"wav"];
	NSURL * fileURL = [NSURL fileURLWithPath:path isDirectory:NO];
	
	SystemSoundID soundID;
	AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileURL, &soundID);
	AudioServicesPlaySystemSound(soundID);
	AudioServicesAddSystemSoundCompletion (soundID, NULL, NULL, completionCallback, NULL);
}

- (void)cellBackButtonWasTapped:(ExampleCell *)cell {
	
	UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"BackView Button" 
														 message:@"WHOA! YOU TAPPED A BACKVIEW BUTTON!" 
														delegate:nil cancelButtonTitle:@"Sorry" 
											   otherButtonTitles:nil];
	[alertView show];
	
	[self hideVisibleBackView:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	[super scrollViewDidScroll:scrollView];
	
	// You gotta call super in all the methods you see here doing it.
	// Otherwise, you will end up with cells not hiding their backViews.
}

@end

