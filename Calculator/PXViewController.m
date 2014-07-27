//
//  PXViewController.m
//  Calculator
//
//  Created by xu yijun on 14-7-27.
//  Copyright (c) 2014年 xu yijun. All rights reserved.
//

#import "PXViewController.h"

#import "PXClaculatorBrain.h"

@interface PXViewController () {
    PXClaculatorBrain *_brain;
    
    BOOL userIsTypingNumber;
}

@property (weak, nonatomic) IBOutlet UILabel *display;
- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operatorPerssed:(UIButton *)sender;
@end


@implementation PXViewController

- (PXClaculatorBrain *)brain {
    if(!_brain) {
        _brain = [[PXClaculatorBrain alloc] init];
    }
    
    return _brain;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSLog(@"Digit %@ pressed.", [[sender titleLabel] text]);
    
    NSString *digit = [[sender titleLabel] text];
    if (userIsTypingNumber) {
        [_display setText:[[_display text] stringByAppendingString:digit]];
    } else {
        [_display setText:digit];
        userIsTypingNumber = YES;
    }
    
}

- (IBAction)operatorPerssed:(UIButton *)sender {
    NSLog(@"Operator %@ pressed.", [[sender titleLabel] text]);
    
    if (userIsTypingNumber) {
        [[self brain] setOperand:[[_display text] doubleValue]];
        userIsTypingNumber = NO;
    } else {
        NSLog(@"ERROR! Double operators!");
        return ;
    }
    
    NSString *operator = [[sender titleLabel] text];
    double result = [[self brain] performOperator:operator];
    [_display setText:[NSString stringWithFormat:@"%g", result]];
}
@end
