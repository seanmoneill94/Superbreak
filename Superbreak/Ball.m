//
//  Ball.m
//  Superbreak
//
//  Created by acb12jh on 30/11/2015.
//  Copyright (c) 2015 acb12jh. All rights reserved.
//

#import "Ball.h"
#import "math.h"

@implementation Ball

-(id)initWithValues:(float)x :(float)y :(int)diameter :(int)vel :(int)heading :(UIColor*)color {
    self = [super init];
    if(self){
        _x = x;
        _y = y;
        _dx = -2;
        _dy = -2;
        _diameter = diameter;
        _vel = vel;
        _heading = heading;
        _color = color;
        [self draw];
    }
    return self;
}

-(void)draw {
    [self move];
    [self setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(_x, _y, _diameter, _diameter)] CGPath]];
    [self setStrokeColor:[_color CGColor]];
    [self setFillColor:[_color CGColor]];
}

-(void)move {
    _x += _dx;
    _y += _dy;
    //_x += _vel * sin([self degToRad:_heading]);
    //_y += _vel * -cos([self degToRad:_heading]);
}

-(float)degToRad:(float)deg {
    return (deg/180) * M_PI;
}

@end
