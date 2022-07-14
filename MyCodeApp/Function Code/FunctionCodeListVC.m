//
//  FunctionCodeListVC.m
//  MyCodeApp
//
//  Created by 邹杰 on 4/9/21.
//

#import "FunctionCodeListVC.h"
#import "ZJ_TimeDownVC.h"

static NSString *cellID = @"cellID";
@interface FunctionCodeListVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation FunctionCodeListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.dataSource = @[@"UITips",
                        @"TimeDown",
                        @"List View",
                        @"Two List View",
                        @"Category List View",
                        @"",
                        @"none",];
    [self.view addSubview:self.mainTableView];
    self.mainTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self.dataSource[indexPath.row] isEqualToString:@"Code Block"]){
      
    }else if ([self.dataSource[indexPath.row] isEqualToString:@"TimeDown"]){
        ZJ_TimeDownVC *vc = [[ZJ_TimeDownVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([self.dataSource[indexPath.row] isEqualToString:@"Macro"]){
        
    }else if ([self.dataSource[indexPath.row] isEqualToString:@""]){
        
    }
}

- (UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[UITableView new]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.scrollEnabled = YES;
        _mainTableView.backgroundColor = [UIColor whiteColor];
        _mainTableView.showsVerticalScrollIndicator = NO;
        [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
//        _mainTableView.layer.cornerRadius = 10;
    }
    return _mainTableView;
}

@end
