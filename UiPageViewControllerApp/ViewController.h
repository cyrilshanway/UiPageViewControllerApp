//
//  ViewController.h
//  UiPageViewControllerApp
//
//  Created by Cyrilshanway on 2014/12/23.
//  Copyright (c) 2014年 Cyrilshanway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface ViewController : UIViewController<UIPageViewControllerDataSource>

@property (weak, nonatomic) IBOutlet UIButton *startWalkThrough;
@property (nonatomic, strong) UIPageViewController *pageVC;
@property (nonatomic, strong) NSArray *pageTitles;
@property (nonatomic, strong) NSArray *pageImages;
@end

