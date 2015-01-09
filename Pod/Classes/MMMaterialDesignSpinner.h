//
//  MMMaterialDesignSpinner.h
//  Pods
//
//  Created by Michael Maxwell on 12/28/14.
//
//

#import <UIKit/UIKit.h>

/**
 *  A control similar to iOS' UIActivityIndicatorView modeled after Google's Material Design Activity spinner.
 */
@interface MMMaterialDesignSpinner : UIView

/** Sets the line width of the spinner's circle. */
@property (nonatomic) CGFloat lineWidth;

/** Sets whether the view is hidden when not animating. */
@property (nonatomic) BOOL hidesWhenStopped;

/** Specifies the timing function to use for the control's animation. Defaults to kCAMediaTimingFunctionEaseInEaseOut */
@property (nonatomic, strong) CAMediaTimingFunction *timingFunction;

/** Property indicating whether the view is currently animating. */
@property (nonatomic, readonly) BOOL isAnimating;


/**
 *  Starts animation of the spinner.
 */
- (void)startAnimating;

/**
 *  Stops animation of the spinnner.
 */
- (void)stopAnimating;

@end
