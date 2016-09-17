//
//  BMHomeItemCell.h
//  TheOne
//
//  Created by 黄斌民 on 16/8/1.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMHomeItemCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *volLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end
