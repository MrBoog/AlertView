//
//  BlockAlertView.m
//
//  Created by LH'sMacbook on 7/24/14.
//  Copyright (c) 2014 All rights reserved.
//

#import "BlockAlertView.h"

@interface BlockAlertView () <UIAlertViewDelegate>

@property (copy, nonatomic) void (^clickedBlock)(BlockAlertView *, BOOL, NSInteger);

@end

@implementation BlockAlertView

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
       clickedBlock:(void (^)(BlockAlertView *alertView, BOOL cancelled, NSInteger buttonIndex))clickedBlock
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    
    self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil ];
    
    if (self) {
        self.clickedBlock = clickedBlock;
        va_list _arguments;
        va_start(_arguments, otherButtonTitles);
        for (NSString *key = otherButtonTitles; key != nil; key = (__bridge NSString *)va_arg(_arguments, void *)) {
            [self addButtonWithTitle:key];
        }
        va_end(_arguments);
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    _clickedBlock(self, buttonIndex == self.cancelButtonIndex, buttonIndex);
}

@end

