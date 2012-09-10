//
//  QuotesAppDelegate.h
//  Quotes
//
//  Created by Moe Burney on 2012-08-15.
//  Copyright (c) 2012 Dev70. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuotesViewController;

@interface QuotesAppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
    QuotesViewController *viewController;
    UINavigationController *navigationController;

    NSMutableArray *quotes;
}

@property (nonatomic) IBOutlet UIWindow *window;
@property (nonatomic) IBOutlet QuotesViewController *viewController;
@property (nonatomic) IBOutlet UINavigationController *navigationController;
@property (nonatomic) NSMutableArray *quotes;


@end
