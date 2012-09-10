//
//  XMLParser.h
//  Quotes
//
//  Created by Moe Burney on 2012-08-15.
//  Copyright (c) 2012 Dev70. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QuotesAppDelegate, Quote;

@interface XMLParser : NSObject
{
    NSMutableString *currentElementValue;
    
    QuotesAppDelegate *appDelegate;
    Quote *aQuote;
    
}

- (XMLParser *) initXMLParser;

@end
