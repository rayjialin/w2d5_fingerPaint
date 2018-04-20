//
//  LineSegmentModel.m
//  fingerPaint
//
//  Created by ruijia lin on 4/20/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "LineSegmentModel.h"

@implementation LineSegmentModel

-(instancetype)initWithPoints:(CGPoint)first :(CGPoint)second{
    self = [super init];
    if (self) {
        _first = first;
        _second = second;
    }
    return self;
}
@end
