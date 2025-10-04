//
//  BoardViewController.m
//  CardGameApp
//
//  Created by Azizbek Asadov on 02.10.2025.
//

#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "BoardViewController.h"


@interface BoardViewController()

#pragma mark: - UI components

@property (strong, nonatomic) UILabel *flipsLabel;
@property (strong, nonatomic) UIButton *cardButton;

#pragma mark: - Properties

@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck* deck;
@property (strong, nonatomic) CardMatchingGame* cardMatchingGameEngine;

@end

@implementation BoardViewController

#pragma mark: - Lazy Properties

- (CardMatchingGame *) cardMatchingGameEngine {
    if (_cardMatchingGameEngine) {
        _cardMatchingGameEngine = [[CardMatchingGame alloc] initWithCardCount:0 usingDeck: [self createDeck]];
    }
    
    return _cardMatchingGameEngine;
}


- (Deck*) deck {
    if (!_deck) {
        _deck = [self createDeck];
    }
    
    return _deck;
}

- (Deck*) createDeck {
    return [[PlayingCardDeck alloc] init];
}

@synthesize flipsLabel = _flipsLabel;
@synthesize cardButton = _cardButton;

- (UILabel *) flipsLabel {
    if (!_flipsLabel) {
        _flipsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _flipsLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_flipsLabel setFont:[UIFont systemFontOfSize: 14 weight:UIFontWeightMedium]];
        [_flipsLabel setTextColor:UIColor.whiteColor];
        [_flipsLabel setText:@"Flips: 0"];
    }
    
    return _flipsLabel;
}

- (UIButton *) cardButton {
    if (!_cardButton) {
        _cardButton = [[UIButton alloc] initWithFrame:CGRectZero];
        _cardButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_cardButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_cardButton setBackgroundImage:[UIImage imageNamed:@"Card/backside"] forState:UIControlStateNormal];
        [_cardButton setTitle:@"" forState:UIControlStateNormal];
        [_cardButton addTarget:self
                        action:@selector(handleTouchCardButton:)
              forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _cardButton;
}

#pragma mark: - Methods

- (void) handleTouchCardButton: (UIButton *) sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed: @"Card/backside"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        Card *card = [self.deck drawRandomCard];
        
        if (card) {
            [sender setBackgroundImage:[UIImage imageNamed: @"Card/frontside"] forState:UIControlStateNormal];
            [sender setTitle:@"A♥︎" forState:UIControlStateNormal];
        }
    }
    
    self.flipCount++;
}

- (void) setCardButton:(UIButton *) cardButton {
    _cardButton = cardButton;
}

- (void) setFlipsLabel: (UILabel *) flipsLabel {
    _flipsLabel = flipsLabel;
}

- (void) setFlipCount: (int)flipCount {
    _flipCount = flipCount;
    
    [self.flipsLabel setText: [NSString stringWithFormat:@"Flips: %d", self.flipCount]];
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    [self rootViewStylization];
    [self setupNavigationBarItemsProperties];
    [self setupSubViews];
}

- (void) setupSubViews {
    [self.view addSubview:self.flipsLabel];
    [self.view addSubview:self.cardButton];
    
    NSArray* flipsLabelConstraints = @[
        [self.flipsLabel.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-24],
        [self.flipsLabel.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:16],
        [self.cardButton.centerYAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.centerYAnchor],
        [self.cardButton.centerXAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.centerXAnchor],
        [self.cardButton.widthAnchor constraintEqualToConstant:80],
        [self.cardButton.heightAnchor constraintEqualToConstant:120],
    ];
    
    [NSLayoutConstraint activateConstraints:flipsLabelConstraints];
}

- (void) handleCardPressed: (UIButton *) sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"Card/backside"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"Card/front"] forState:UIControlStateNormal];
        [sender setTitle:@"A♣︎" forState:UIControlStateNormal];
    }
    
    self.flipCount++;
}

- (void) generateCardButtons {
    
}

- (void) rootViewStylization {
    self.view.backgroundColor = UIColorFromRGB(0x3E8C54);
}

- (void) setupNavigationBarItemsProperties {
    self.navigationItem.title = @"Matchismo";
    self.navigationController.navigationBar.titleTextAttributes = @{
        NSForegroundColorAttributeName : UIColor.whiteColor
    };
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.tintColor = UIColor.whiteColor;
    self.navigationController.navigationBar.prefersLargeTitles = NO;
    self.navigationController.navigationBar.largeTitleTextAttributes = @{
        NSForegroundColorAttributeName : UIColor.whiteColor
    };
}

@end
