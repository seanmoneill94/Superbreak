//
//  GameViewController.h
//  Superbreak
//
//  Created by acb12jh on 30/11/2015.
//  Copyright (c) 2015 acb12jh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Ball;
@class Paddle;

@interface GameViewController : UIViewController

//Basic properties
@property IBOutlet UIView* board;
@property NSTimer* tick;
@property (strong) Ball* ball;
@property (strong) Paddle* paddle;
@property NSMutableArray* bricks;

//Level Properties
    //brick properties
@property int BW; //Brick Width
@property int BH; //Brick Height
@property int BGap; //Gap between bricks
@property int BDFT; //Distance from top of view
@property int BCC; //Number of Columns
@property int BRC; //Number of Rows

//Controlls
@property NSTimer* timer;
@property UIView* leftArea;
@property UIView* rightArea;

-(void)update:(NSTimer*)timer;
-(void)loadLevel;
-(void)moveBall;
-(void)moveLeft:(id)sender;
-(void)moveRight:(id)sender;
@end
