//
//  XNPageControl.h
//  XNPageControl
//
//  Created by Jiabao on 16/6/29.
//  Copyright © 2016年 Jiabao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XNPageControl : UIControl


@property (nonatomic, assign) NSInteger numberOfPages;      // deafult is 0
@property (nonatomic, assign) NSInteger currentPage;        // deafult is 0
@property (nonatomic, assign) BOOL hidesForSinglePage;      // hide the the indicator if there is only one page. default is NO
@property (nonatomic, assign) BOOL defersCurrentPageDisplay;    // if set, clicking to a new page won't update the currently displayed page until -updateCurrentPageDisplay is called. default is NO

// 更新控制器当前页码
- (void)updateCurrentPageDisplay;                      // update page display to match the currentPage. ignored if defersCurrentPageDisplay is NO. setting the page value directly will update immediately

@property (nonatomic, assign) CGFloat pageIndicatorMargin;          // deafult is 10

// 指示器的大小
@property (nonatomic, assign) CGSize pageIndicatorSize;             // deafult is (6, 6)
@property (nonatomic, assign) CGSize currentPageIndicatorSize;      // deafult is (6, 6)

// 指示器的颜色
@property (nonatomic, strong) UIColor *pageIndicatorTintColor;
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;

// 指示器的图片
@property (nonatomic, strong) UIImage *pageIndicatorImage;
@property (nonatomic, strong) UIImage *currentPageIndicatorImage;

// 指示器的大小(如果设置了, 优先使用)
- (void)setPageIndicatorSize:(CGSize)size forPage:(NSInteger)pageIndex;
- (void)setCurrentPageIndicatorSize:(CGSize)size forPage:(NSInteger)pageIndex;
- (CGSize)sizeForPageIndicator:(NSInteger)pageIndex;
- (CGSize)sizeForCurrentPageIndicator:(NSInteger)pageIndex;

// 指示器的图片(如果设置了, 优先使用)
- (void)setPageIndicatorImage:(UIImage *)image forPage:(NSInteger)pageIndex;
- (void)setCurrentPageIndicatorImage:(UIImage *)image forPage:(NSInteger)pageIndex;
- (UIImage *)imageForPageIndicator:(NSInteger)pageIndex;
- (UIImage *)imageForCurrentPageIndicator:(NSInteger)pageIndex;

@end
