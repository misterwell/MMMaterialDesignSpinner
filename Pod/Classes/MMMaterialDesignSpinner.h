//
//  MMMaterialDesignSpinner.h
//  Pods
//
//  Created by Michael Maxwell on 12/28/14.
//
//

#import <UIKit/UIKit.h>

@interface MMMaterialDesignSpinner : UIView

@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) BOOL hidesWhenStopped;
@property (nonatomic, strong) CAMediaTimingFunction *timingFunction;
@property (nonatomic, readonly) BOOL isAnimating;

- (void)startAnimating;
- (void)stopAnimating;

@end
