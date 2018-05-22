//
//  YMBinaryTreeViewController.m
//  Algorithm
//
//  Created by 余梦实 on 2018/5/22.
//  Copyright © 2018年 余梦石. All rights reserved.
//

#import "YMBinaryTreeViewController.h"

@interface TreeNode : NSObject

@property (nonatomic, copy) NSString *value;
@property (nonatomic, strong) TreeNode *left;
@property (nonatomic, strong) TreeNode *right;

@end

@implementation TreeNode

@end

// ************************************************************************************  //
/*
                    a
            b               c
        d       e               f
               g  h            i
 */
// ************************************************************************************  //

#pragma mark - -
@interface YMBinaryTreeViewController ()

@property (nonatomic, strong) TreeNode *tree;

@end

@implementation YMBinaryTreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    TreeNode *d = [TreeNode new];
    d.value = @"d";
    TreeNode *g = [TreeNode new];
    g.value = @"g";
    TreeNode *h = [TreeNode new];
    h.value = @"h";
    TreeNode *i = [TreeNode new];
    i.value = @"i";

    TreeNode *e = [TreeNode new];
    e.value = @"e";
    e.left = g;
    e.right = h;
    
    TreeNode *f = [TreeNode new];
    f.value = @"f";
    f.left = i;

    TreeNode *b = [TreeNode new];
    b.value = @"b";
    b.left = d;
    b.right = e;

    TreeNode *c = [TreeNode new];
    c.value = @"c";
    c.right = f;

    self.tree = [TreeNode new];
    _tree.value = @"a";
    _tree.left = b;
    _tree.right = c;

}

#pragma mark - 递归
- (IBAction)recursionClick:(id)sender {
    [self recursion:self.tree];
}

- (void)recursion:(TreeNode *)tree {
    if (tree) {
        //先序
//        NSLog(@"ymslog-- %@",tree.value);
//        [self recursion:tree.left];
//        [self recursion:tree.right];

        //中序
//        [self recursion:tree.left];
//        NSLog(@"ymslog-- %@",tree.value);
//        [self recursion:tree.right];
        
        //后序
        [self recursion:tree.left];
        [self recursion:tree.right];
        NSLog(@"ymslog-- %@",tree.value);
    }
}

#pragma mark - 先序
- (IBAction)xianxuClick:(id)sender {
    [self xianxu:self.tree];
}

- (void)xianxu:(TreeNode *)tree {
    NSMutableArray<TreeNode *> *arr = [NSMutableArray array];
    TreeNode *nowTree = tree;
    
    while (nowTree || arr.count>0) {
        while (nowTree) {
            NSLog(@"ymslog-- %@",nowTree.value);
            [arr addObject:nowTree];
            nowTree = nowTree.left;
        }
        
        if (arr.count > 0) {
            nowTree = arr.lastObject.right;
            [arr removeLastObject];
        }
    }
}

#pragma mark - 中序
- (IBAction)zhongxuClick:(id)sender {
    [self zhongxu:self.tree];
}

- (void)zhongxu:(TreeNode *)tree {
    NSMutableArray *arr = [NSMutableArray array];
    TreeNode *nowTree = tree;
    
    while (nowTree || arr.count>0) {
        while (nowTree) {
            [arr addObject:nowTree];
            nowTree = nowTree.left;
        }
        
        if (arr.count > 0) {
            nowTree = [arr lastObject];
            [arr removeLastObject];
            NSLog(@"ymslog-- %@",nowTree.value);
            
            nowTree = nowTree.right;
        }
    }
}

#pragma mark - 后序
- (IBAction)houxuClick:(id)sender {
    [self houxu:self.tree];
}

- (void)houxu:(TreeNode *)tree {
    NSMutableArray<TreeNode *> *arr = [NSMutableArray array];
    TreeNode *nowTree = tree;
    TreeNode *lastTree;

    while (nowTree || arr.count>0) {
        while (nowTree) {
            [arr addObject:nowTree];
            nowTree = nowTree.left;
        }
        
        if (arr.count > 0) {
            nowTree = [arr lastObject];
            if (nowTree.right && nowTree.right != lastTree) {
                nowTree = nowTree.right;
            } else {
                NSLog(@"ymslog-- %@",nowTree.value);
                [arr removeLastObject];
                lastTree = nowTree;
                nowTree = nil;
            }
        }
    }
}

#pragma mark - 层次遍历
- (void)cengci:(TreeNode *)tree {
    NSMutableArray *arr = [NSMutableArray array];//队列
    [arr addObject:tree];
    
    while (arr.count>0) {
        TreeNode *t = [arr firstObject];
        [arr removeObjectAtIndex:0];
        NSLog(@"ymslog-- %@",t.value);
        
        if (t.left) {
            [arr addObject:t.left];
        }
        
        if (t.right) {
            [arr addObject:t.right];
        }
    }
}


@end

/*
 
 2018-05-22 17:40:52.900378+0800 Algorithm[71030:5340035] ymslog-- d
 2018-05-22 17:40:52.900632+0800 Algorithm[71030:5340035] ymslog-- g
 2018-05-22 17:40:52.901186+0800 Algorithm[71030:5340035] ymslog-- h
 2018-05-22 17:40:52.901312+0800 Algorithm[71030:5340035] ymslog-- e
 2018-05-22 17:40:52.901436+0800 Algorithm[71030:5340035] ymslog-- b
 2018-05-22 17:40:52.901562+0800 Algorithm[71030:5340035] ymslog-- i
 2018-05-22 17:40:52.901677+0800 Algorithm[71030:5340035] ymslog-- f
 2018-05-22 17:40:52.901914+0800 Algorithm[71030:5340035] ymslog-- c
 2018-05-22 17:40:52.902009+0800 Algorithm[71030:5340035] ymslog-- a
 
 2018-05-22 17:40:55.031648+0800 Algorithm[71030:5340035] ymslog-- d
 2018-05-22 17:40:55.032260+0800 Algorithm[71030:5340035] ymslog-- g
 2018-05-22 17:40:55.032953+0800 Algorithm[71030:5340035] ymslog-- h
 2018-05-22 17:40:55.033196+0800 Algorithm[71030:5340035] ymslog-- e
 2018-05-22 17:40:55.033360+0800 Algorithm[71030:5340035] ymslog-- b
 2018-05-22 17:40:55.033514+0800 Algorithm[71030:5340035] ymslog-- i
 2018-05-22 17:40:55.033639+0800 Algorithm[71030:5340035] ymslog-- f
 2018-05-22 17:40:55.033745+0800 Algorithm[71030:5340035] ymslog-- c
 2018-05-22 17:40:55.033886+0800 Algorithm[71030:5340035] ymslog-- a

 */

