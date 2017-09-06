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
#import "CAAnimationGroupViewController.h"


#import "UIViewCoreAnimationViewController.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSArray *dataArray;


@property (nonatomic, strong) NSArray *typeArray;

@property (nonatomic, strong) NSArray *uiviewAnimationArray;
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
    if (section == 0) {
        return self.dataArray.count;
    } else {
        return self.uiviewAnimationArray.count;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.typeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = self.dataArray[indexPath.row];
    }
    if (indexPath.section == 1) {
        cell.textLabel.text = self.uiviewAnimationArray[indexPath.row];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
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
        if (indexPath.row == 4) {
            CAAnimationGroupViewController *vc = [[CAAnimationGroupViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            UIViewCoreAnimationViewController *vc = [[UIViewCoreAnimationViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = @[@"CoreAnimation", @"CAKeyframeAnimation", @"CATransition", @"CASpringAnimation", @"CAAnimationGroup"];
    }
    return _dataArray;
}

- (NSArray *)typeArray {
    if (_typeArray == nil) {
        _typeArray = @[@"CoreAnimation", @"UIViewCoreAnimation"];
    }
    return _typeArray;
}

- (NSArray *)uiviewAnimationArray {
    if (_uiviewAnimationArray == nil) {
        _uiviewAnimationArray = @[@"uivewCoreAnimation"];
    }
    return _uiviewAnimationArray;
}

@end
