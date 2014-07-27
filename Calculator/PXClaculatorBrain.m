//
//  PXClaculatorBrain.m
//  Calculator
//
//  Created by xu yijun on 14-7-27.
//  Copyright (c) 2014年 xu yijun. All rights reserved.
//

#import "PXClaculatorBrain.h"

@implementation PXClaculatorBrain

- (void)setOperand:(double)value {
    operand = value;
}

- (void)performWaitingOperator {
    if ([@"+" isEqualToString:waitingOperator]) {
        operand = waitingOperatod + operand;
    } else if ([@"-" isEqualToString:waitingOperator]) {
        operand = waitingOperatod - operand;
    } else if ([@"*" isEqualToString:waitingOperator]) {
        operand = waitingOperatod * operand;
    } else if ([@"/" isEqualToString:waitingOperator]) {
        operand = waitingOperatod / operand;
    }
}

- (double)performOperator:(NSString *)operator {
    
    if([operator isEqualToString:@"sqrt"]) {
        operand = sqrt(operand);
    } else {
        [self performWaitingOperator];
        waitingOperator = operator;
        waitingOperatod = operand;
    }
    
    return operand;
}

@end
