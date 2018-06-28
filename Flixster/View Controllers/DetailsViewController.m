//
//  DetailsViewController.m
//  Flixster
//
//  Created by Sophia Zheng on 6/28/18.
//  Copyright © 2018 Sophia Zheng. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *datesLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    
    NSString *backgroundPathString = self.movie[@"backdrop_path"];
    NSString *backgroundURLString = [baseURLString stringByAppendingString:backgroundPathString];
    NSURL *backgroundURL = [NSURL URLWithString:backgroundURLString];
    self.backgroundView.image = nil;
    [self.backgroundView setImageWithURL:backgroundURL];
    
    NSString *posterPathString = self.movie[@"poster_path"];
    NSString *posterURLString = [baseURLString stringByAppendingString:posterPathString];
    NSURL *posterURL = [NSURL URLWithString:posterURLString];
    self.posterView.image = nil;
    [self.posterView setImageWithURL:posterURL];
    
    self.titleLabel.text = self.movie[@"title"];
    self.datesLabel.text = self.movie[@"release_date"];
    self.overviewLabel.text = self.movie [@"overview"];
    [self.overviewLabel sizeToFit];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
