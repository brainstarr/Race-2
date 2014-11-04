//
//  MountainPath.m
//  Race 2 tha top
//
//  Created by Brian Starr on 11/4/14.
//  Copyright (c) 2014 Brian Starr. All rights reserved.
//

#import "MountainPath.h"

@implementation MountainPath

+(NSArray *)mountainPathsForRect:(CGRect)rect
{
    NSMutableArray *variousPaths = [@[] mutableCopy];
    
    CGPoint firstPoint = CGPointMake(rect.size.width * (1/6.0), CGRectGetMaxY(rect));
    
    CGPoint secondPoint = CGPointMake(rect.size.width * (1/3.0), rect.size.height * (5/6.0));
    
    UIBezierPath *labyrinthPath = [UIBezierPath bezierPath];
    
    labyrinthPath.lineWidth = 4.0;
    
    [labyrinthPath moveToPoint:firstPoint];
    
    [labyrinthPath addLineToPoint:secondPoint];
    
    [variousPaths addObject:labyrinthPath];
    
    return [variousPaths copy];
}

@end
