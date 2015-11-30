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
@interface GameViewController ()

@end

@implementation GameViewController

-(void)viewDidLoad {
     [super viewDidLoad];
     _ball = [[Ball alloc]initWithValues:25 :25 :20 :2 :0 :[UIColor cyanColor]];
     [NSTimer scheduledTimerWithTimeInterval:0.0333f target:self selector:@selector(update:) userInfo:nil repeats:YES];
 
 }
 
-(void)update:(NSTimer*)timer  {
    [self moveBall];
 }
 
-(void)didReceiveMemoryWarning {
     [super didReceiveMemoryWarning];
 }

-(void)moveBall{
    [_ball removeFromSuperlayer];
    [_ball draw];
    [[_board layer] addSublayer:_ball];
}
@end
