//
//  MMViewController.m
//  MaterialDesignSpinner
//
//  Created by Mike Maxwell on 12/28/2014.
//  Copyright (c) 2014 Mike Maxwell. All rights reserved.
//

#import "MMViewController.h"

#import "MMMaterialDesignSpinner.h"

@interface MMViewController ()
@property (nonatomic, strong) IBOutlet MMMaterialDesignSpinner *spinnerView;
@property (weak, nonatomic) IBOutlet UISlider *durationSlider;
@end

@implementation MMViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.spinnerView startAnimating];
}

#pragma mark Actions

- (IBAction)changeColorButtonTouched:(id)sender {
    self.spinnerView.tintColor = [MMViewController randomColor];
}

- (IBAction)changeLineWidthButtonTouched:(id)sender {
    self.spinnerView.lineWidth = (rand() % 20) / 2.f;
    if (self.spinnerView.lineWidth == 0) self.spinnerView.lineWidth = 0.1f;
}

- (IBAction)durationSliderValueUpdated:(id)sender {
    [self.spinnerView stopAnimating];
    self.spinnerView.duration = self.durationSlider.value;
    [self.spinnerView startAnimating];
}

- (IBAction)squareCapButtonPressed:(id)sender {
    self.spinnerView.lineCap = kCALineCapSquare;
}

- (IBAction)rouncCapButtonPressed:(id)sender {
    self.spinnerView.lineCap = kCALineCapRound;
}

- (IBAction)buttCapButtonPressed:(id)sender {
    self.spinnerView.lineCap = kCALineCapButt;
}


#pragma mark Helper methods

+ (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
