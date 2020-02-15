//
//  ButtomView.m
//  DrawCanvas
//
//  Created by Jayprakash Kumar on 15/02/20.
//  Copyright © 2020 Jaykumar. All rights reserved.
//

#import "ButtomView.h"
@interface ButtomView(){
    UIButton *tempBtn;
    UIView *tempView;
}
@end
@implementation ButtomView

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUpView];
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
}
-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpView];
    }
    return self;
}


-(void)setUpView{
    UIStackView *view = (UIStackView *)[self stackView];
    [self setConstant:view iscolorView:false];
    view = nil;
}
#pragma mark- Create ToolBar
/*Edit Canvas StackView*/
-(UIStackView*)stackView{
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[[self canvasButton],[self colorButton],[self undoButton],[self undoallButton]]];
    stackView.tag = 1;
    [stackView setDistribution:UIStackViewDistributionFillEqually];
    return stackView;
}
/*Choose Canvas StackView*/
-(UIStackView*)colorStackView{
    UIStackView *colorStackView = [[UIStackView alloc] initWithArrangedSubviews:@[[self greenButton],[self purplekButton],[self redButton],[self yellowButton],[self blueButton],[self orangeButton],[self blackButton],[self greayButton]]];
    colorStackView.tag = 2;
    [colorStackView setDistribution:UIStackViewDistributionFillEqually];
    return colorStackView;
}
/*Set constance of stackView*/
-(void)setConstant:(UIStackView*)view iscolorView:(BOOL)flag{
    [self addSubview:view];
    view.translatesAutoresizingMaskIntoConstraints = false;
    [view.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:0.0].active = true;
    if(flag){
        UIStackView *stackView = [self getStackView];
        [view.bottomAnchor constraintEqualToAnchor:stackView.topAnchor constant:-1.0].active = true;
    }else{
        [view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:1.0].active = true;
    }
    [view.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:0.0].active = true;
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectZero];
    [bgView setBackgroundColor:[UIColor lightGrayColor]];
    [view insertSubview:bgView atIndex:0];
    bgView.translatesAutoresizingMaskIntoConstraints = NO;
    [[bgView.topAnchor constraintEqualToAnchor:view.topAnchor constant:1.0] setActive:YES];
    [[bgView.bottomAnchor constraintEqualToAnchor:view.bottomAnchor constant:1.0] setActive:YES];
    [[bgView.heightAnchor constraintEqualToConstant:50.0] setActive:true];
    [[bgView.leftAnchor constraintEqualToAnchor:view.leftAnchor] setActive:YES];
    [[bgView.rightAnchor constraintEqualToAnchor:view.rightAnchor] setActive:YES];
       bgView = nil;
    
}
/*Buttons for endit stackView*/
//Undo last Canvas
-(UIButton *)undoButton {
    UIButton *undoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [undoButton setTitle:@"Undo" forState:UIControlStateNormal];
    [undoButton addTarget:self action:@selector(undoCanvasDrawing) forControlEvents:UIControlEventTouchDown];
    return undoButton;
}
//Undo all Canvas
-(UIButton *)undoallButton {
    UIButton *undoallButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [undoallButton setTitle:@"Clear" forState:UIControlStateNormal];
    [undoallButton addTarget:self action:@selector(undoallCanvasDrawing) forControlEvents:UIControlEventTouchDown];
    return undoallButton;
}
//Start Editing Canvas
-(UIButton *)canvasButton {
    UIButton *canvasButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [canvasButton setTitle:@"Edit" forState:UIControlStateNormal];
    [canvasButton addTarget:self action:@selector(eidtCanvas:) forControlEvents:UIControlEventTouchDown];
    return canvasButton;
}
//Choose Color
-(UIButton *)colorButton {
    UIButton *colorButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [colorButton setTitle:@"Colors" forState:UIControlStateNormal];
    [colorButton addTarget:self action:@selector(openColorBox:) forControlEvents:UIControlEventTouchDown];
    return colorButton;
}
/*Buttons for Color Stack stackView*/
-(UIButton *)greenButton {
    UIButton *greenButton = [UIButton buttonWithType:UIButtonTypeCustom];
     [greenButton setTitle:@"GR" forState:UIControlStateNormal];
    greenButton.tag = 100;
    [greenButton addTarget:self action:@selector(chooseColorsfromBox:) forControlEvents:UIControlEventTouchDown];
    return greenButton;
}
-(UIButton *)purplekButton {
    UIButton *purplekButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [purplekButton setTitle:@"PU" forState:UIControlStateNormal];
    purplekButton.tag = 101;
    [purplekButton addTarget:self action:@selector(chooseColorsfromBox:) forControlEvents:UIControlEventTouchDown];
    return purplekButton;
}
-(UIButton *)redButton {
    UIButton *redButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [redButton setTitle:@"RE" forState:UIControlStateNormal];
    redButton.tag = 102;
    [redButton addTarget:self action:@selector(chooseColorsfromBox:) forControlEvents:UIControlEventTouchDown];
    return redButton;
}
-(UIButton *)yellowButton {
    UIButton *yellowButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [yellowButton setTitle:@"YE" forState:UIControlStateNormal];
    yellowButton.tag = 103;
  [yellowButton addTarget:self action:@selector(chooseColorsfromBox:) forControlEvents:UIControlEventTouchDown];
    return yellowButton;
}
-(UIButton *)blueButton {
    UIButton *blueButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [blueButton setTitle:@"BL" forState:UIControlStateNormal];
    blueButton.tag = 104;
    [blueButton addTarget:self action:@selector(chooseColorsfromBox:) forControlEvents:UIControlEventTouchDown];
    return blueButton;
}
-(UIButton *)orangeButton {
    UIButton *orangeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [orangeButton setTitle:@"OR" forState:UIControlStateNormal];
    orangeButton.tag = 105;
    [orangeButton addTarget:self action:@selector(chooseColorsfromBox:) forControlEvents:UIControlEventTouchDown];
    return orangeButton;
}
-(UIButton *)blackButton {
    UIButton *blackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [blackButton setTitle:@"BL" forState:UIControlStateNormal];
    blackButton.tag = 106;
    [blackButton addTarget:self action:@selector(chooseColorsfromBox:) forControlEvents:UIControlEventTouchDown];
    return blackButton;
}
-(UIButton *)greayButton {
    UIButton *greayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [greayButton setTitle:@"GY" forState:UIControlStateNormal];
    greayButton.tag = 107;
    [greayButton addTarget:self action:@selector(chooseColorsfromBox:) forControlEvents:UIControlEventTouchDown];
    return greayButton;
}
-(void)undoCanvasDrawing{
    [self sendNofificationForEvents:@"undoLastCanvas"];
}
-(void)undoallCanvasDrawing{
 [self sendNofificationForEvents:@"undoAllCanvas"];
}
-(void)eidtCanvas:(UIButton*)btn{
    [self sendNofificationForEvents:@"EditCanvas"];
}
-(void)sendNofificationForEvents:(NSString*)eventName{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"EventNotification" object:nil userInfo:@{@"EventName" : eventName}];
}
-(void)chooseColorsfromBox:(UIButton*)btn{
    if(tempBtn != nil){
        tempBtn.selected = !tempBtn.selected;
    }
    NSString *colorName = @"redColor";
     if(btn.tag == 100){
         colorName = @"greenColor";
    }else if(btn.tag == 101){
        colorName = @"purpleColor";
    }else if(btn.tag == 102){
        colorName = @"redColor";
    }else if(btn.tag == 103){
        colorName = @"yellowColor";
    }else if(btn.tag == 104){
        colorName = @"blueColor";
    }else if(btn.tag == 105){
        colorName = @"orangeColor";
    }else if(btn.tag == 106){
        colorName = @"blackColor";
    }else if(btn.tag == 107){
        colorName = @"greayColor";
    }
    [self sendNofificationForEvents:colorName];
    btn.selected = !btn.selected;
    tempBtn = btn;
}
-(void)openColorBox:(UIButton*)btn{
    self.translatesAutoresizingMaskIntoConstraints = false;
    [self updateView:!btn.selected];
    if(!btn.selected){
        UIStackView *view = (UIStackView *)[self colorStackView];
        [self setConstant:view iscolorView:true];
        view = nil;
    }
    else{
        UIStackView *stackView = [self getColorStackView];
           if(stackView != nil){
               [stackView removeFromSuperview];
           }
    }
    btn.selected = !btn.selected;
    
}
-(void)addConstants{
    UIView *view = self.superview;
    CGRect rect = self.frame;
    /* Fixed width */
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint
                        constraintWithItem:self
                        attribute:NSLayoutAttributeWidth
                        relatedBy:NSLayoutRelationEqual
                        toItem:nil
                        attribute:NSLayoutAttributeNotAnAttribute
                        multiplier:1.0
                        constant:rect.size.width];
    /* Fixed Height */
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint
                        constraintWithItem:self
                        attribute:NSLayoutAttributeHeight
                        relatedBy:NSLayoutRelationEqual
                        toItem:nil
                        attribute:NSLayoutAttributeNotAnAttribute
                        multiplier:1.0
                        constant:100];
    /* 2. Add the constraints to button's superview*/
    [self addConstraints:@[ widthConstraint, heightConstraint]];
    if(rect.origin.y + rect.size.height >= view.bounds.size.height){
        [[self.bottomAnchor constraintEqualToAnchor:view.bottomAnchor constant:0] setActive:YES];
    }
    else{
        [[self.topAnchor constraintEqualToAnchor:view.topAnchor constant:rect.origin.y] setActive:YES];
    }
    
    
     
    
}
-(void)updateView:(BOOL)flag{
    NSLayoutConstraint *heightConstraint;
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            heightConstraint = constraint;
            break;
        }
    }
    if(heightConstraint != nil){
        if(flag){
               heightConstraint.constant = 100;
           }
           else{
               heightConstraint.constant = 50;
           }
    }
    else{
        self.translatesAutoresizingMaskIntoConstraints = false;
        [self addConstants];
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
}
/*Get Refrence of Color stack View*/
-(UIStackView*)getColorStackView{
    for(UIView *view in self.subviews){
        if([view isKindOfClass:[UIStackView class]]){
            UIStackView *stackView = (UIStackView *)view;
            if(stackView != nil && stackView.tag == 2){
                return stackView;
            }
        }
    }
    return nil;
}
/*Get Refrence of Edit stack View*/
-(UIStackView*)getStackView{
    for(UIView *view in self.subviews){
        if([view isKindOfClass:[UIStackView class]]){
            UIStackView *stackView = (UIStackView *)view;
            if(stackView != nil && stackView.tag == 1){
                return stackView;
            }
        }
    }
    return nil;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
