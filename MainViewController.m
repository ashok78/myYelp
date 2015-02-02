//
//  MainViewController.m
//  myYelp
//
//  Created by Ashok Kumar on 1/29/15.
//  Copyright (c) 2015 ashok. All rights reserved.
//

#import "MainViewController.h"
#import "myYelpClient.h"
#import "Business.h"
#import "BusinessCell.h"
#import "FilterViewController.h"

NSString * const kYelpConsumerKey = @"O7Vz5WYJU2840gWsBNbmzg";
NSString * const kYelpConsumerSecret = @"cON2E2fYvsq6h7knf5A0pV1vLxk";
NSString * const kYelpToken = @"H_cWsuAWtItZjv6nriX09q_EqsSDXGls";
NSString * const kYelpTokenSecret = @"bkxV0GPLlTgH6sOaB_KFgGk_vm4";

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate, FilterViewControllerDelegate>
@property (nonatomic, strong) myYelpClient *client;
@property (nonatomic, strong) NSArray * businesses;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.client = [[myYelpClient alloc] initWithConsumerKey:kYelpConsumerKey consumerSecret:kYelpConsumerSecret accessToken:kYelpToken accessSecret:kYelpTokenSecret];
        [self fetchBusinessesWithQuery:@"Restaurants" params:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BusinessCell" bundle:nil] forCellReuseIdentifier:@"BusinessCell"];
    
    self.tableView.rowHeight = 90;
    //UISearchBar *searchBar = [[UISearchBar alloc] init];
    self.navigationItem.titleView = [[UISearchBar alloc] init];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Filters" style:UIBarButtonItemStylePlain target:self action:@selector(onFilterButton)];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.businesses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BusinessCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BusinessCell"];
    
    cell.business = self.businesses[indexPath.row];
    
    return cell;
}

- (void)filterViewController:(FilterViewController *)filtersViewController didChangeFilters:(NSDictionary *)filters{
    [self fetchBusinessesWithQuery:@"Restaurants" params:filters];
    NSLog(@"filters changed %@", filters);
}

- (void) onFilterButton{
    NSLog(@"Filter button clicked");
    
    FilterViewController *vc = [[FilterViewController alloc] init];
    
    vc.delegate = self;
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:nvc animated:YES completion:nil];
}

- (void) fetchBusinessesWithQuery:(NSString *) query params:(NSDictionary *) params {
    [self.client searchWithTerm:query params:params success:^(AFHTTPRequestOperation *operation, id response) {
        NSArray *businessDictionaries = response[@"businesses"];
        
        self.businesses = [Business businessesWithDictionaries:businessDictionaries];
        [self.tableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", [error description]);
    }];
}

@end
