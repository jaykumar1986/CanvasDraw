//
//  CanvasView.h
//  DrawCanvas
//
//  Created by Jayprakash Kumar on 15/02/20.
//  Copyright © 2020 Jaykumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
NS_ASSUME_NONNULL_BEGIN

@interface CanvasView : UIView
-(instancetype _Nonnull)init UNAVAILABLE_ATTRIBUTE;
-(instancetype _Nonnull )initWithCoder:(NSCoder *_Nonnull)aDecoder UNAVAILABLE_ATTRIBUTE;

-(id)initWithFrame:(CGRect)frame;

-(void)undoCanvas;
-(void)undoallCanvas;
-(void)setColor:(UIColor*)color;
-(UIColor*)getSelectedColor;
-(void)startAnnotation;
@end

NS_ASSUME_NONNULL_END
