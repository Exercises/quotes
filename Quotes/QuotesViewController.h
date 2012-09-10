//
//  QuotesViewController.h
//  Quotes
//
//  Created by Moe Burney on 2012-08-15.
//  Copyright (c) 2012 Dev70. All rights reserved.
//

@class Quote, QuotesAppDelegate;

#import <UIKit/UIKit.h>
#import "contentViewController.h"

@interface QuotesViewController : UIViewController
<UIPageViewControllerDataSource>
{
    //Quote *aQuote;
    int qcount;
    int daysElapsed;
    QuotesAppDelegate *appDelegate;
    UIPageViewController *pageController;
    NSArray *pageContent;
    NSDate *startDate;
}

//@property (nonatomic) Quote *aQuote;
@property (strong, nonatomic) UIPageViewController *pageController;
@property (strong, nonatomic) NSArray *pageContent;
@property (strong, nonatomic) NSDate *startDate;


@end
