//
//  Brick.m
//  Superbreak
//
//  Created by acb12jh on 30/11/2015.
//  Copyright (c) 2015 acb12jh. All rights reserved.
//

#import "Brick.h"

@implementation Brick
-(id)initWithValues:(float)x :(float)y :(int)width :(int)height :(Boolean)visible :(UIColor*)color {
    self = [super init];
    if(self){
        _x = x;
        _y = y;
        _width = width;
        _height = height;
        _visible = visible;
        _color = color;
        [self draw];
    }
    return self;
}

-(void)draw {
    [self setPath:[[UIBezierPath bezierPathWithRect:CGRectMake(_x, _y, _width, _height)] CGPath]];
    [self setStrokeColor:[_color CGColor]];
    [self setFillColor:[_color CGColor]];
}

@end
