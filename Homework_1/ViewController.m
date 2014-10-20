//
//  ViewController.m
//  Homework_1
//
//  Created by Lu Quan Tan on 10/14/14.
//  Copyright (c) 2014 LuQuanTan. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"


@interface ViewController ()

@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *previousMatchLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;


@end

@implementation ViewController

//Lazy Load of CardMatchingGame
-(CardMatchingGame *)game
{
    if(!_game) {
        _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                 usingDeck:[self createDeck]];
    }
        
        return _game;
}



- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}



- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        [self.game chooseCardAtIndex:chosenButtonIndex];
    } else {
        [self.game chooseThreeCards:chosenButtonIndex];
    }
    
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons){
        
        if (self.game.score) {
            self.segmentedControl.enabled = NO;
        } else if (self.game.score == 0) {
            self.segmentedControl.enabled = YES;
        }
        
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
        
        
    }
    NSMutableString *displayResult = [[NSMutableString alloc]initWithString:@""];
    [displayResult appendString:self.game.matchResult];
    
    [displayResult appendString:self.game.previousMatchString];
    self.previousMatchLabel.text = displayResult;
    

}



- (IBAction)buttonDidPress:(UIButton *)sender
{
    self.game = nil;
    [self updateUI];
}


//Helper methods to set the title and background image of UIButton depending on whether it is chosen or not
- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}
- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}
@end
