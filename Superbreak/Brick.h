//
//  Brick.h
//  Superbreak
//
//  Created by acb12jh on 30/11/2015.
//  Copyright (c) 2015 acb12jh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Brick : CAShapeLayer

@property UIColor* color;
@property int x;
@property int y;
@property int width;
@property int height;
@property int score;
@property Boolean visible;

-(id)initWithValues:(float)x :(float)y :(int)width :(int)height :(Boolean)visible :(UIColor*)color;
-(void)draw;

@end
