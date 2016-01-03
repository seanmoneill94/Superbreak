//
//  Paddle.m
//  Superbreak
//
//  Created by Sean O'Neill on 03/01/2016.
//  Copyright © 2016 acb12jh. All rights reserved.
//

#import "Paddle.h"

@implementation Paddle

-(id)initWithValues:(float)x :(float)y :(int)length :(UIColor*)color {
    self = [super init];
    if(self){
        _x = x;
        _y = y;
        _length = length;
        _color = color;
        [self draw];
    }
    return self;
}

-(void)draw {
    [self setPath:[[UIBezierPath bezierPathWithRect:CGRectMake(_x, _y, _length, 10)] CGPath]];
    //[self setFrame:CGRectMake(_x, _y, _length, 20)];
    [self setStrokeColor:[_color CGColor]];
    [self setFillColor:[_color CGColor]];
    
    //UIBezierPath(roundedRect: CGRect(x: 64, y: 64, width: 160, height: 160), cornerRadius: 50).CGPath
    
}

-(void)moveLeft {
    _x -= 2;
}
-(void)moveRight {
    _x += 2;
}
@end
