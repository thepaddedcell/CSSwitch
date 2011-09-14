//
//  CSSwitch.m
//  CSSwitchDevelopment
//
//  Created by Craig Stanford on 30/08/2011.
//  Copyright 2011 MonsterBomb. All rights reserved.
//

#import "CSSwitch.h"

@implementation CSSwitch

@synthesize backgroundLeft, backgroundRight, toggle, labelLeft, labelRight, on;

//TODO: Create init with custom labels
//TODO: Create init with custom colours (transparent BG)

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        // Initialization code here.
        self.frame = frame;
        
        UIImageView* backgroundMain = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CSSwitch_greyBG.png"]] autorelease];
        backgroundMain.frame = CGRectMake(0, 0, 94, 28);
        [self addSubview:backgroundMain];
        
        self.backgroundRight = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CSSwitch_redBG.png"]] autorelease];
        [self addSubview:self.backgroundRight];
        
        self.backgroundLeft = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CSSwitch_greenBG.png"]] autorelease];
        self.backgroundLeft.alpha = 0.0;
        [self addSubview:self.backgroundLeft];
        
        self.labelRight = [[[UILabel alloc] init] autorelease];
        self.labelRight.text = @"NO";
        self.labelRight.textColor = [UIColor whiteColor];
        self.labelRight.font = [UIFont boldSystemFontOfSize:16];
        self.labelRight.textAlignment = UITextAlignmentCenter;
        self.labelRight.shadowOffset = CGSizeMake(-1, -1);
        self.labelRight.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.3];
        self.labelRight.backgroundColor = [UIColor clearColor];
        [self addSubview:self.labelRight];
        
        self.labelLeft = [[[UILabel alloc] init] autorelease];
        self.labelLeft.alpha = 0.0;
        self.labelLeft.text = @"YES";
        self.labelLeft.textColor = [UIColor whiteColor];
        self.labelLeft.font = [UIFont boldSystemFontOfSize:16];
        self.labelLeft.textAlignment = UITextAlignmentCenter;
        self.labelLeft.shadowOffset = CGSizeMake(-1, -1);
        self.labelLeft.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.3];
        self.labelLeft.backgroundColor = [UIColor clearColor];
        [self addSubview:self.labelLeft];
        
        self.toggle = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CSSwitch_toggle.png"]] autorelease];
        [self addSubview:self.toggle];
        
        
    }
    
    return self;
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [super beginTrackingWithTouch:touch withEvent:event];

    self.on = !self.on;
    
    [UIView animateWithDuration:0.5 animations:^(void) 
    {
        self.toggle.frame = CGRectMake(self.on ? 49 : -5, 0, 49, 28);
        self.backgroundRight.alpha = self.on ? 0.0 : 1.0;
        self.labelRight.alpha = self.on ? 0.0 : 1.0;
        
        self.backgroundLeft.alpha = self.on ? 1.0 : 0.0;
        self.labelLeft.alpha = self.on ? 1.0 : 0.0;
    }];
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    return YES;
}

- (void)layoutSubviews
{
    self.toggle.frame = CGRectMake(self.on ? 49 : -5, 0, 49, 28);
    
    self.labelLeft.frame = CGRectMake(7, 0, 40, 28);
    self.labelLeft.alpha = self.on ? 1.0 : 0.0;
    
    self.labelRight.frame = CGRectMake(48, 0, 40, 28);
    self.labelRight.alpha = self.on ? 0.0 : 1.0;

    self.backgroundLeft.frame = CGRectMake(0, 0, 94, 28);
    self.backgroundLeft.alpha = self.on ? 1.0 : 0.0;
    
    self.backgroundRight.frame = CGRectMake(0, 0, 94, 28);
    self.backgroundRight.alpha = self.on ? 0.0 : 1.0;
}

-(void)dealloc
{
    [backgroundLeft release];
    [backgroundRight release];
    [toggle release];
    [labelLeft release];
    [labelRight release];
    
    [super dealloc];
}

@end
