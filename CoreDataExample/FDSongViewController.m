//
//  FDSongViewController.m
//  CoreDataExample
//
//  Created by Cole Bratcher on 5/7/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import "FDSongViewController.h"
#import "Song.h"

@interface FDSongViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *songNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *trackNumberTextField;
@property (weak, nonatomic) IBOutlet UITableView *songsTableView;

@property (strong, nonatomic) NSArray *songs;

@end

@implementation FDSongViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.songsTableView.delegate = self;
    self.songsTableView.dataSource = self;
    
    self.songNameTextField.delegate = self;
    self.trackNumberTextField.delegate = self;
    
    self.songs = [self.selectedAlbum.songs allObjects];
    [self.songsTableView reloadData];
    
    
}
- (IBAction)saveSong:(id)sender {
    Song *newSong = [NSEntityDescription insertNewObjectForEntityForName:@"Song" inManagedObjectContext:self.selectedAlbum.managedObjectContext];
    
    newSong.name = self.songNameTextField.text;
    newSong.trackNumber = @(self.trackNumberTextField.text.integerValue);
    newSong.album = self.selectedAlbum;
    
    NSError *error;
    [self.selectedAlbum.managedObjectContext save:&error];
    
    self.songs = [self.selectedAlbum.songs allObjects];
    [self.songsTableView reloadData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songCell"];
    Song *song = self.songs[indexPath.row];
    cell.textLabel.text = song.name;
    
    return cell;
}

@end
