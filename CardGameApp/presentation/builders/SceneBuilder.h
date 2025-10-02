//
//  SceneBuilder.h
//  CardGameApp
//
//  Created by Azizbek Asadov on 03.10.2025.
//

#ifndef SceneBuilder_h
#define SceneBuilder_h

@import UIKit;
@import Foundation;

@protocol SceneBuilder <NSObject>

- (UIViewController *) build;

@end

#endif /* SceneBuilder_h */
