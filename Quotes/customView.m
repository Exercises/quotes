//
//  customView.m
//  Quotes
//
//  Created by Moe Burney on 2012-09-07.
//  Copyright (c) 2012 Dev70. All rights reserved.
//

#import "customView.h"

@implementation customView

/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
*/


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

     CGContextRef context = UIGraphicsGetCurrentContext();
     CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
     
     // Draw them with a 2.0 stroke width so they are a bit more visible.
     CGContextSetLineWidth(context, 0.3);
     CGContextBeginPath(context); 
     CGContextMoveToPoint(context, 10,60); //start at this point
     CGContextAddLineToPoint(context, 300, 60); //draw to this point
    //Shadow
    CGContextSetShadowWithColor(context, CGSizeMake(0, -1), 2.0, [[UIColor blackColor] CGColor]);

     
     // and now draw the Path!
     CGContextStrokePath(context);
     
}


@end
