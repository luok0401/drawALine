//
//  DrawView.h
//  DrawAline
//
//  Created by macbook on 2016/10/28.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView
{
    CGMutablePathRef path;
    NSMutableArray *pathModalArray;
}

@property (nonatomic,strong) UIColor *lineColor;
@property (nonatomic,assign) CGFloat lineWidth;

-(void)buttonAction;
@end
