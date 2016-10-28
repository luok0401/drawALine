//
//  PathModal.m
//  DrawAline
//
//  Created by macbook on 2016/10/28.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import "PathModal.h"

@implementation PathModal

-(void)dealloc
{
    CGPathRelease(_path);
}

-(void)setPath:(CGMutablePathRef)path
{
    if(_path != path){
        _path = (CGMutablePathRef)CGPathRetain(path);
    }
}

@end
