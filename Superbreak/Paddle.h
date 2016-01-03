//
//  Paddle.h
//  Superbreak
//
//  Created by Sean O'Neill on 03/01/2016.
//  Copyright © 2016 acb12jh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Paddle : CAShapeLayer

@property int length;
@property UIColor* color;
@property float x;
@property float y;

-(id)initWithValues:(float)x :(float)y :(int)length :(UIColor*)color;
-(void)draw;
-(void)moveLeft;
-(void)moveRight;

@end
