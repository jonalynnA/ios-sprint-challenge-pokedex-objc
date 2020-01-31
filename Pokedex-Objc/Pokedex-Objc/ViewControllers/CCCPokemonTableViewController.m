//
//  CCCPokemonTableViewController.m
//  Pokedex-Objc
//
//  Created by Jonalynn Masters on 1/31/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import "CCCPokemonTableViewController.h"
#import "CCCDetailViewController.h"
#import "CCCPokemon.h"
#import <Pokedex_Objc-Swift.h>
//#import "Pokedex_Objc-Swift.h"



@interface CCCPokemonTableViewController ()

@property (nonatomic) NSMutableArray *pokeArray;

@property PokemonAPI *pokeController;

@end

@implementation CCCPokemonTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _pokeController = [[PokemonAPI alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    [self.pokeController fetchAllPokemonWithCompletion:^(NSArray<CCCPokemon *> * _Nullable array, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%lu", array.count);
            [self.tableView  reloadData];
        });
    }];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.pokeController.allPokemon.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PokemonCell" forIndexPath:indexPath];

    CCCPokemon *pokemon = self.pokeController.allPokemon[indexPath.row];
    cell.textLabel.text = pokemon.name.capitalizedString;
    
    return cell;
}



#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowPokemonDetailSegue"]) {
        CCCDetailViewController *detailVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CCCPokemon *pokemon = self.pokeController.allPokemon[indexPath.row];
        detailVC.pokemon = pokemon;
        [self.pokeController fillInDetailsFor:pokemon];
    }
}

@end
