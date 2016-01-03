//
//  GameViewController.m
//  Superbreak
//
//  Created by acb12jh on 30/11/2015.
//  Copyright (c) 2015 acb12jh. All rights reserved.
//

#import "GameViewController.h"
#import <UIKit/UIKit.h>
#import "Ball.h"
#import "Paddle.h"
#import "Brick.h"
@interface GameViewController ()

@end

@implementation GameViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    _ball = [[Ball alloc]initWithValues:100 :300 :20 :2 :0 :[UIColor cyanColor]];
    _paddle = [[Paddle alloc]initWithValues:(_board.bounds.size.width/2) - 25 :_board.bounds.size.height - 50 :50 :[UIColor redColor]];
    [self loadLevel];
    _bricks = [[NSMutableArray alloc] initWithCapacity:6];
    for (int x = 0; x <= _BCC - 1; x++){
        for (int y = 0; y <= _BRC - 1; y++){
            Brick *brick = [[Brick alloc]initWithValues: ((_board.bounds.size.width/2) - ((_BW * _BCC)/2)) + ((_BW + _BGap) * x): _BDFT + ((_BH + _BGap) * y) :_BW :_BH :true :[UIColor purpleColor]];
            [_bricks addObject:brick];
            [brick draw];
            [[_board layer] addSublayer: brick];
        }
    }
    
    _leftArea = [[UIView alloc] initWithFrame:CGRectMake(0, _board.bounds.size.height-100, _board.bounds.size.width/2, 100)];
    [_leftArea setBackgroundColor:[UIColor clearColor]];
    [_board addSubview:_leftArea];
    
    _rightArea = [[UIView alloc] initWithFrame:CGRectMake(_board.bounds.size.width/2, _board.bounds.size.height-100, _board.bounds.size.width/2, 100)];
    [_rightArea setBackgroundColor:[UIColor clearColor]];
    [_board addSubview:_rightArea];
    _tick = [NSTimer scheduledTimerWithTimeInterval:0.0333f target:self selector:@selector(update:) userInfo:nil repeats:YES];
 
 }
-(void)loadLevel{
    _BW = 25;
    _BH = 14;
    _BGap = 2;
    _BDFT = 30;
    _BCC = 8;
    _BRC = 4;
}
-(void)update:(NSTimer*)timer  {
    [self moveBall];
    [self brickCollision];
    [_paddle draw];
    [[_board layer] addSublayer:_paddle];
    if(_ball.x + _ball.dx > _board.bounds.size.width - _ball.diameter || _ball.x + _ball.dx < 0) {
        _ball.dx = -_ball.dx;
    }
    if(_ball.y + _ball.dy >  _board.bounds.size.height - _ball.diameter || _ball.y + _ball.dy < 0) {
        _ball.dy = -_ball.dy;
    }
    if(_ball.y + _ball.dy > _board.bounds.size.height - 50 - _ball.diameter && _ball.x > _paddle.x && _ball.x < _paddle.x + _paddle.length) {
        _ball.dy = -_ball.dy;
    }
    [self gameOver];
}

-(void)brickCollision{
    int count = 0;
    for (int x = 0; x <= _BCC - 1; x++){
        for (int y = 0; y <= _BRC - 1; y++){
            count = ((x+1) * (y+1) )-1;
            if(((Brick*) _bricks[count]).visible){
                if(_ball.x > ((Brick*) _bricks[count]).x && _ball.x < (((Brick*) _bricks[count]).x + _BW) && _ball.y > ((Brick*) _bricks[count]).y && _ball.y < ((Brick*) _bricks[count]).y + _BH) {
                    _ball.dy = -_ball.dy;
                    ((Brick*) _bricks[count]).visible = false;
                    [((Brick*) _bricks[count]) removeFromSuperlayer];
                    [self gameOver];
                }
            }
            count++;
        }
    }
}


-(void)moveBall{
    [_ball removeFromSuperlayer];
    [_ball draw];
    [[_board layer] addSublayer:_ball];
}
-(void)moveLeft:(id)sender {
    [_paddle moveLeft];
}
-(void)moveRight:(id)sender {
    [_paddle moveRight];
}

-(void)touchesBegan:(NSSet*)touches  withEvent:(UIEvent*)event {
    UITouch *touch=[[event allTouches] anyObject];
    if([touch view] == _leftArea){
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.0333 target:self selector:@selector(moveLeft:) userInfo:nil repeats:YES];
    }else if ([touch view] == _rightArea){
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.0333 target:self selector:@selector(moveRight:) userInfo:nil repeats:YES];
    }
}
-(void)touchesEnded:(NSSet*)touches  withEvent:(UIEvent*)event {
    [_timer invalidate];
}

-(void)gameOver{
    if(_ball.y >= _board.bounds.size.height - _ball.diameter){
        [_tick invalidate];
        
        UILabel *gameover = [[UILabel alloc] initWithFrame:CGRectMake(_board.bounds.size.width/2 - (_board.bounds.size.width/6)*2, (_board.bounds.size.height/2)-100, (_board.bounds.size.width/6)*4, 100)];
        [gameover setTextColor:[UIColor redColor]];
        [gameover setBackgroundColor:[UIColor clearColor]];
        gameover.textAlignment = NSTextAlignmentCenter;
        [gameover setText:@"Game Over"];
        [gameover setFont:[UIFont fontWithName: @"Trebuchet MS" size: 32.0f]];
        [_board addSubview:gameover];
    }
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
