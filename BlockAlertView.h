//
//  BlockAlertView.h
//
//  Created by LH'sMacbook on 7/24/14.
//  Copyright (c) 2014 All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockAlertView : UIAlertView

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
       clickedBlock:(void (^)(BlockAlertView *alertView, BOOL cancelled, NSInteger buttonIndex))clickedBlock
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;
@end
