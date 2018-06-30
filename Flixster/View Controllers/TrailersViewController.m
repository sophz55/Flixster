//
//  TrailersViewController.m
//  Flixster
//
//  Created by Sophia Zheng on 6/29/18.
//  Copyright © 2018 Sophia Zheng. All rights reserved.
//

#import "TrailersViewController.h"
#import "WebKit/WebKit.h"

@interface TrailersViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (strong, nonatomic) NSString *key;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation TrailersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.activityIndicator startAnimating];

    NSString *preURLString = @"https://api.themoviedb.org/3/movie/";
    NSString *postURLString = @"/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed";
    NSString *movieIDString = self.movieID;
    NSString *keyURLString = [[preURLString stringByAppendingString:movieIDString] stringByAppendingString:postURLString];
    NSURL *keyURL = [NSURL URLWithString:keyURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:keyURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
        else {
            NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *results = dataDictionary[@"results"];
            NSDictionary *result = results[0];
            self.key = result[@"key"];
            NSLog(@"%@",self.key);
            
            NSString *baseURLString = @"https://www.youtube.com/watch?v=";
            NSString *urlString = [baseURLString stringByAppendingString:self.key];
            NSURL *url = [NSURL URLWithString:urlString];
            NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
            [self.webView loadRequest:request];
        }
        [self.activityIndicator stopAnimating];
    }];
    [task resume];
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
