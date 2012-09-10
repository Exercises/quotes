//
//  Quote.h
//  Quotes
//
//  Created by Moe Burney on 2012-08-15.
//  Copyright (c) 2012 Dev70. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quote : NSObject
{
    NSInteger quoteID;
    NSString *quote;
    NSString *who;
    NSString *more;
    
}

@property (nonatomic, readwrite) NSInteger quoteID;
@property (nonatomic) NSString *quote;
@property (nonatomic) NSString *who;
@property (nonatomic) NSString *more;


@end
