//
//  BoardViewController.m
//  CardGameApp
//
//  Created by Azizbek Asadov on 02.10.2025.
//

#import "Deck.h"
#import "CardViewCell.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "BoardViewController.h"

static NSString * const kCellId = @"CardViewCell";

@interface BoardViewController() <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

#pragma mark: - UI components

@property (strong, nonatomic) UILabel *flipsLabel;
@property (strong, nonatomic) UILabel *scoreLabel;
@property (strong, nonatomic) UICollectionView *collectionView;

#pragma mark: - Properties

@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck* deck;
@property (strong, nonatomic) CardMatchingGame* cardMatchingGameEngine;

@end

@implementation BoardViewController

static NSUInteger const cardCount = 12;

@synthesize flipsLabel = _flipsLabel;
@synthesize collectionView = _collectionView;

#pragma mark: - Lazy Properties

- (CardMatchingGame *) cardMatchingGameEngine {
    if (!_cardMatchingGameEngine) {
        _cardMatchingGameEngine = [[CardMatchingGame alloc] initWithCardCount:cardCount
                                                                    usingDeck: [self createDeck]];
    }
    
    return _cardMatchingGameEngine;
}


- (Deck*) deck {
    if (!_deck) {
        _deck = [self createDeck];
    }
    
    return _deck;
}

- (UILabel *) flipsLabel {
    if (!_flipsLabel) {
        _flipsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [_flipsLabel setTranslatesAutoresizingMaskIntoConstraints: NO];
        [_flipsLabel setFont:[UIFont systemFontOfSize: 14 weight:UIFontWeightMedium]];
        [_flipsLabel setTextColor:UIColor.whiteColor];
        [_flipsLabel setText:@"Flips: 0"];
    }
    
    return _flipsLabel;
}

- (UILabel *) scoreLabel {
    if (!_scoreLabel) {
        _scoreLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [_scoreLabel setTranslatesAutoresizingMaskIntoConstraints: NO];
        [_scoreLabel setFont:[UIFont systemFontOfSize: 14 weight:UIFontWeightMedium]];
        [_scoreLabel setTextColor:UIColor.whiteColor];
        [_scoreLabel setText:@"Score: 0"];
    }
    
    return _scoreLabel;
}

- (UICollectionView *) collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumInteritemSpacing = 10.0;
        layout.minimumLineSpacing = 12.0;
        layout.sectionInset = UIEdgeInsetsMake(16, 16, 16, 16);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [_collectionView registerClass:CardViewCell.class forCellWithReuseIdentifier:kCellId];
        [_collectionView setTranslatesAutoresizingMaskIntoConstraints: NO];
        [_collectionView setBackgroundColor:UIColor.clearColor];
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    
    return _collectionView;
}


- (Deck*) createDeck {
    return [[PlayingCardDeck alloc] init];
}

#pragma mark: - Methods

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
    [self updateUI];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [self updateUI];
}

- (void) setupSubViews {
    [self.view addSubview:self.flipsLabel];
    [self.view addSubview:self.scoreLabel];
    [self.view addSubview:self.collectionView];
    
    NSArray* flipsLabelConstraints = @[
        [self.flipsLabel.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-6],
        [self.flipsLabel.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:16],
    ];
    
    [NSLayoutConstraint activateConstraints:flipsLabelConstraints];
    
    NSArray* scoreLabelConstraints = @[
        [self.scoreLabel.bottomAnchor constraintEqualToAnchor:self.flipsLabel.topAnchor constant:-10],
        [self.scoreLabel.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:16],
    ];
    
    [NSLayoutConstraint activateConstraints:scoreLabelConstraints];
    
    NSArray* collectionViewConstaints = @[
        [self.collectionView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [self.collectionView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
        [self.collectionView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
        [self.collectionView.bottomAnchor constraintEqualToAnchor:self.scoreLabel.topAnchor constant:-10],
    ];
    
    [NSLayoutConstraint activateConstraints:collectionViewConstaints];
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

- (void) updateUI {
    [self.collectionView reloadData];
    
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %ld", self.cardMatchingGameEngine.flipCount];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.cardMatchingGameEngine.score];
}

- (void) updateUIForGivenIndices: (NSArray<NSIndexPath *>*) indexPaths {
    [self.collectionView reloadItemsAtIndexPaths:indexPaths];
    
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %ld", self.cardMatchingGameEngine.flipCount];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.cardMatchingGameEngine.score];
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

#pragma mark - UICollectionViewDataSource

- (NSInteger) collectionView:(UICollectionView *) collectionView
      numberOfItemsInSection:(NSInteger)section {
    return self.cardMatchingGameEngine.cardsCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *) collectionView
                  cellForItemAtIndexPath:(NSIndexPath *) indexPath {
    CardViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    
    if (cell) {
        Card *card = [self.cardMatchingGameEngine cardAtIndex:indexPath.item];
        
        [cell setCardCellData:card];
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)collectionViewLayout;
    UIEdgeInsets inset = layout.sectionInset;
    CGFloat inter = layout.minimumInteritemSpacing;
    CGFloat available = collectionView.bounds.size.width - inset.left - inset.right - (2 * inter);
    
    CGFloat width = floor(available / 3.0);
    CGFloat height = width * 1.4;
    
    return CGSizeMake(width, height);
}

- (void)collectionView:(UICollectionView *) collectionView
        didSelectItemAtIndexPath:(NSIndexPath *) indexPath {
    [self.cardMatchingGameEngine chooseCardAtIndex:indexPath.item];
    [self updateUI];
}

@end
