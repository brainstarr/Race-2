//
//  ViewController.m
//  Race 2 tha top
//
//  Created by Brian Starr on 11/4/14.
//  Copyright (c) 2014 Brian Starr. All rights reserved.
//

#import "ViewController.h"
#import "PathView.h"
#import "MountainPath.h"

#define MAP_STARTING_SCORE 15000
#define MAP_SCORE_DECREMENT 100
#define WALL_HIT_PENALTY 500
#define INTERVAL 0.1

@interface ViewController ()

@property (strong, nonatomic) IBOutlet PathView *pathView;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDetected:)];
    tapRecognizer.numberOfTapsRequired = 2;
    [self.pathView addGestureRecognizer:tapRecognizer];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panDetected:)];
    [self.pathView addGestureRecognizer:panRecognizer];
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", MAP_STARTING_SCORE];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tapDetected:(UITapGestureRecognizer *)tapRecognizer
{
    NSLog(@"Tap dat");
    CGPoint tapLocation = [tapRecognizer locationInView:self.pathView];
    NSLog(@"location at (%f, %f)", tapLocation.x, tapLocation.y);
}

-(void)panDetected:(UIPanGestureRecognizer *)panRecognizer
{
    CGPoint fingerLocation = [panRecognizer locationInView:self.pathView];
    
    for (UIBezierPath *path in [MountainPath mountainPathsForRect:self.pathView.bounds])
    {
        UIBezierPath *tapTarget = [MountainPath tapTargetForPath:path];
        if ([tapTarget containsPoint:fingerLocation])
        {
            [self decrementScoreByAmount:WALL_HIT_PENALTY];
        }
    }
}

-(void)timerFired
{
    [self decrementScoreByAmount:MAP_SCORE_DECREMENT];
}

-(void)decrementScoreByAmount:(int)amount
{
    NSString *scoreText = [[self.scoreLabel.text componentsSeparatedByString:@" "]lastObject];
    int score = [scoreText intValue];
    score = score - amount;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", score];
}

@end
