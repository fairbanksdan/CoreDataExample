//
//  FDAlbumViewController.m
//  CoreDataExample
//
//  Created by Cole Bratcher on 5/7/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import "FDAlbumViewController.h"
#import "Album.h"
#import "FDSongViewController.h"

@interface FDAlbumViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITableView *albumsTableView;
@property (weak, nonatomic) IBOutlet UITextField *yearTextField;

@property (strong, nonatomic) NSArray *albums;

@end

@implementation FDAlbumViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.albumsTableView.delegate = self;
    self.albumsTableView.dataSource = self;
    
    self.nameTextField.delegate = self;
    self.yearTextField.delegate = self;
    
    self.albums = [self.selectedArtist.albums allObjects];
    [self.albumsTableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveAlbum:(id)sender {
    Album *newAlbum = [NSEntityDescription insertNewObjectForEntityForName:@"Album" inManagedObjectContext:self.selectedArtist.managedObjectContext];
    
    newAlbum.name = self.nameTextField.text;
    newAlbum.year = @(self.yearTextField.text.intValue);
    newAlbum.artist = self.selectedArtist;
    
    NSError *error;
    [self.selectedArtist.managedObjectContext save:&error];
    
    self.albums = [self.selectedArtist.albums allObjects];
    [self.albumsTableView reloadData];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.albums.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumCell"];
    Album *album = self.albums[indexPath.row];
    cell.textLabel.text = album.name;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"goToSongs"]) {
        FDSongViewController *destination = segue.destinationViewController;
        NSIndexPath *indexPath = [self.albumsTableView indexPathForSelectedRow];
        destination.selectedAlbum = self.albums[indexPath.row];
    }
}

@end
