//
//  ViewController.m
//  LearningReview
//
//  Created by haohao on 2017/9/5.
//  Copyright © 2017年 haohao. All rights reserved.
//

#import "ViewController.h"
#import "CoreAnimationViewController.h"
#import "CAKeyframeAnimationViewController.h"
#import "CATransitionViewController.h"
#import "CASpringAnimationViewController.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setSubView {
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        CoreAnimationViewController *coreVC = [[CoreAnimationViewController alloc] init];
        [self.navigationController pushViewController:coreVC animated:YES];
    }
    if (indexPath.row == 1) {
        CAKeyframeAnimationViewController *coreVC = [[CAKeyframeAnimationViewController alloc] init];
        [self.navigationController pushViewController:coreVC animated:YES];
    }
    if (indexPath.row == 2) {
        CATransitionViewController *corevc = [[CATransitionViewController alloc] init];
        [self.navigationController pushViewController:corevc animated:YES];
    }
    if (indexPath.row == 3) {
        CASpringAnimationViewController *vc = [[CASpringAnimationViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = @[@"CoreAnimation", @"CAKeyframeAnimation", @"CATransition", @"CASpringAnimation"];
    }
    return _dataArray;
}


@end
