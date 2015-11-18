//
//  QSPlayVideoViewController.m
//  iOSvideoIdoDoron
//
//  Created by Ido Doron on 11/16/15.
//  Copyright © 2015 MobileServices. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "QSPlayVideoViewController.h"

#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface PlayVideoViewController ()

@property (nonatomic, retain) AVPlayerViewController *avPlayerViewcontroller;

@end

@implementation PlayVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = self.view;
    
    NSString *resourceName = @"SunSpot_1080p_main.m4v";
    
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