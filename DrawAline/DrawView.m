//
//  DrawView.m
//  DrawAline
//
//  Created by macbook on 2016/10/28.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import "DrawView.h"
#import "PathModal.h"

@implementation DrawView

//初始化DrawView的frame，初始化画笔的颜色、线宽，初始化保存线条数组
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        
        pathModalArray = [NSMutableArray array];
        
        self.lineColor = [UIColor blueColor];
        self.lineWidth = 1.0;
        self.backgroundColor = [UIColor whiteColor];
        
        //创建button
        [self createButtonView];
        
    }
    
    return self;
}

//创建圆角button,用于清屏
-(void)createButtonView
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame= CGRectMake(5,25 , 50, 25);
    button.layer.cornerRadius = 4.0;
    [button setTitle:@"清屏" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor lightGrayColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}


//从pathModalArray中清除所有path,清屏
-(void)buttonAction
{
    [pathModalArray removeAllObjects];
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
    
    //将画好的线段保存到pathModalArray中
    for(PathModal *modal in pathModalArray){
 
        CGContextRef context = UIGraphicsGetCurrentContext();
        [self.lineColor setStroke];
        CGContextSetLineWidth(context, modal.width);
        CGContextAddPath(context, modal.path);
        
        CGContextDrawPath(context, kCGPathStroke);
    }
    
    //在touchesMoved中调用
    if (path != nil) {
        
        //将path添加到当前上下文中
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextAddPath(context, path);
        //设置线条颜色和线宽
        [self.lineColor setStroke];
        CGContextSetLineWidth(context, self.lineWidth);
        //在当前上下文中绘制一条线
        CGContextDrawPath(context, kCGPathStroke);
        
    }
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    //获取到第一个触摸的点p
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    
    //初始化可变的图形路径，必须手动释放
    path = CGPathCreateMutable();
    
    //将path的起点设置为点p
    CGPathMoveToPoint(path, NULL, p.x, p.y);
    
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //在划动过程中，获取当前触摸的点
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    
    //在划动过程中，将当前触摸的点添加到path中
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    [self setNeedsDisplay];
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //初始化PathModal
    PathModal *modal = [[PathModal alloc] init];
    modal.width = self.lineWidth;
    modal.path = path;
    
    //在触摸结束时，将划动轨迹保存到pathModalArray中
    [pathModalArray addObject:modal];
    
    //使用CGPathCreateMutable创建的path,必须手动释放
    CGPathRelease(path);
    path = nil;
    
}

@end
