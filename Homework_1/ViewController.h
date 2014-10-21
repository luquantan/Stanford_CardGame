//
//  ViewController.h
//  Homework_1
//
//  Created by Lu Quan Tan on 10/14/14.
//  Copyright (c) 2014 LuQuanTan. All rights reserved.
//
// Abstract Class. Must implement methods as described below.

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController

// Protected
// For subclasses

- (Deck *)createDeck; //abstract

@end

