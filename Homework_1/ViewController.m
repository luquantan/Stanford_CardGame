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

//Create any deck of cards (Set cards or playing cards)
- (Deck *)createDeck //abstract
{
    return nil;
}


//Provides the index of current cardButton touched. Also, chooses whether to play a two or three card game depending on the current position of the segmentedControl.
- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    
    
    //LQ note: maybe i can make an if statement here in order to decide whether to use playingcardmatching or setgamecardmatching based on the current index of the tabBarController
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        [self.game chooseTwoCards:chosenButtonIndex];
    } else {
        [self.game chooseThreeCards:chosenButtonIndex];
    }
    
    [self updateUI];
}


//When reDeal button is pressed, "nil" the current game and update UI (which is will re-init another game)
- (IBAction)reDealButtonIsPressed:(UIButton *)sender
{
    self.game = nil;
    [self updateUI];
    self.segmentedControl.enabled = YES;
}

#pragma mark - Update UI 
- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons){
        
        if (self.game.score) {
            self.segmentedControl.enabled = NO; //disable segmentedControl when game starts
        }
        
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
        
        
    }
//    self.previousMatchLabel.text = self.game.temporaryDisplayResult;
//    NSLog(@"temporaryDisplayResult shoudl run");
    NSMutableString *displayResult = [[NSMutableString alloc]initWithString:@""];
    [displayResult appendString:self.game.matchResult];
    [displayResult appendString:self.game.previousMatchString];
    self.previousMatchLabel.text = displayResult;
    
    
}

//Helper methods to set the title and background image of UIButton based on whether it is chosen or not
- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}
- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}




@end
