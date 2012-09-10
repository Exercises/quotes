//
//  ContentViewController.m
//  Quotes
//
//  Created by Moe Burney on 2012-08-19.
//  Copyright (c) 2012 Dev70. All rights reserved.
//

#import "contentViewController.h"



@implementation contentViewController
@synthesize theLabel, dataObject;


- (void)viewWillAppear:(BOOL)animated
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];

    [super viewWillAppear:animated];
    
    
    UIImageView* subView   = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shadow.png"]];
    subView.alpha = 0.5;  // Customize the opacity of the top image.
    [[self view] addSubview:subView];
    
    
    CGRect labelFrame = CGRectMake(20, 20, 280, 300);
    UILabel *myLabel = [[UILabel alloc]initWithFrame:labelFrame];
    
    myLabel.numberOfLines = 0;
    [myLabel setBackgroundColor:[UIColor clearColor]];
    myLabel.textAlignment = UITextAlignmentCenter;

    
    NSMutableArray *dataArray = dataObject;

    NSString *d1 = [dataArray objectAtIndex:0];
    NSString *d2 = [dataArray objectAtIndex:1];
    NSString *d3 = [dataArray objectAtIndex:2];
    NSString *d4 = [dataArray objectAtIndex:3];

    NSString *quoteText = [d1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *whoText = [d2 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *moreText = [d3 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSDate *dateOfQuote = d4;
    
    /* This is where we define the ideal font that the Label wants to use.
     Use the font you want to use and the largest font size you want to use. */
    UIFont *font = [UIFont fontWithName:@"TrajanPro-Bold" size:28];

    
    int i;
    /* Time to calculate the needed font size.
     This for loop starts at the largest font size, and decreases by two point sizes (i=i-2)
     Until it either hits a size that will fit or hits the minimum size we want to allow (i > 10) */

    for(i = 28; i > 10; i=i-2)
    {
       // // Set the new font size.
        font = [font fontWithSize:i];
        // You can log the size you're trying: NSLog(@"Trying size: %u", i);
        
        /* This step is important: We make a constraint box
         using only the fixed WIDTH of the UILabel. The height will
         be checked later. */
       CGSize constraintSize = CGSizeMake(260.0f, MAXFLOAT);
        
        // This step checks how tall the label would be with the desired font.
        CGSize labelSize = [quoteText sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        
        /* Here is where you use the height requirement!
         Set the value in the if statement to the height of your UILabel
         If the label fits into your required height, it will break the loop
         and use that font size. */
        if(labelSize.height <= 180.0f)
            break;
    }
    
    // Set the UILabel's font to the newly adjusted font.
    myLabel.font = font;
    
    // Put the text into the UILabel outlet variable.
    myLabel.text = quoteText;
    
    [myLabel setTextColor:[UIColor colorWithRed:(52/255.f) green:(49/255.f) blue:(47/255.f) alpha:1 ]];
    [myLabel setShadowColor:[UIColor darkGrayColor]];
    [myLabel setShadowOffset:CGSizeMake(0, -1)];
    
    [[self view] addSubview:myLabel];
    
    // Create Label
    CGRect labelFrame2 = CGRectMake(20, 130, 280, 300);

    UILabel *whoLabel = [[UILabel alloc]initWithFrame:labelFrame2];
    
    whoLabel.numberOfLines = 0;
    [whoLabel setBackgroundColor:[UIColor clearColor]];
    whoLabel.textAlignment = UITextAlignmentCenter;
    
    UIFont *font2 = [UIFont fontWithName:@"TrajanPro-Regular" size:18];

    whoLabel.font = font2;
    whoLabel.text = whoText;
    
    [whoLabel setTextColor:[UIColor colorWithRed:(52/255.f) green:(49/255.f) blue:(47/255.f) alpha:1 ]];
    [whoLabel setShadowColor:[UIColor darkGrayColor]];
    [whoLabel setShadowOffset:CGSizeMake(0, -1)];
    
    [[self view] addSubview:whoLabel];

    
    // Create Label
    CGRect labelFrame3 = CGRectMake(20, 220, 280, 300);
    
    UILabel *moreLabel = [[UILabel alloc]initWithFrame:labelFrame3];
    
    moreLabel.numberOfLines = 0;
    [moreLabel setBackgroundColor:[UIColor clearColor]];
    moreLabel.textAlignment = UITextAlignmentCenter;
    
    
    moreLabel.font = font2;
    moreLabel.text = moreText;
    
    [moreLabel setTextColor:[UIColor colorWithRed:(52/255.f) green:(49/255.f) blue:(47/255.f) alpha:1 ]];
    [moreLabel setShadowColor:[UIColor darkGrayColor]];
    [moreLabel setShadowOffset:CGSizeMake(0, -1)];
    
    
    [[self view] addSubview:moreLabel];

    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    

    NSString *formattedDateString = [dateFormatter stringFromDate:dateOfQuote];

    
    // Create Label
    CGRect labelFrame4 = CGRectMake(20, 10, 280, 50);
    

    
    UILabel *dateLabel = [[UILabel alloc]initWithFrame:labelFrame4];
    
    dateLabel.numberOfLines = 0;
    [dateLabel setBackgroundColor:[UIColor clearColor]];
    dateLabel.textAlignment = UITextAlignmentCenter;
    
    
    dateLabel.font = font2;
    dateLabel.text = formattedDateString;
    
    [dateLabel setTextColor:[UIColor colorWithRed:(52/255.f) green:(49/255.f) blue:(47/255.f) alpha:1 ]];
    [dateLabel setShadowColor:[UIColor darkGrayColor]];
    [dateLabel setShadowOffset:CGSizeMake(0, -1)];

    
    [[self view] addSubview:dateLabel];
    

}



@end
