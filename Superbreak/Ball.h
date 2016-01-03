//
//  Ball.h
//  Superbreak
//
//  Created by acb12jh on 30/11/2015.
//  Copyright (c) 2015 acb12jh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Ball : CAShapeLayer

@property int diameter;
@property UIColor* color;
@property float x;
@property float y;
@property float dx;
@property float dy;
@property float vel;
//0-359
@property int heading;

-(id)initWithValues:(float)x :(float)y :(int)diameter :(int)vel :(int)heading :(UIColor*)color;
-(void)draw;
-(void)move;
-(float)degToRad:(float)deg;
@end
