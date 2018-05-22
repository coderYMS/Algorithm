//
//  ViewController.m
//  Algorithm
//
//  Created by 余梦实 on 2018/5/22.
//  Copyright © 2018年 余梦石. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) NSArray *destinationArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:self.destinationArr[indexPath.row] sender:nil];
}

- (NSArray *)dataArr {
    if (nil == _dataArr) {
        _dataArr = @[@"二叉树"];
    }
    return _dataArr;
}

- (NSArray *)destinationArr {
    if (nil == _destinationArr) {
        _destinationArr = @[@"YMBinaryTreeViewController"];
    }
    return _destinationArr;
}

@end
