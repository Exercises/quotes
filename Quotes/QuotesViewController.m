//
//  QuotesViewController.m
//  Quotes
//
//  Created by Moe Burney on 2012-08-15.
//  Copyright (c) 2012 Dev70. All rights reserved.
//

#import "QuotesAppDelegate.h"
#import "QuotesViewController.h"
#import "Quote.h"
#import "contentViewController.h"


@implementation QuotesViewController

//@synthesize aQuote, pageContent;
@synthesize pageController, pageContent;

- (QuotesAppDelegate *) appDelegate
{
    return (QuotesAppDelegate *)[[UIApplication sharedApplication] delegate];
    
}

- (NSDate *) startDate
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    if(![defaults objectForKey:@"firstRun"])
    {
        [defaults setObject:[NSDate date] forKey:@"firstRun"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

    return [defaults objectForKey:@"firstRun"];


}

- (int) qcount
{
    return [self.appDelegate.quotes count];
}

- (int) daysElapsed
{
    
    int dayz = self.qcount - 1;

    NSDate *today = [NSDate date];
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorianCalendar components:NSDayCalendarUnit
                                                            fromDate:self.startDate
                                                              toDate:today
                                                             options:0];
    if ([components day] < self.qcount)
    {
        dayz = [components day];
    }
        
    
    return dayz;
}

- (UIViewController *)pageViewController:
(UIPageViewController *)pageViewController viewControllerBeforeViewController:
(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:
                        (contentViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:
(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:
                        (contentViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageContent count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}



// Create an array of all the quotes (todo: add person's name and extra info)
- (void) createContentPages
{
        
    NSMutableArray *pageArrays = [[NSMutableArray alloc] init];

    for (int i = 0; i < self.daysElapsed + 1; i++)
    {
        Quote *aQuote = [self.appDelegate.quotes objectAtIndex:i];
        NSMutableArray *pageStrings = [[NSMutableArray alloc] init];

        NSString *quoteString = aQuote.quote;
        NSString *personString = aQuote.who;
        NSString *moreString = aQuote.more;
        NSDate *dateOfQuote = [self.startDate dateByAddingTimeInterval:(i*86400)];
        
        [pageStrings addObject:quoteString];
        [pageStrings addObject:personString];
        [pageStrings addObject:moreString];
        [pageStrings addObject:dateOfQuote];

        
        [pageArrays addObject:pageStrings];
    }
    pageContent = [[NSArray alloc] initWithArray:pageArrays];
}

- (contentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    // Return the data view controller for the given index.
    if (([self.pageContent count] == 0) ||
        (index >= [self.pageContent count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.

    contentViewController *dataViewController =
    [[contentViewController alloc]
     initWithNibName:@"contentViewController"
     bundle:nil];
    dataViewController.dataObject = [self.pageContent objectAtIndex:index];
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(contentViewController *)viewController
{
    return [self.pageContent indexOfObject:viewController.dataObject];
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
    [self createContentPages];
    NSDictionary *options =
    [NSDictionary dictionaryWithObject:
     [NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin]
                                forKey: UIPageViewControllerOptionSpineLocationKey];
    
    self.pageController = [[UIPageViewController alloc]
                           initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                           navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                           options: options];
    
    pageController.dataSource = self;
    [[pageController view] setFrame:[[self view] bounds]];
    

    
    //int startPage = [appDelegate.quotes count] - 1;

    int startIndex = self.daysElapsed;
    
    contentViewController *initialViewController = [self viewControllerAtIndex:startIndex];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];

    [pageController setViewControllers:viewControllers
                             direction:UIPageViewControllerNavigationDirectionForward
                              animated: NO
                            completion:nil];
    
   [self addChildViewController:pageController];
   [[self view] addSubview:[pageController view]];
   [pageController didMoveToParentViewController:self];


}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}




@end
