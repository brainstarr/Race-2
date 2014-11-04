//
//  PathView.m
//  Race 2 tha top
//
//  Created by Brian Starr on 11/4/14.
//  Copyright (c) 2014 Brian Starr. All rights reserved.
//

#import "PathView.h"
#import "MountainPath.h"

@implementation PathView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.backgroundColor = [UIColor clearColor];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    for (UIBezierPath *path in [MountainPath mountainPathsForRect:self.bounds]) {
        
        [[UIColor blackColor] setStroke];
        
        [path stroke];
    }
}


@end
