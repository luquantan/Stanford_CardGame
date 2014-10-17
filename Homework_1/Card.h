//
//  Card.h
//  Homework_1
//
//  Created by Lu Quan Tan on 10/14/14.
//  Copyright (c) 2014 LuQuanTan. All rights reserved.
//

//This is one way of import a whole framework in iOS, the old syntax is #import <Foundation/Foundation.h>
@import Foundation;


@interface Card : NSObject

@property (strong,nonatomic) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

-(int)match:(NSArray *)otherCards;

- (int)matchThree:(NSArray *)otherCards;

@end
