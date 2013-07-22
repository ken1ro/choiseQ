//
//  OthersCollectionViewCell.h
//  choiseQ
//
//  Created by Ken Yagura on 13/07/21.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OthersCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic, readonly) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cellBackImg;

@end
