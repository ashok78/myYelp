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


NSString * const kYelpConsumerKey = @"O7Vz5WYJU2840gWsBNbmzg";
NSString * const kYelpConsumerSecret = @"cON2E2fYvsq6h7knf5A0pV1vLxk";
NSString * const kYelpToken = @"H_cWsuAWtItZjv6nriX09q_EqsSDXGls";
NSString * const kYelpTokenSecret = @"bkxV0GPLlTgH6sOaB_KFgGk_vm4";

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>
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

        [self.client searchWithTerm:@"Thai" success:^(AFHTTPRequestOperation *operation, id response) {
            NSLog(@"response: %@", response);
            
            NSArray *businessDictionaries = response[@"businesses"];
            
            self.businesses = [Business businessesWithDictionaries:businessDictionaries];
            [self.tableView reloadData];

            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"error: %@", [error description]);
        }];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BusinessCell" bundle:nil] forCellReuseIdentifier:@"BusinessCell"];
    
    self.tableView.rowHeight = 200;
    //UITableViewAutomaticDimension;
    

    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"Number of businesses %d", self.businesses.count);
    
    return self.businesses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BusinessCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"BusinessCell"];
    
    cell.business = self.businesses[indexPath.row];
    
    return cell;
}

@end
