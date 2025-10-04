//
//  CardViewCell.m
//  CardGameApp
//
//  Created by Azizbek Asadov on 04.10.2025.
//

#import "CardViewCell.h"

@interface CardViewCell()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *label;

@end

@implementation CardViewCell

@synthesize imageView = _imageView;
@synthesize label = _label;

- (UILabel *) label {
    if (!_label) {
        _label = UILabel.new;
        _label.translatesAutoresizingMaskIntoConstraints = NO;
        [_label setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightSemibold]];
        [_label setTextAlignment:NSTextAlignmentCenter];
    }
    
    return _label;
}

- (UIImageView *) imageView {
    if (!_imageView) {
        _imageView = UIImageView.new;
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _imageView;
}

- (void)setImageView:(UIImageView *)imageView {
    _imageView = imageView;
}

- (void)setLabel:(UILabel *) label {
    _label = label;
}

- (void) setupSubviews {
    self.contentView.layer.cornerRadius = 6.0;
    self.contentView.backgroundColor = UIColor.whiteColor;
    
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.label];
}

- (void)setupConstraits {
    [NSLayoutConstraint activateConstraints:@[
        [self.imageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
        [self.imageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor],
        [self.imageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor],
        [self.imageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor],
        
        [self.label.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
        [self.label.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor],
        [self.label.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor],
        [self.label.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor],
    ]];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.imageView.image = nil;
    self.label.text = nil;
}

- (NSString *) titleForCard: (Card *) card {
    return (card.isChosen) ? card.contents : @"";
}

- (UIImage *) imageForCard: (Card *) card {
    return [UIImage imageNamed: (card.isChosen) ? @"" : @"Card/backside"];
}

- (void) setCardCellData:(Card *) card {
    self.imageView.image = [self imageForCard:card];
    self.label.text = [self titleForCard:card];
    self.userInteractionEnabled = !card.isMatched;
}

@end
