//
//  ZJ_TimeDownVC.m
//  MyCodeApp
//
//  Created by 邹杰 on 6/28/21.
//

#import "ZJ_TimeDownVC.h"
#import "ZJ_TimeDownView.h"
@interface ZJ_TimeDownVC ()

@end

@implementation ZJ_TimeDownVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    ZJ_TimeDownView *timeDown = [[ZJ_TimeDownView alloc] initWithFrame:CGRectMake(50, 100, 200, 40) labelWidth:40 WithType:TimeDownTypeNumber];
    timeDown.timeOverBlock = ^(){
        
    };
    [self.view addSubview:timeDown];
    [timeDown setEndTime:@"2021-06-29 00:00:00"];
    timeDown.textFont = [UIFont systemFontOfSize:18];
    [timeDown setBackgroundColor:[UIColor grayColor] TextColor:[UIColor whiteColor] radiuo:5];
    
    ZJ_TimeDownView *timeDown1 = [[ZJ_TimeDownView alloc] initWithFrame:CGRectMake(50, timeDown.frame.origin.y + 100, 200, 40) labelWidth:40 WithType:TimeDownTypeNumber];
    
    [self.view addSubview:timeDown1];
    [timeDown1 setEndTime:@"2021-06-29 00:00:00"];
    timeDown1.textFont = [UIFont systemFontOfSize:18];
    [timeDown1 setBackgroundColor:[UIColor whiteColor] TextColor:[UIColor redColor] radiuo:5];
}



@end
