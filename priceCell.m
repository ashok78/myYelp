//
//  priceCell.m
//  myYelp
//
//  Created by Ashok Kumar on 2/2/15.
//  Copyright (c) 2015 ashok. All rights reserved.
//

#import "priceCell.h"

@interface priceCell()

@property (weak, nonatomic) IBOutlet UISegmentedControl *priceSegmentedControll;
@end

@implementation priceCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)priceChange:(id)sender {
    NSLog(@"Price change");
}
@end
