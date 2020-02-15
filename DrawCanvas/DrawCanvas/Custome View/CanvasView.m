//
//  CanvasView.m
//  DrawCanvas
//
//  Created by Jayprakash Kumar on 15/02/20.
//  Copyright © 2020 Jaykumar. All rights reserved.
//

#import "CanvasView.h"

@interface CanvasView(){
}
@property(nonatomic,readonly)NSMutableArray *pointArrays;
@property(nonatomic ,readonly) UIColor *selectedColor;
@end
@implementation CanvasView
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
}
-(id)initWithFrame:(CGRect)frame{
    if(self == [super initWithFrame:frame]){
        
    }
    return self;
}
-(void)startAnnotation{
    if(_pointArrays ==nil){
        _pointArrays =[[NSMutableArray alloc]initWithCapacity:0];
    }
    else{
        [_pointArrays removeAllObjects];
    }
}
-(void)setColor:(UIColor*)color{
    _selectedColor = color;
}
-(UIColor*)getSelectedColor{
    if(_selectedColor == nil){
        _selectedColor = [UIColor redColor];
    }
    return _selectedColor;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
     CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5);
    for (NSDictionary *pointdict in _pointArrays) {
        UIColor *clo = (UIColor*)pointdict[@"color"];
        CGContextSetStrokeColorWithColor(context, clo.CGColor);
        CGContextSetLineCap(context, kCGLineCapButt);
        [pointdict[@"point"] enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
            CGPoint point = [object CGPointValue];
            if(idx == 0){
                CGContextMoveToPoint(context, point.x, point.y);
            }else{
                CGContextAddLineToPoint(context, point.x, point.y);
            }
        }];
         CGContextStrokePath(context);
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint point = [touch locationInView:self];
    NSDictionary *dict = @{@"color" : [self getSelectedColor] , @"point" : @[[NSValue valueWithCGPoint:point]]};
    [_pointArrays addObject:dict];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    NSMutableArray *pointArray = [NSMutableArray arrayWithCapacity:0];
    NSDictionary* points = [[_pointArrays lastObject] mutableCopy];
    if([points[@"point"] isKindOfClass:[NSArray class]]){
        for (id po in points[@"point"]){
            [pointArray addObject:po];
        }
    }
    [_pointArrays removeLastObject];
    [pointArray addObject:[NSValue valueWithCGPoint:point]];
    [points setValue:pointArray forKey:@"point"];
    [_pointArrays addObject:points];
    pointArray = nil;
    points = nil;
    [self setNeedsDisplay];
}
-(void)undoCanvas{
    if(_pointArrays.count > 0){
        [_pointArrays removeLastObject];
        [self setNeedsDisplay];
    }
}
-(void)undoallCanvas{
   if(_pointArrays.count > 0){
        [_pointArrays removeAllObjects];
        [self setNeedsDisplay];
    }
}
-(void)dealloc{
    if(_pointArrays != nil){
        _pointArrays = nil;
    }
}


@end
