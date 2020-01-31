//
//  CCCPokemon.m
//  Pokedex-Objc
//
//  Created by Jonalynn Masters on 1/31/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import "CCCPokemon.h"

@interface CCCPokemon()

@property (nonatomic, nullable) NSMutableArray *abilitiesArray;

@end

@implementation CCCPokemon


- (instancetype)initWithName:(NSString *)name andURLString:(NSString *)urlString {
    if (self = [super init]) {
        self.name = name;
        self.pokemonURL = urlString;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.name = dictionary[@"name"];
        self.pokemonURL = dictionary[@"url"];
    }
    return self;
}

- (void)getAbilitiesAsString:(NSArray *)array {

    NSMutableArray<NSString *> *abilities = [@[] mutableCopy];

    for (NSDictionary *abilityDict in array) {
        NSDictionary *abilityDic = abilityDict[@"ability"];
        NSString *ability = abilityDic[@"name"];
        [abilities addObject:ability];
    }
    self.abilities = [abilities componentsJoinedByString:@", "];
}

@end
