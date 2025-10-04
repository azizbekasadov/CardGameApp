//
//  CoreCollectionViewCell.m
//  CardGameApp
//
//  Created by Azizbek Asadov on 04.10.2025.
//

#import "CoreCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@implementation CoreCollectionViewCell

- (instancetype)initWithFrame:(CGRect) frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupSubviews];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self setupConstraits];
}

- (void)setupSubviews {
    // Reusable
}

- (void)setupConstraits {
    // Reusable
}

@end

NS_ASSUME_NONNULL_END
