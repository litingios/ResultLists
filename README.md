## 高仿各种App效果集合
###### 1.简书文章详情页面
```
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

```
`强烈推荐`
[我的简书主页](https://www.jianshu.com/u/32d3d14dd38d)
[我的博客主页](https://blog.csdn.net/muziyuting)
