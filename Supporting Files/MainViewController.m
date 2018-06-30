//
//  MainViewController.m
//  DownToUpSlideTest
//
//  Created by Yeowoonergu on 13. 9. 5..
//  Copyright (c) 2013년 Mobile. All rights reserved.
//

#import "MainViewController.h"
#define MODALVIEWRECT CGRectMake(0,self.downUpBtn.frame.origin.y+self.downUpBtn.frame.size.height+5, self.view.frame.size.width, self.view.frame.size.height-self.downUpBtn.frame.size.height+5)
@interface MainViewController ()

@end

@implementation MainViewController
@synthesize downUpBtn, mView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	self.downUpBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.downUpBtn setFrame:CGRectMake(self.view.frame.size.width/2-50, self.view.frame.size.height-50, 100, 50)];
    [self.downUpBtn setTitle:@"메뉴" forState:UIControlStateNormal];
    [self.downUpBtn addTarget:self action:@selector(menuAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.downUpBtn];
    
    self.mView = [modalView new];
    self.mView.frame = MODALVIEWRECT;
    self.mView.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
    [self.view addSubview:mView];
}

-(IBAction)menuAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if (btn.isSelected == NO) {
        [UIView animateWithDuration:0.5 animations:^{
            self.downUpBtn.frame = CGRectMake(self.view.frame.size.width/2-50, 700, 100, 50);
            self.mView.frame = MODALVIEWRECT;
        }completion:^(BOOL finished) {
            btn.selected = YES;
        }];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            [self.downUpBtn setFrame:CGRectMake(self.view.frame.size.width/2-50, self.view.frame.size.height-50, 100, 50)];
            self.mView.frame = MODALVIEWRECT;
        }completion:^(BOOL finished) {
            btn.selected = NO;
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
