//
//  ViewController.m
//  XKTransition
//
//  Created by 浪漫恋星空 on 2018/6/26.
//  Copyright © 2018年 浪漫恋星空. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+XKTransition.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    XKTransitionConfiguration *configuration = [XKTransitionConfiguration defaultConfiguration];
    CGSize contentSize;
    switch (indexPath.row) {
        case 0:
            configuration.direction = XKTransitionDirectionTop;
            contentSize = CGSizeMake(CGFLOAT_MAX, 300.0);
            break;
        case 1:
            configuration.direction = XKTransitionDirectionRight;
            contentSize = CGSizeMake(200.0, CGFLOAT_MAX);
            break;
        case 2:
            configuration.direction = XKTransitionDirectionBottom;
            configuration.enableInteractiveTransitioning = NO;
            configuration.enableBackgroundAnimation = YES;
            configuration.backgroundColor = [UIColor purpleColor];
            contentSize = CGSizeMake(CGFLOAT_MAX, 300.0);
            break;
        case 3:
            configuration.direction = XKTransitionDirectionLeft;
            contentSize = CGSizeMake(200.0, [UIScreen mainScreen].bounds.size.height);
            break;
        case 4:
            configuration.direction = XKTransitionDirectionCenter;
            contentSize = CGSizeMake(200.0, 300.0);
            break;
        default: return;
    }
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor orangeColor];
    [self presentModalWithView:view contentSize:contentSize configuration:configuration completion:nil];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"Top", @"Right", @"Bottom", @"Left", @"Center"];
    }
    return _dataSource;
}

@end
