//
//  ViewController.m
//  UiPageViewControllerApp
//
//  Created by Cyrilshanway on 2014/12/23.
//  Copyright (c) 2014年 Cyrilshanway. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //建立資料
    self.pageTitles = @[@"Interstellar",
                        @"Interstellar",
                        @"Interstellar",
                        @"Interstellar"];
    self.pageImages = @[@"pic1.jpg",
                        @"pic2.jpg",
                        @"pic3.jpg",
                        @"pic4.jpg"];
    
    //初始化UIPageViewController
    //建立頁面控制器
    self.pageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];//pageControl的id
    self.pageVC.dataSource = self;
    
    //指定資料來源
    PageContentViewController *startingVC = [self viewControllerAtIndex:0];
    NSArray *VCs = @[startingVC];
    [self.pageVC setViewControllers:VCs
                          direction:UIPageViewControllerNavigationDirectionForward
                           animated:NO
                         completion:nil];
    
    //改變頁面視圖控制器的尺寸
    self.pageVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height );
    
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];
    [self.pageVC didMoveToParentViewController:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - Page View Conroller Data Source
//切回前的頁面頁面視圖要顯示什麼
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    NSUInteger index = ((PageContentViewController *) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}
//告訴app下個頁面的顯示
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSUInteger index = ((PageContentViewController *) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    return [self viewControllerAtIndex:index];
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index{
    
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    //建立一個新的視圖控制器並傳遞合適資料
    PageContentViewController *pageContentVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];//顯示的那頁id
    
    pageContentVC.imageFile = self.pageImages[index];
    pageContentVC.titleText = self.pageTitles[index];
    pageContentVC.pageIndex = index;
    
    return pageContentVC;
}

#pragma mark - 要顯示頁面指示器，必須實作這兩個方法
- (NSInteger) presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    
    return [self.pageTitles count];
}

-(NSInteger) presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
    return 0;
}

- (IBAction)startWalkthrough:(id)sender {
    
    PageContentViewController *startVC = [self viewControllerAtIndex:0];
    NSArray *VCs = @[startVC];
    [self.pageVC setViewControllers:VCs
                          direction:UIPageViewControllerNavigationDirectionReverse
                           animated:NO
                         completion:nil];
}

@end
