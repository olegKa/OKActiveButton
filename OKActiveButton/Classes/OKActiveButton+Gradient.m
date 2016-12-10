//
//  OKActivityButton+Gradient.m
//
//  Created by OLEG KALININ on 31.08.16.
//

#import "OKActiveButton+Gradient.h"
#import "CAHorizontalGradientLayer.h"

@implementation OKActiveButton(Gradient)

- (void)addGradient {
    CAHorizontalGradientLayer *gradient = [CAHorizontalGradientLayer new];
    
    CGFloat halfHeight = self.bounds.size.height / 2;
    gradient.frame = self.bounds;
    
    gradient.cornerRadius = halfHeight;
    [self.layer insertSublayer:gradient below:self.layer.sublayers[0]];
}

@end
