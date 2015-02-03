//
//  FiltersNewViewController.m
//  myYelp
//
//  Created by Ashok Kumar on 2/2/15.
//  Copyright (c) 2015 ashok. All rights reserved.
//

#import "FiltersNewViewController.h"
#import "SwitchCell.h"
#import "priceCell.h"



@interface FiltersNewViewController () <UITableViewDataSource, UITableViewDelegate, SwitchCellProtocol, priceCellProtocol>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, readonly) NSDictionary *filters;

@end

@implementation FiltersNewViewController

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
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onCancelButton)];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(onApplyButton)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.3 green:0.5 blue:0.5 alpha:0.5];

    
    [self.tableView registerNib:[UINib nibWithNibName:@"SwitchCell" bundle:nil] forCellReuseIdentifier:@"SwitchCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"priceCell" bundle:nil] forCellReuseIdentifier:@"priceCell"];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onCancelButton{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onApplyButton{
    [self.delegate filtersNewViewController:self didChangeFilters:self.filters];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    priceCell *pCell;
    
    SwitchCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchCell"];
    
    
    switch (indexPath.section) {
        case 0:
            pCell = [tableView dequeueReusableCellWithIdentifier:@"priceCell"];
            pCell.delegate = self;
            return pCell;
        case 1:
            switch (indexPath.row){
                case 0:
                    cell.filterNameLabel.text = @"Open now";
                    break;
                case 1:
                    cell.filterNameLabel.text = @"Hot & New";
                    break;
                case 2:
                    cell.filterNameLabel.text = @"Offering a Deal";
                    break;
                case 3:
                    cell.filterNameLabel.text = @"Delivery";
                    break;
            }
            break;
        case 2:
            switch (indexPath.row){
                case 0:
                    cell.filterNameLabel.text = @"0.3 miles";
                    break;
                case 1:
                    cell.filterNameLabel.text = @"1 miles";
                    break;
                case 2:
                    cell.filterNameLabel.text = @"2 miles";
                    break;
                case 3:
                    cell.filterNameLabel.text = @"5 miles";
                    break;
            }
            break;
        case 3:
            switch (indexPath.row){
                case 0:
                    cell.filterNameLabel.text = @"Best Match";
                    break;
                case 1:
                    cell.filterNameLabel.text = @"Distance";
                    break;
                case 2:
                    cell.filterNameLabel.text = @"Rating";
                    break;
                case 3:
                    cell.filterNameLabel.text = @"Most Reviewed";
                    break;
            }
            break;
        case 4:
            switch (indexPath.row){
                case 0:
                    cell.filterNameLabel.text = @"Online ordering";
                    break;
                case 1:
                    cell.filterNameLabel.text = @"Online Reservations";
                    break;
                case 2:
                    cell.filterNameLabel.text = @"Take out";
                    break;
            }
            break;
        default:
            cell.filterNameLabel.text = @"Section doesn't exists";
            break;
    }
    
//    cell.on = [self.selectedCategories containsObject:self.categories[indexPath.row]];
    cell.delegate = self;
    return cell;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,  tableView.bounds.size.width, 30)];
    UILabel *labelHeader = [[UILabel alloc] initWithFrame:CGRectMake (0,0,320,30)];
    //labelHeader.textColor = [UIColor whiteColor];
    
    [headerView addSubview:labelHeader];
                           // [headerView setBackgroundColor:[UIColor clearColor]];
                            
                            switch(section){
                                case 0:
                                    labelHeader.text = @"Price";
                                    break;
                                case 1:
                                    labelHeader.text = @"Most Popular";
                                    break;
                                case 2:
                                    labelHeader.text = @"Distance";
                                    break;
                                case 3:
                                    labelHeader.text = @"Sort by";
                                    break;
                                case 4:
                                    labelHeader.text = @"General features";
                                    break;
                            }
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 4;
            break;
        case 2:
            return 4;
            break;
        case 3:
            return 4;
            break;
        case 4:
            return 3;
            break;
        default:
            return 0;
            break;
    }
}

- (void)switchCell:(SwitchCell *)cell didUpdateValue:(BOOL)value{
    
}

-(void)priceCell:(priceCell *)cell didUpdateValue:(BOOL)value{
    
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"Price";
            break;
        case 1:
            return @"Most Popular";
            break;
        case 2:
            return @"Distance";
            break;
        case 3:
            return @"Sort by";
            break;
        case 4:
            return @"General features";
            break;
        default:
            return @"No a case";
            break;
    }
}
                             

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

@end
