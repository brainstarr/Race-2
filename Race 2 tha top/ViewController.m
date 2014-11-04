//
//  ViewController.m
//  Race 2 tha top
//
//  Created by Brian Starr on 11/4/14.
//  Copyright (c) 2014 Brian Starr. All rights reserved.
//

#import "ViewController.h"
#import "PathView.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet PathView *pathView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDetected:)];
    tapRecognizer.numberOfTapsRequired = 2;
    [self.pathView addGestureRecognizer:tapRecognizer];
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

@end
