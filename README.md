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
效果图如下
![文章详情效果图.png](https://upload-images.jianshu.io/upload_images/20213494-ff17ddeaf18c6b42.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


`强烈推荐`
[我的简书主页](https://www.jianshu.com/u/32d3d14dd38d)
[我的博客主页](https://blog.csdn.net/muziyuting)
