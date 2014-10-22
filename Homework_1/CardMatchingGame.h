//
//  CardMatchingGame.h
//  Homework_1
//
//  Created by LuQuan Intrepid on 10/15/14.
//  Copyright (c) 2014 LuQuanTan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"


@interface CardMatchingGame : NSObject

//This is a custom initializer that because in order for this game to initialize properly, it would need to know for example: "count" which is the number of cards we are going to make and a "Deck" of cards to deal cards from.
//Designated Initializer 
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck: (Deck *)deck;

//A game needs a score. "readonly" because the game logic decides the score, not anyone else. Therefore, there shouldnt be any setter allowed publicly. However, later we will set this to "readwrite" privately because we need to read and write from the logic to change and modify the score. Int is used, not uint since the score could be negative.
@property (nonatomic,readonly) NSInteger score;

//Need some method to allow people/players to choose a card. Reasonable to assume player can choose an index because they initialized the deck with some "count" of cards
- (void)chooseTwoCards:(NSUInteger)index;

//This will contain the logic for a three card match game
- (void)chooseThreeCards:(NSUInteger)index;

//Also, we need a method to return the state of the card, so that the UI can know what is cureently happening in the game.
- (Card *)cardAtIndex:(NSUInteger)index;

@property (strong, nonatomic, readonly) NSString *previousMatchString;
@property (strong,nonatomic, readonly) NSString *temporaryDisplayResult;
@property (strong, nonatomic, readonly) NSString *matchResult;


@end
