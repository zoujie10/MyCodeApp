//
//  ZJ_CodeBlockVC.m
//  MyCodeApp
//
//  Created by 邹杰 on 4/8/21.
//

#import "ZJ_CodeBlockVC.h"
#import "ZJ_CodeBlockViewController.h"

static NSString *cellID = @"cellID";
@interface ZJ_CodeBlockVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ZJ_CodeBlockVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = @[@"Code Block",
                        @"Macro",
                        @"Pod",
                        @"none",
                        @"none",
                        @"none",
                        @"none",];
    [self.view addSubview:self.mainTableView];
    self.mainTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
    //test
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
		ZJ_CodeBlockViewController *vc = [[ZJ_CodeBlockViewController alloc]init];
		[self.navigationController pushViewController:vc animated:YES];
    }else if ([self.dataSource[indexPath.row] isEqualToString:@""]){
        
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
