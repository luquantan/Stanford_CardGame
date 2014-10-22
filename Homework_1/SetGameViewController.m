//
//  SetGameViewController.m
//  Homework_1
//
//  Created by LuQuan Intrepid on 10/22/14.
//  Copyright (c) 2014 LuQuanTan. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetGameCardDeck.h"
#import "SetGameCard.h"

@interface SetGameViewController ()


//Properties that are SetGameCard specific
//Have outlet from some scoreLabel
//Have outlet from some previousMatchLabel
//Have outlet from some cardButtons

@end

@implementation SetGameViewController


//createDeck specific to a SetGameCardDeck
-(Deck *)createDeck{
    return [[SetGameCardDeck alloc]init];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
