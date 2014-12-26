//
//  PageContentViewController.h
//  UiPageViewControllerApp
//
//  Created by Cyrilshanway on 2014/12/23.
//  Copyright (c) 2014年 Cyrilshanway. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) NSString *titleText;
@property (strong, nonatomic) NSString *imageFile;
@property NSUInteger pageIndex;

@end
