//
//  PXClaculatorBrain.h
//  Calculator
//
//  Created by xu yijun on 14-7-27.
//  Copyright (c) 2014年 xu yijun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PXClaculatorBrain : NSObject {
    double operand;
    double waitingOperatod;
    NSString* waitingOperator;
}

- (void)setOperand:(double)value;
- (double)performOperator:(NSString *)operator;

@end
