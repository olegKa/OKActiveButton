//
//  OKActiveButton.m
//
//  Created by OLEG KALININ on 04.04.16.
//

#import "OKActiveButton.h"

#import "CAHorizontalGradientLayer.h"


@interface OKActiveButton ()
{
    BOOL __enabled;
    BOOL __shadow;
}

@property (nonatomic, strong) UIView *activityView;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation OKActiveButton

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    __enabled = self.enabled;
    __shadow = NO;
}

- (void)setup {
    
    self.shadowHidden = YES;
    self.gradientHidden = YES;
    [self addActivityView];
    [self addActivityIndicatorToView:self.activityView];

}

- (void)didAddSubview:(UIView *)subview {
    if (subview == self.titleLabel) {
        [self bringSubviewToFront:self.activityView];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = (self.frame.size.height * self.cornerRadius)? :self.layer.cornerRadius;
    self.activityView.layer.cornerRadius = self.layer.cornerRadius;
    
    if (__shadow) {
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0.2;
        self.layer.shadowRadius = self.frame.size.height / 10;
        self.layer.shadowOffset = CGSizeMake(0.0f, self.layer.shadowRadius / 4.0f);
    } else {
        self.layer.shadowColor = [UIColor clearColor].CGColor;
        self.layer.shadowOpacity = 0;
        self.layer.shadowRadius = 0;
        self.layer.shadowOffset = CGSizeZero;
    }
    
}

#pragma mark - Properties
- (void)setIsActivity:(BOOL)isActivity {
    _isActivity = isActivity;
    [super setEnabled:!isActivity && __enabled];
    [UIView animateWithDuration:0.25 animations:^{
        self.activityView.alpha = isActivity? 1.0:0.0;
    }];
    
}

- (void)setEnabled:(BOOL)enabled {
    __enabled = enabled;
    [super setEnabled:enabled];
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = enabled? 1.0:0.5;
    }];
    
    if (!_shadowHidden) {
        __shadow = enabled;
        [self layoutIfNeeded];
    }
}

- (void)setShadowHidden:(BOOL)shadowHidden {
    _shadowHidden = shadowHidden;
    __shadow = !shadowHidden;
    [self setNeedsLayout];
}

- (void)setGradientHidden:(BOOL)gradientHidden {
    _gradientHidden = gradientHidden;
    if (gradientHidden) {
        [self removeGradientLayer];
    } else {
        [self addGradientLayer];
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    [self setNeedsDisplay];
}

#pragma mark - Private

- (void)addGradientLayer {
    
    if ([self gradientLayer]) {
        return;
    }
    
    CAHorizontalGradientLayer *gradient = [CAHorizontalGradientLayer new];
    
    CGFloat halfHeight = self.bounds.size.height / 2;
    gradient.frame = self.bounds;
    
    gradient.cornerRadius = halfHeight;
    [self.layer insertSublayer:gradient below:self.layer.sublayers[0]];
}

- (void)removeGradientLayer {
    CALayer *gradient = [self gradientLayer];
    if (gradient) {
        [gradient removeFromSuperlayer];
    }
}

- (CALayer *)gradientLayer {
    NSInteger idxOfSublayer = [self.layer.sublayers indexOfObjectPassingTest:^BOOL(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:CAHorizontalGradientLayer.class]) {
            *stop = YES;
        }
        return *stop;
    }];
    
    return idxOfSublayer != NSNotFound? self.layer.sublayers[idxOfSublayer] : nil;
}

- (void)addActivityView {
    self.activityView = [[UIView alloc] initWithFrame:self.frame];
    self.activityView.backgroundColor = self.backgroundColor;
    self.activityView.translatesAutoresizingMaskIntoConstraints = false;
    self.activityView.clipsToBounds = YES;
    self.activityView.userInteractionEnabled = NO;
    self.activityView.alpha = 0;
    [self addSubview:self.activityView];
    [self setConstraintsToActivityView:self.activityView];
}

- (void)setConstraintsToActivityView:(UIView *)activityView {
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:activityView
                                                    attribute:NSLayoutAttributeLeading
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:NSLayoutAttributeLeading
                                                   multiplier:1.0
                                                     constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:activityView
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1.0
                                                      constant:0.0]];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:activityView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:0.0]];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:activityView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:0.0]];


}

- (void)addActivityIndicatorToView:(UIView *)view {
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self.activityIndicator startAnimating];
    self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false;
    
    [view addSubview:self.activityIndicator];
    [self setConstraintsToActivityIndicator:self.activityIndicator];
}

- (void)setConstraintsToActivityIndicator:(UIActivityIndicatorView *)activityIndicator {
    [self addConstraint:[NSLayoutConstraint constraintWithItem:activityIndicator
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:activityIndicator
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                      constant:0.0]];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
