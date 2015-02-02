//
//  FilterViewController.h
//  myYelp
//
//  Created by Ashok Kumar on 1/31/15.
//  Copyright (c) 2015 ashok. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilterViewController;

@protocol FilterViewControllerDelegate <NSObject>

- (void) filterViewController:(FilterViewController *) filtersViewController didChangeFilters: (NSDictionary *) filters;

@end

@interface FilterViewController : UIViewController

@property (nonatomic, weak) id<FilterViewControllerDelegate> delegate;

@end
