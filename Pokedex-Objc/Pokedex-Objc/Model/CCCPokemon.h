//
//  CCCPokemon.h
//  Pokedex-Objc
//
//  Created by Jonalynn Masters on 1/31/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCCPokemon : NSObject

@property (nonatomic, nullable, copy) NSString *name;
@property (nonatomic, nullable, copy) NSString *pokemonURL;
@property (nonatomic, nullable, copy) NSString *pokemonID;
@property (nonatomic, nullable, copy) NSString *spriteURL;
@property (nonatomic, nullable) UIImage *pokemonSprite;
@property (nonatomic, nullable, copy) NSString *abilities;

- (instancetype)initWithName:(NSString *)name andURLString:(NSString *)urlString;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (void)getAbilitiesAsString:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
