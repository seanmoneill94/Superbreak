//
//  Ball.h
//  Superbreak
//
//  Created by acb12jh on 30/11/2015.
//  Copyright (c) 2015 acb12jh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface Ball : NSObject

@property int diameter;
@property UIColor* color;
@property int x;
@property int y;
@property int vel;
//0-359
@property int heading;

@end
