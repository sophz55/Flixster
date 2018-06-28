//
//  MovieCell.h
//  Flixster
//
//  Created by Sophia Zheng on 6/27/18.
//  Copyright © 2018 Sophia Zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;

@end
