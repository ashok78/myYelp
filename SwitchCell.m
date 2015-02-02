//
//  SwitchCell.m
//  myYelp
//
//  Created by Ashok Kumar on 1/31/15.
//  Copyright (c) 2015 ashok. All rights reserved.
//

#import "SwitchCell.h"

@interface SwitchCell()
- (IBAction)valueChangeSwitch:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *valueSwitch;

@end

@implementation SwitchCell

- (void)awakeFromNib
{
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)valueChangeSwitch:(id)sender {
    [self.delegate switchCell:self didUpdateValue:self.valueSwitch.on];
}

- (void) setOn:(BOOL)on{
    [self setOn:on animated:NO];
}

-(void) setOn:(BOOL)on animated:(BOOL)animated{
    _on = on;
    [self.valueSwitch setOn:on animated:animated];
    
}
@end
