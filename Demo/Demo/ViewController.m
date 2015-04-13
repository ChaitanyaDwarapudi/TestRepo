//
//  ViewController.m
//  Demo
//
//  Created by flexih on 7/8/14.
//  Copyright (c) 2014 flexih. All rights reserved.
//

#import "ViewController.h"
#import "scrollTableview.h"

@interface ViewController ()

@end

CGFloat tableViewHeight(UITableView *tableView) {
    NSInteger lastSection = tableView.numberOfSections - 1;
    while (lastSection >= 0 && [tableView numberOfRowsInSection:lastSection] <= 0)
        lastSection--;
    if (lastSection < 0)
        return 0;
    CGRect lastFooterRect = [tableView rectForFooterInSection:lastSection];
    return lastFooterRect.origin.y + lastFooterRect.size.height;
}

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    scrollTableview *mazeScrollView = [[scrollTableview alloc] initWithFrame:self.view.bounds];
    mazeScrollView.delegate=self;
    mazeScrollView.dataSource=self;
    
    mazeScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) * 3);
    
    NSLog(@"Content height--%f",tableViewHeight(mazeScrollView));
    
    if (tableViewHeight(mazeScrollView)>mazeScrollView.contentSize.height) {
        
        mazeScrollView.showsVerticalScrollIndicatorAlways=YES;
    }
    else
    {
        mazeScrollView.showsVerticalScrollIndicatorAlways=NO;
 
    }
    
    [self.view addSubview:mazeScrollView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // for Nib File
    
    if (cell == nil)
    {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    cell.textLabel.text = @"hi";
    
    return cell;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
