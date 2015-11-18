//
//  ViewController.m
//  Azure_Video
//
//  Created by Ido Doron on 11/14/15.
//  Copyright © 2015 Ido Doron. All rights reserved.
//

#import "ViewController.h"

#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface ViewController ()

@property (nonatomic, retain) AVPlayerViewController *avPlayerViewcontroller;

@end

@implementation ViewController

/* Play files in project */
-(IBAction)play {
   
    UIView *view = self.view;
    
    NSString *resourceName = @"movie.mov";
    
    NSString* movieFilePath = [[NSBundle mainBundle] pathForResource:resourceName ofType:nil];
    NSAssert(movieFilePath, @"movieFilePath is nil");
    
    NSURL *fileURL = [NSURL fileURLWithPath:movieFilePath];
    
    AVPlayerViewController *playerViewController = [[AVPlayerViewController alloc] init];
    
    playerViewController.player = [AVPlayer playerWithURL:fileURL];
    
    self.avPlayerViewcontroller = playerViewController;
    
    [self resizePlayerToViewSize];
    
    [view addSubview:playerViewController.view];
    
    view.autoresizesSubviews = TRUE;
    
}

/* Play movie from a URL */
-(IBAction)playURL {
    
    NSURL *videoURL = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    //NSURL *videoURL = [NSURL URLWithString:@"http://www.ebookfrenzy.com/ios_book/movie/movie.mov"];
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    AVPlayerViewController *playerViewController = [AVPlayerViewController new];
    playerViewController.player = player;
    [self presentViewController:playerViewController animated:YES completion:nil];
    
}

- (void)viewDidLoad {
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) resizePlayerToViewSize
{
    CGRect frame = self.view.frame;
    
    NSLog(@"frame size %d, %d", (int)frame.size.width, (int)frame.size.height);
    
    self.avPlayerViewcontroller.view.frame = frame;
}

@end



