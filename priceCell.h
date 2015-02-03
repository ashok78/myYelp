//
//  priceCell.h
//  myYelp
//
//  Created by Ashok Kumar on 2/2/15.
//  Copyright (c) 2015 ashok. All rights reserved.
//

#import <UIKit/UIKit.h>

@class priceCell;

@protocol priceCellProtocol <NSObject>

- (void) priceCell: (priceCell *) cell didUpdateValue: (BOOL) value;

@end
@interface priceCell : UITableViewCell
- (IBAction)priceChange:(id)sender;
@property (nonatomic, strong) id<priceCellProtocol> delegate;


@end
