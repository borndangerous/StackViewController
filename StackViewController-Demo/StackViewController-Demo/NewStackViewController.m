//
//  RANewCardViewController.m
//  RACardViewController
//
//  Created by Ryo Aoyama on 4/28/14.
//  Copyright (c) 2014 Ryo Aoyama. All rights reserved.
//

#import "NewStackViewController.h"

@interface NewStackViewController ()


@end

@implementation NewStackViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Random background color
    [self randomBackgroundColor];
}

- (void)randomBackgroundColor
{
    CGFloat rValue = arc4random() % 256;
    CGFloat gValue = arc4random() % 256;
    CGFloat bValue = arc4random() % 256;
    
    self.view.backgroundColor = [UIColor colorWithRed:rValue/255.0 green:gValue/255.0 blue:bValue/255.0 alpha:1.0];
    [self.addNewViewButton setTitleColor:[UIColor colorWithRed:rValue/255.0 green:gValue/255.0 blue:bValue/255.0 alpha:1.0] forState:UIControlStateNormal];
}

- (IBAction)addNewView:(UIButton *)sender
{
    UIStoryboard *storyboard = self.storyboard;
    NewStackViewController *slideInViewController = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([NewStackViewController class])];
    
    slideInViewController.cardOrigin = SVCardOriginRight;
    slideInViewController.shiftBackDropView = YES;
    slideInViewController.backDropViewAlpha = .4f;
    
    self.modalPresentationStyle = UIModalPresentationCurrentContext;  //***
    
    [self presentViewController:slideInViewController animated:NO completion:nil];
}
@end
