//
//  FiltersNewViewController.h
//  myYelp
//
//  Created by Ashok Kumar on 2/2/15.
//  Copyright (c) 2015 ashok. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FiltersNewViewController;

@protocol FiltersNewViewControllerDelegate <NSObject>

- (void) filtersNewViewController:(FiltersNewViewController *) filtersNewViewController didChangeFilters: (NSDictionary *) filters;

@end

@interface FiltersNewViewController : UIViewController

@property (nonatomic, weak) id<FiltersNewViewControllerDelegate> delegate;


@end
