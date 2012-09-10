//
//  XMLParser.m
//  Quotes
//
//  Created by Moe Burney on 2012-08-15.
//  Copyright (c) 2012 Dev70. All rights reserved.
//

#import "XMLParser.h"
#import "QuotesAppDelegate.h"
#import "Quote.h"

@implementation XMLParser

- (XMLParser *) initXMLParser
{
    self = [super init];
    appDelegate = (QuotesAppDelegate *)[[UIApplication sharedApplication] delegate];
    return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
    
    if([elementName isEqualToString:@"content"]) {
        //Initialize the array.
        appDelegate.quotes = [[NSMutableArray alloc] init];
    }
    else if([elementName isEqualToString:@"item"]) {
        
        //Initialize the quote.
        aQuote = [[Quote alloc] init];
        
        //Extract the attribute here.
        aQuote.quoteID = [[attributeDict objectForKey:@"id"] integerValue];
        
        //NSLog(@"Reading id value :%i", aQuote.quoteID);
    }
    
    //NSLog(@"Processing Element: %@", elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if(!currentElementValue)
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    else
        [currentElementValue appendString:string];
    
    //NSLog(@"Processing Value: %@", currentElementValue);
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if([elementName isEqualToString:@"content"])
        return;
    
    //There is nothing to do if we encounter the Quotes element here.
    //If we encounter the Quote element however, we want to add the book object to the array
    // and release the object.
    if([elementName isEqualToString:@"item"]) {
        [appDelegate.quotes addObject:aQuote];
        
        aQuote = nil;
    }
    else
        [aQuote setValue:currentElementValue forKey:elementName];
    
    currentElementValue = nil;
}



@end
