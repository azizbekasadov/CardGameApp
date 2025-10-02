//
//  BoardViewController.m
//  CardGameApp
//
//  Created by Azizbek Asadov on 02.10.2025.
//

#import "BoardViewController.h"

@interface BoardViewController()

@property (strong, nonatomic) UILabel *flipsLabel;
@property (nonatomic) int flipCount;

@end

@implementation BoardViewController

@synthesize flipsLabel = _flipsLabel;

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
    
    NSArray* flipsLabelConstraints = @[
        [self.flipsLabel.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-24],
        [self.flipsLabel.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:16],
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
