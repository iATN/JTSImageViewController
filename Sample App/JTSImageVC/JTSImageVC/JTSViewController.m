//
//  JTSViewController.m
//  JTSImageVC
//
//  Created by Jared on 3/29/14.
//  Copyright (c) 2014 Nice Boy, LLC. All rights reserved.
//

#import "JTSViewController.h"

#import "JTSImageViewController.h"
#import "JTSMediaInfo.h"

#define TRY_AN_ANIMATED_GIF 0

@interface JTSViewController ()

@end

@implementation JTSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] init];
    [tapRecognizer addTarget:self action:@selector(bigButtonTapped:)];
    [self.bigImageButton addGestureRecognizer:tapRecognizer];
    [self.bigImageButton setAccessibilityLabel:@"Photo of a cat wearing a Bane costume."];
    self.bigImageButton.layer.cornerRadius = self.bigImageButton.bounds.size.width/2.0f;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (void)bigButtonTapped:(id)sender {
    
    // Create image info
    JTSMediaInfo *imageInfo = [[JTSMediaInfo alloc] init];
#if TRY_AN_ANIMATED_GIF == 1
    imageInfo.imageURL = [NSURL URLWithString:@"http://media.giphy.com/media/O3QpFiN97YjJu/giphy.gif"];
#else
	imageInfo.image = self.bigImageButton.image;
	imageInfo.videoURL = [NSURL URLWithString:@"https://d2phucl1xk8xs4.cloudfront.net/incoming/ee4cec8b-e791-440b-b2ad-27af26d1e19b.mov?Expires=1448068215&Signature=FxkTiNWuhn3UxOQ9pZkjLSwPcmXZwAcUrCZd2HVkN8yhEePif4a2HhcGohpDcrOE-C5P5f6Sq4EGiHsyox8YQoskU-AqH~XLTrDRzWNcgE1B1iYYavky-pcMUTMj45gJf02mdi0Xle6D0UeOghgFjEB~tStwTKL0~HnnBeNSZIBN-FY2cJZQerZY3G0MIpIsH0t8~isD5Pno0knp2Fh8cdp3QTxtbeOKsAyTwQEECewUHv59oKYuk4UmjeHsizAqMLDcTFRamZPvJh5hMitKF39vcvFv3of3UWPKOJ3PBlczoGrQY6ICWd-A7h6z-~U7z3KBzKvb5c-jRDhY9w2M3g__&Key-Pair-Id=APKAJCH5JQ2MA6I6WXWQ[;"];
#endif
    imageInfo.referenceRect = self.bigImageButton.frame;
    imageInfo.referenceView = self.bigImageButton.superview;
    imageInfo.referenceContentMode = self.bigImageButton.contentMode;
    imageInfo.referenceCornerRadius = self.bigImageButton.layer.cornerRadius;
    
    // Setup view controller
    JTSImageViewController *imageViewer = [[JTSImageViewController alloc]
                                           initWithImageInfo:imageInfo
                                           mode:JTSImageViewControllerMode_Image
                                           backgroundStyle:JTSImageViewControllerBackgroundOption_Scaled];
    
    // Present the view controller.
    [imageViewer showFromViewController:self transition:JTSImageViewControllerTransition_FromOriginalPosition completion:nil];
}

@end





