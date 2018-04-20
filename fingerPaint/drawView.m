//
//  drawView.m
//  fingerPaint
//
//  Created by ruijia lin on 4/20/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "drawView.h"

@interface drawView()

@property (nonatomic) NSMutableArray <LineSegmentModel *> *lineArray;

@end

@implementation drawView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _lineArray = [NSMutableArray new];
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint first = [touches.anyObject locationInView:self];
    
    LineSegmentModel *segment = [[LineSegmentModel alloc] initWithPoints:first :first];
    
    [self.lineArray addObject:segment];
    
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    CGPoint currentPoint = [touch locationInView:self];
    CGPoint previousPoint = [touch previousLocationInView:self];
    
    LineSegmentModel *segment = [[LineSegmentModel alloc] initWithPoints:previousPoint :currentPoint];
    
    [self.lineArray addObject:segment];
    
    [self setNeedsDisplay];
    
//    for ( LineSegmentModel* any in self.lineArray)
//    {
//
//        NSLog(@"This segment first point is: %@", NSStringFromCGPoint( any.first));
//        NSLog(@"This segment second point is: %@", NSStringFromCGPoint( any.second));
//    }
}

// Called whenever a portion of this view needs to be redrawn
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 5.0;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineCapStyle = kCGLineCapRound;
    [[UIColor grayColor] setStroke];
    
    
    // Loop through all elements in the segment array and draw each line
    for (LineSegmentModel *segment in self.lineArray)
    {
        //        if (CGPointEqualToPoint(segment.first, segment.second))
        //        {
        // If start / end point of line segment is the same (i.e. this is the first
        // point, then move to that point so that line is drawn starting from that
        // point
        [path moveToPoint:segment.first];
        //            continue;
        //        }
        // Draw a line from the previous line segment to the first point
        //        [path addLineToPoint: segment.firstPoint];
        // Draw a line from the first point to the second point
        [path addLineToPoint: segment.second];
    }
    [path stroke];
}

//-(void)enableTextInput{
//    UITapGestureRecognizer *tap = [UITapGestureRecognizer new];
//
//}
@end
