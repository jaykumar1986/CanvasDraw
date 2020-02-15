//
//  ViewController.m
//  DrawCanvas
//
//  Created by Jayprakash Kumar on 15/02/20.
//  Copyright © 2020 Jaykumar. All rights reserved.
//

#import "ViewController.h"
#import "CanvasView.h"
@interface ViewController ()
{
    UIColor * color;
}
@property(weak,nonatomic)IBOutlet CanvasView *canvasView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
    selector:@selector(canvasEvents:) name:@"EventNotification"
                                               object:nil];
    // Do any additional setup after loading the view.
}
#pragma mark- Notification Events For Canvas

-(void)canvasEvents:(NSNotification*)notif{

    NSDictionary *type = notif.userInfo;
    if([type[@"EventName"] isEqual:@"EditCanvas"]){
        [self eidtCanvas];
    }else if([type[@"EventName"] isEqual:@"undoLastCanvas"]){
        [self undoCanvasDrawing];
    }else if([type[@"EventName"] isEqual:@"undoAllCanvas"]){
        [self undoallCanvasDrawing];
    }else{
        [self chooseColorsfromBox:type[@"EventName"]];
    }
}
-(void)eidtCanvas{
    [_canvasView startAnnotation];
    [_canvasView setUserInteractionEnabled:true];
}
-(void)undoCanvasDrawing{
    
    [_canvasView undoCanvas];
}
-(void)undoallCanvasDrawing{
    
    [_canvasView undoallCanvas];
}
-(void)chooseColorsfromBox:(NSString*)colorName{
    if([colorName isEqual:@"greayColor"]){
      color = [UIColor greenColor];
    }else if([colorName isEqual:@"blackColor"]){
      color = [UIColor blackColor];
    }else if([colorName isEqual:@"orangeColor"]){
      color = [UIColor orangeColor];
    }else if([colorName isEqual:@"blueColor"]){
      color = [UIColor blueColor];
    }else if([colorName isEqual:@"yellowColor"]){
      color = [UIColor yellowColor];
    }else if([colorName isEqual:@"redColor"]){
      color = [UIColor redColor];
    }else if([colorName isEqual:@"purpleColor"]){
      color = [UIColor purpleColor];
    }else if([colorName isEqual:@"greenColor"]){
      color = [UIColor greenColor];
    }
        [_canvasView setColor:color];
}

@end
