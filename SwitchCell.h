//
//  SwitchCell.h
//  myYelp
//
//  Created by Ashok Kumar on 1/31/15.
//  Copyright (c) 2015 ashok. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwitchCell;

@protocol SwitchCellProtocol <NSObject>

- (void) switchCell: (SwitchCell *) cell didUpdateValue: (BOOL) value;

@end

@interface SwitchCell : UITableViewCell

@property (nonatomic, strong) id<SwitchCellProtocol> delegate;
@property (nonatomic, assign) BOOL on;
@property (weak, nonatomic) IBOutlet UILabel *filterNameLabel;
-(void) setOn:(BOOL)on animated:(BOOL)animated;





@end
