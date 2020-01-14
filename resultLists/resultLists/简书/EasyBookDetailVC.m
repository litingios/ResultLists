//
//  EasyBookDetailVC.m
//  ResultLists
//
//  Created by 李霆 on 2020/1/14.
//  Copyright © 2020 mziyuting. All rights reserved.
//

#import "EasyBookDetailVC.h"
#import <WebKit/WebKit.h>

@interface EasyBookDetailVC ()<UIScrollViewDelegate,WKUIDelegate>
@property (nonatomic,assign)CGFloat offsetY;

@end

@implementation EasyBookDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"文章详情";

    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.jianshu.com/p/c106df5ef367"]]];
    [self.view addSubview:webView];
    webView.scrollView.delegate = self;
    [self initStateBarView];
}

-(void)initStateBarView{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 20)];
    view.backgroundColor = [UIColor whiteColor];//状态栏颜色
    [self.view addSubview:view];
}

#pragma mark ====== UIScrollViewDelegete ===========
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.offsetY = scrollView.contentOffset.y;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y >self.offsetY ) {//向上滑动
        //按钮消失
        [UIView animateWithDuration:0.2 animations:^{
            [self.navigationController setNavigationBarHidden:NO animated:YES];
        }];
        
    }else if (scrollView.contentOffset.y < self.offsetY ){//向下滑动
        [UIView animateWithDuration:0.2 animations:^{
            [self.navigationController setNavigationBarHidden:YES animated:YES];

        }];
    }
    NSLog(@"偏移量是多少==%f",self.offsetY);
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint translation = [scrollView.panGestureRecognizer translationInView:scrollView.superview];
    if (translation.y>0) {
        //按钮消失
        [UIView animateWithDuration:0.2 animations:^{
            [self.navigationController setNavigationBarHidden:NO animated:YES];
        }];
    }else if(translation.y<0){
        //按钮出现
        [UIView animateWithDuration:0.2 animations:^{
            [self.navigationController setNavigationBarHidden:YES animated:YES];
        }];
    }
}


@end
