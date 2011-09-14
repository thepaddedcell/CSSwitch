//
//  CSSwitch.h
//  CSSwitchDevelopment
//
//  Created by Craig Stanford on 30/08/2011.
//  Copyright 2011 MonsterBomb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSSwitch : UIControl

@property (nonatomic, retain) UIImageView* backgroundLeft;
@property (nonatomic, retain) UIImageView* backgroundRight;
@property (nonatomic, retain) UIImageView* toggle;
@property (nonatomic, retain) UILabel* labelLeft;
@property (nonatomic, retain) UILabel* labelRight;

@property BOOL on;

- (id)initWithFrame:(CGRect)frame;

@end
