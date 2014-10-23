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
#import "SetGameCardDeck.h"
#import "SetGameCard.h"


@interface ViewController ()

@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *previousMatchLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) NSMutableArray *matchHistory;
@property (weak, nonatomic) IBOutlet UISlider *pastMatchSlider;

@property (strong, nonatomic) Card *randomCard;
@property (strong, nonatomic) Deck *setgamedeck;



@end

@implementation ViewController

//Lazy load of matchHistory
- (NSMutableArray *)matchHistory
{
    if (!_matchHistory) {
        _matchHistory = [[NSMutableArray alloc]init];
        
        }
    
    return _matchHistory;
}

////Lazy Load of CardMatchingGame
//-(void)returnTheOutputOfCallingAnEnum
//{
//   
//    CardMatchingGame *game1 = [[CardMatchingGame alloc]init];
//    Deck *setgamedeck = [[SetGameCardDeck alloc]init];
//    
//    Card *randomCard = setgamedeck.drawRandomCard;
//    
////    NSLog(@"%i", self.game card.symbol)
//
//    
//}

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

//Set the slider range to expand everytime a new match history is added
- (void)setSliderRange
{
    NSUInteger numberOfMatches = [self.matchHistory count] - 1;
    self.pastMatchSlider.maximumValue = numberOfMatches;
    [self.pastMatchSlider setValue:numberOfMatches animated:YES];
}

//Change the displayResult when the slider is moved.
- (IBAction)changeSlider:(UISlider *)sender {
    NSUInteger sliderValue;
    sliderValue = lroundf(self.pastMatchSlider.value);
    [self.pastMatchSlider setValue:sliderValue animated:NO];
    
    if ([self.matchHistory count]) {
        if (sliderValue + 1 < [self.matchHistory count]) {
            self.previousMatchLabel.alpha = 0.6;
        } else {
            self.previousMatchLabel.alpha = 1.0;
        }

        self.previousMatchLabel.text = [self.matchHistory objectAtIndex:sliderValue];
    }
}


//When reDeal button is pressed, "nil" the current game and update UI (which is will re-init another game)
- (IBAction)reDealButtonIsPressed:(UIButton *)sender
{
    self.game = nil;
    self.matchHistory = nil;
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
    
    self.previousMatchLabel.alpha = 1.0;
    NSMutableString *displayResult = [[NSMutableString alloc]initWithString:@""];
    
//    self.previousMatchLabel.text = self.game.temporaryDisplayResult;
//    NSLog(@"temporaryDisplayResult should run");
    

    [displayResult appendString:self.game.matchResult];
    [displayResult appendString:self.game.previousMatchString];
    self.previousMatchLabel.text = displayResult;
    
    if (![displayResult isEqualToString:@""] && ![[self.matchHistory lastObject] isEqualToString:displayResult]) {
        [self.matchHistory addObject:displayResult];
        [self setSliderRange];
    }
    
    
    
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
