//
//  LineSegmentModel.h
//  fingerPaint
//
//  Created by ruijia lin on 4/20/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LineSegmentModel : NSObject

@property (nonatomic) CGPoint first;
@property (nonatomic) CGPoint second;

-(instancetype)initWithPoints:(CGPoint)first :(CGPoint)second;

@end
