//
//  scrollTableview.h
//  Demo
//
//  Created by Chaitanya on 11/4/14.
//  Copyright (c) 2014 flexih. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface scrollTableview : UITableView
@property (nonatomic) BOOL showsVerticalScrollIndicatorAlways;
@property (nonatomic) BOOL showsHorizontalScrollIndicatorAlways;


@property (nonatomic, strong) UIImageView *vertical_indicator_view;
@property (nonatomic, strong) UIImageView *horizontal_indicator_view;
@end
