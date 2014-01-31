//
//  MainViewController.m
//  Sample
//
//  Created by Sujit Anand on 1/24/14.
//  Copyright (c) 2014 Sujit Anand. All rights reserved.
//

#import "MainViewController.h"
#import "CustomCell.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *tableView;
    NSString *path;
    NSDictionary *peopleDict;
    NSArray *dataArray;
    NSArray *sortedArray;
    NSArray *sortDescriptors;
    UIView *statusBar;
    UIView *headerView;
    UILabel *headerLabel;
}
@property (nonatomic,retain) UITableView *tableView;
@end

@implementation MainViewController
@synthesize tableView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    statusBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 22)];
    statusBar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBar];
    
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 22, self.view.frame.size.width,44.0)];
    headerView.backgroundColor = [UIColor blueColor];
    headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, headerView.frame.size.width, headerView.frame.size.height)];
    headerLabel.text = @"Phone Book";
    [headerLabel setTextAlignment:NSTextAlignmentCenter];
    [headerLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
    headerLabel.textColor = [UIColor whiteColor];
    [headerView addSubview:headerLabel];
    [self.view addSubview:headerView];
    
    tableView = [[UITableView alloc]init];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.frame = CGRectMake(0, 64, 320, 460);
    tableView.dataSource = self;
    tableView.delegate = self;
    path = [[NSBundle mainBundle]pathForResource:@"People" ofType:@"plist"];
    peopleDict  = [NSDictionary dictionaryWithContentsOfFile:path];
    dataArray = [peopleDict objectForKey:@"People"];
    [self.view addSubview:tableView];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]initWithKey:@"Name" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
    sortDescriptors = [NSArray arrayWithObjects:sort, nil];
    sortedArray = [dataArray sortedArrayUsingDescriptors:sortDescriptors];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath: (NSIndexPath *)indexPath{
    return 70.0f;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    CustomCell *cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.nameLabel.text = [[sortedArray objectAtIndex:indexPath.row]objectForKey:@"Name"];
    cell.locationLabel.text = [[sortedArray objectAtIndex:indexPath.row]objectForKey:@"Location"];
    cell.phoneLabel.text = [[sortedArray objectAtIndex:indexPath.row]objectForKey:@"Phone"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *phone = [[sortedArray objectAtIndex:indexPath.row]objectForKey:@"Phone"];
    NSString *phoneNumber = [@"telprompt://" stringByAppendingString:phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
