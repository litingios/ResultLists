## 高仿简书文章详情界面
#### 核心代码如下
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
