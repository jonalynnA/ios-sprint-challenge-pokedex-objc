//
//  CCCDetailViewController.m
//  Pokedex-Objc
//
//  Created by Jonalynn Masters on 1/31/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import "CCCDetailViewController.h"
#import "CCCPokemon.h"

@interface CCCDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *abilitiesLabel;
@end

@implementation CCCDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.layer.cornerRadius = 12;
    self.imageView.layer.cornerCurve = kCACornerCurveContinuous;
    self.containerView.layer.cornerRadius = 12;
    self.containerView.layer.cornerCurve = kCACornerCurveContinuous;

    if (self.pokemon) {
        self.nameLabel.text = self.pokemon.name.capitalizedString;
    }

    [self.pokemon addObserver:self forKeyPath:@"pokemonID" options:0 context:NULL];
    [self.pokemon addObserver:self forKeyPath:@"abilities" options:0 context:NULL];
    [self.pokemon addObserver:self forKeyPath:@"pokemonSprite" options:0 context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == NULL) {
        [self updateViews];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)updateViews {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView.image = self.pokemon.pokemonSprite;
        self.nameLabel.text = self.pokemon.name.capitalizedString;
        if (self.pokemon.abilities) {
            self.abilitiesLabel.text = self.pokemon.abilities.capitalizedString;
        } else {
            self.abilitiesLabel.text = @"No abilities";
        }
        self.idLabel.text = self.pokemon.pokemonID;
    });
}

- (void)dealloc
{
    [self.pokemon removeObserver:self forKeyPath:@"pokemonID"];
    [self.pokemon removeObserver:self forKeyPath:@"abilities"];
    [self.pokemon removeObserver:self forKeyPath:@"pokemonSprite"];
}


@end
