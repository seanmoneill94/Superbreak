//
//  GameViewController.h
//  Superbreak
//
//  Created by acb12jh on 30/11/2015.
//  Copyright (c) 2015 acb12jh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Ball;

@interface GameViewController : UIViewController

@property IBOutlet UIView* board;
@property (strong) Ball* ball;

-(void)update:(NSTimer*)timer;
-(void)moveBall;
@end
