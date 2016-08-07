//
//  XNPageControl.m
//  XNPageControl
//
//  Created by Jiabao on 16/6/29.
//  Copyright © 2016年 Jiabao. All rights reserved.
//

#import "XNPageControl.h"

#if ! __has_feature(objc_arc)
#warning This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif


#define DEFAULT_INDICATOR_WIDTH 6.0f
#define DEFAULT_INDICATOR_HEIGHT 6.0f
#define DEFAULT_INDICATOR_MARGIN 10.0f


@interface XNPageControl () {
@private
    NSMutableDictionary	*_pageIndicatorImageDict;
    NSMutableDictionary	*_currentPageIndicatorImageDict;
    NSMutableDictionary *_pageIndicatorSizeDict;
    NSMutableDictionary	*_currentPageIndicatorSizeDict;
}
@end

@implementation XNPageControl

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (nil == self) {
        return nil;
    }
    
    [self setupUI];
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

#pragma mark - 初始化UI
- (void)setupUI {
    self.backgroundColor = [UIColor clearColor];
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    _numberOfPages = 0;
    _currentPage = 0;
    _pageIndicatorMargin = DEFAULT_INDICATOR_MARGIN;
    _pageIndicatorSize = CGSizeMake(DEFAULT_INDICATOR_WIDTH, DEFAULT_INDICATOR_HEIGHT);
    _currentPageIndicatorSize = CGSizeMake(DEFAULT_INDICATOR_WIDTH, DEFAULT_INDICATOR_HEIGHT);
    
    _defersCurrentPageDisplay = NO;
    
    _pageIndicatorImageDict = [NSMutableDictionary dictionary];
    _currentPageIndicatorImageDict = [NSMutableDictionary dictionary];
    _pageIndicatorSizeDict = [NSMutableDictionary dictionary];
    _currentPageIndicatorSizeDict = [NSMutableDictionary dictionary];
}

#pragma mark - 设置指示器大小
- (void)setPageIndicatorSize:(CGSize)pageIndicatorSize {
    if (!CGSizeEqualToSize(_pageIndicatorSize, pageIndicatorSize)) {
        _pageIndicatorSize = pageIndicatorSize;
        [self setNeedsDisplay];
    }
}

- (void)setCurrentPageIndicatorSize:(CGSize)currentPageIndicatorSize {
    if (!CGSizeEqualToSize(_currentPageIndicatorSize, currentPageIndicatorSize)) {
        _currentPageIndicatorSize = currentPageIndicatorSize;
        [self setNeedsDisplay];
    }
}

- (void)setPageIndicatorSize:(CGSize)size forPage:(NSInteger)pageIndex {
    [self _setPageIndicatorSize:size forPage:pageIndex current:NO];
}

- (void)setCurrentPageIndicatorSize:(CGSize)size forPage:(NSInteger)pageIndex {
    [self _setPageIndicatorSize:size forPage:pageIndex current:YES];
}

- (void)_setPageIndicatorSize:(CGSize)size forPage:(NSInteger)pageIndex current:(BOOL)current {
    if ((pageIndex < 0 || pageIndex >= _numberOfPages)) {
        return;
    }
    NSMutableDictionary *dictionary = current ? _currentPageIndicatorSizeDict : _pageIndicatorSizeDict;
    dictionary[@(pageIndex)] = [NSValue valueWithCGSize:size];
    [self setNeedsDisplay];
}

#pragma mark - 获得指示器大小
- (CGSize)sizeForPageIndicator:(NSInteger)pageIndex {
    return [self _sizeForPageIndicator:pageIndex current:NO];
}

- (CGSize)sizeForCurrentPageIndicator:(NSInteger)pageIndex {
    return [self _sizeForPageIndicator:pageIndex current:YES];
}

- (CGSize)_sizeForPageIndicator:(NSInteger)pageIndex current:(BOOL)current {
    if ((pageIndex < 0 || pageIndex >= _numberOfPages)) {
        return CGSizeZero;
    }
    NSMutableDictionary *dictionary = current ? _currentPageIndicatorSizeDict : _pageIndicatorSizeDict;
    CGSize size = [dictionary[@(pageIndex)] CGSizeValue];
    if (CGSizeEqualToSize(CGSizeZero, size)) {
        size = (current ? _currentPageIndicatorSize : _pageIndicatorSize);
    }
    return size;
}

#pragma mark - 设置指示器图片

- (void)setPageIndicatorImage:(UIImage *)pageIndicatorImage {
    if ([pageIndicatorImage isEqual:_pageIndicatorImage]) {
        return;
    }
    _pageIndicatorImage = pageIndicatorImage;
    [self setNeedsDisplay];
}

- (void)setCurrentPageIndicatorImage:(UIImage *)currentPageIndicatorImage {
    if ([currentPageIndicatorImage isEqual:_currentPageIndicatorImage]) {
        return;
    }
    _currentPageIndicatorImage = currentPageIndicatorImage;
    [self setNeedsDisplay];
}

- (void)setPageIndicatorImage:(UIImage *)image forPage:(NSInteger)pageIndex {
    [self _setPageIndicatorImage:image forPage:pageIndex current:NO];
}

- (void)setCurrentPageIndicatorImage:(UIImage *)image forPage:(NSInteger)pageIndex {
    [self _setPageIndicatorImage:image forPage:pageIndex current:YES];
}

- (void)_setPageIndicatorImage:(UIImage *)image forPage:(NSInteger)pageIndex current:(BOOL)current {
    if ((pageIndex < 0 || pageIndex >= _numberOfPages)) {
        return;
    }
    
    NSMutableDictionary *dictionary = current ? _currentPageIndicatorImageDict : _pageIndicatorImageDict;
    dictionary[@(pageIndex)] = image;
    [self setNeedsDisplay];
}

#pragma mark - 获得指示器图片

- (UIImage *)imageForPageIndicator:(NSInteger)pageIndex {
    return [self _imageForPage:pageIndex current:NO];
}

- (UIImage *)imageForCurrentPageIndicator:(NSInteger)pageIndex{
    return [self _imageForPage:pageIndex current:YES];
}

- (UIImage *)_imageForPage:(NSInteger)pageIndex current:(BOOL)current {
    if (pageIndex < 0 || pageIndex >= _numberOfPages) {
        return nil;
    }
    
    NSDictionary *dictionary = current ? _currentPageIndicatorImageDict : _pageIndicatorImageDict;
    UIImage *image = dictionary[@(pageIndex)];
    if (nil == image) {
        image = (current ? _currentPageIndicatorImage : _pageIndicatorImage);
    }
    return image;
}

#pragma mark - 重新绘制界面

- (void)setNeedsDisplay {
    if (!_defersCurrentPageDisplay) {
        [super setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self _renderPages:context rect:rect];
}

- (void)_renderPages:(CGContextRef)context rect:(CGRect)rect {
    if (_numberOfPages < 2 && _hidesForSinglePage) {
        return;
    }
    
    UIColor *tintColor = nil;
    UIImage *image = nil;
    CGSize  size = CGSizeZero;
    CGFloat originX = [self _leftOffset];
    CGFloat originY = 0;
    
    for (NSUInteger i = 0; i < _numberOfPages; i++) {
        // 如果是当前页
        if (i == _currentPage) {
            tintColor = _currentPageIndicatorTintColor ? _currentPageIndicatorTintColor : [UIColor whiteColor];
            image = [self imageForCurrentPageIndicator:i];
            size = [self sizeForCurrentPageIndicator:i];
        } else {
            tintColor = _pageIndicatorTintColor ? _pageIndicatorTintColor : [[UIColor whiteColor] colorWithAlphaComponent:0.3f];
            image = [self imageForPageIndicator:i];
            size = [self sizeForPageIndicator:i];
        }
        [tintColor set];
        
        originY = [self _topOffsetForSize:size];
        
        if (image) {
            [image drawAtPoint:CGPointMake(originX, originY)];
        } else {
            CGContextFillEllipseInRect(context, CGRectMake(originX, originY, size.width, size.height));
        }
        
        originX += size.width + _pageIndicatorMargin;
    }
}

- (CGFloat)_topOffsetForSize:(CGSize)size {
    CGFloat height = self.bounds.size.height;
    
    CGFloat top = 0.0f;
    switch (self.contentVerticalAlignment) {
        case UIControlContentVerticalAlignmentCenter:
            top = (height - size.height) / 2.0f;
            break;
        case UIControlContentVerticalAlignmentBottom:
            top = (height - size.height);
            break;
        default:
            break;
    }
    
    return top;
}

- (CGFloat)_leftOffset {
    CGFloat width = self.bounds.size.width;
    CGFloat allPageIndicatorWidth = 0.0f;
    
    for (int i = 0; i < _numberOfPages; i++) {
        if (i == _currentPage) {
            allPageIndicatorWidth += [self sizeForCurrentPageIndicator:i].width;
        } else {
            allPageIndicatorWidth += [self sizeForPageIndicator:i].width;
        }
    }
    allPageIndicatorWidth += (_numberOfPages - 1) * _pageIndicatorMargin;
    
    CGFloat left = 0.0f;
    switch (self.contentHorizontalAlignment) {
        case UIControlContentHorizontalAlignmentCenter:
            left = (width - allPageIndicatorWidth) / 2.0f;
            break;
        case UIControlContentHorizontalAlignmentRight:
            left = (width - allPageIndicatorWidth);
            break;
        default:
            break;
    }
    
    return left;
}

- (void)updateCurrentPageDisplay {
    _defersCurrentPageDisplay = NO;
    [self setNeedsDisplay];
}

//#pragma mark - Tap Gesture
//
//// We're using touchesEnded: because we want to mimick UIPageControl as close as possible
//// As of iOS 6, UIPageControl still does not use a tap gesture recognizer. This means that actions like
//// touching down, sliding around, and releasing, still results in the page incrementing or decrementing.
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch locationInView:self];
//    CGSize size = [self sizeForNumberOfPages:self.numberOfPages];
//    CGFloat left = [self _leftOffset];
//    CGFloat middle = left + (size.width / 2.0f);
//    if (point.x < middle) {
//        [self setCurrentPage:self.currentPage - 1 sendEvent:YES canDefer:YES];
//    } else {
//        [self setCurrentPage:self.currentPage + 1 sendEvent:YES canDefer:YES];
//    }
//}

#pragma mark - Accessors

- (void)setFrame:(CGRect)frame {
    if (CGRectEqualToRect(frame, self.frame)) {
        return;
    }
    [super setFrame:frame];
    [self setNeedsDisplay];
}

- (void)setPageIndicatorMargin:(CGFloat)pageIndicatorMargin {
    if (pageIndicatorMargin == _pageIndicatorMargin) {
        return;
    }
    _pageIndicatorMargin = pageIndicatorMargin;
    [self setNeedsDisplay];
}

- (void)setNumberOfPages:(NSInteger)numberOfPages {
    if (numberOfPages == _numberOfPages) {
        return;
    }
    _numberOfPages = MAX(0, numberOfPages);
    [self setNeedsDisplay];
}

- (void)setCurrentPage:(NSInteger)currentPage {
    if ((currentPage < 0 || currentPage >= _numberOfPages) || (currentPage == _currentPage)) {
        return;
    }
    _currentPage = currentPage;
    [self setNeedsDisplay];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}
//
//- (void)setCurrentPage:(NSInteger)currentPage sendEvent:(BOOL)sendEvent canDefer:(BOOL)defer {
//    if (currentPage < 0 || currentPage >= _numberOfPages) {
//        return;
//    }
//    
//    _currentPage = currentPage;
//    if (NO == self.defersCurrentPageDisplay || NO == defer) {
//        [self setNeedsDisplay];
//    }
//    
//    if (sendEvent) {
//        [self sendActionsForControlEvents:UIControlEventValueChanged];
//    }
//}

@end
