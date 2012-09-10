//
//  QuotesAppDelegate.m
//  Quotes
//
//  Created by Moe Burney on 2012-08-15.
//  Copyright (c) 2012 Dev70. All rights reserved.
//

#import "QuotesAppDelegate.h"
#import "QuotesViewController.h"
#import "XMLParser.h"
#import "Quote.h"


@implementation QuotesAppDelegate

@synthesize window;
@synthesize navigationController, quotes;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlPath];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
 
    //Initialize the delegate.
    XMLParser *parser = [[XMLParser alloc] initXMLParser];
    
    //Set delegate
    [xmlParser setDelegate:parser];
    
    //Start parsing the XML file.
    
    
    BOOL success = [xmlParser parse];
    
    if(success)
        NSLog(@"No Parse Errors");
    else
        NSLog(@"Error Parsing XML");
     


        
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[QuotesViewController alloc] initWithNibName:@"QuotesViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
   
    // Configure and show the window
    [self.window addSubview:[navigationController view]];
    [self.window makeKeyAndVisible];
    
         
    return YES;
    
}

@end
