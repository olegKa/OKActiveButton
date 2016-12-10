//
//  OKActiveButton.h
//  NesuEdu
//
//  Created by OLEG KALININ on 04.04.16.
//  Copyright © 2016 Moleculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OKActiveButton : UIButton

@property (nonatomic, assign, setter = setIsActivity:) BOOL isActivity;
/**
 *  Corner radius from 0 (no radius) to 1 (radius == height)
 *  Use 0.5 for full round
 */
@property (nonatomic, assign) IBInspectable CGFloat   cornerRadius;
@property (nonatomic, assign) IBInspectable BOOL      shadowHidden;
@property (nonatomic, assign) IBInspectable BOOL      gradientHidden;

//- (void)addShadow;

@end
