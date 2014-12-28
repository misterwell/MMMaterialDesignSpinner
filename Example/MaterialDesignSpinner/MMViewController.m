//
//  MMViewController.m
//  MaterialDesignSpinner
//
//  Created by Mike Maxwell on 12/28/2014.
//  Copyright (c) 2014 Mike Maxwell. All rights reserved.
//

#import "MMViewController.h"

#import <MMMaterialDesignSpinner.h>

@interface MMViewController ()
@property (nonatomic, strong) MMMaterialDesignSpinner *spinnerView;
@end

@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    MMMaterialDesignSpinner *spinnerView = [[MMMaterialDesignSpinner alloc] initWithFrame:CGRectZero];
    self.spinnerView = spinnerView;
    self.spinnerView.bounds = CGRectMake(0, 0, 100, 100);
    self.spinnerView.tintColor = [UIColor colorWithRed:215.f/255 green:49.f/255 blue:69.f/255 alpha:1];
    self.spinnerView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    self.spinnerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.spinnerView];
    
    
    UIButton *colorChangeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [colorChangeButton setTitle:@"Change color" forState:UIControlStateNormal];
    [colorChangeButton addTarget:self action:@selector(changeColorButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    colorChangeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:colorChangeButton];
    
    UIButton *strokeChangeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [strokeChangeButton setTitle:@"Change line width" forState:UIControlStateNormal];
    [strokeChangeButton addTarget:self action:@selector(changeLineWidthButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    strokeChangeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:strokeChangeButton];
    
    UIView *superview = self.view;
    NSDictionary *views = NSDictionaryOfVariableBindings(spinnerView, colorChangeButton, superview, strokeChangeButton);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[superview]-(<=1)-[spinnerView(80)]-[colorChangeButton]-[strokeChangeButton]"
                                                                              options:NSLayoutFormatAlignAllCenterX
                                                                              metrics:nil
                                                                                views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[superview]-(<=1)-[spinnerView(80)]"
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:views]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.spinnerView startAnimating];
}

#pragma mark Actions

- (void)changeColorButtonTouched:(id)sender {
    self.spinnerView.tintColor = [MMViewController randomColor];
}

- (void)changeLineWidthButtonTouched:(id)sender {
    self.spinnerView.lineWidth = (rand() % 10) / 2.f;
    if (self.spinnerView.lineWidth == 0) self.spinnerView.lineWidth = 0.1f;
}

#pragma mark Helper methods

+ (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
