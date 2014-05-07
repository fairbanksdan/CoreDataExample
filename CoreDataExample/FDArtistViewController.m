//
//  FDArtistViewController.m
//  CoreDataExample
//
//  Created by Daniel Fairbanks on 5/7/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import "FDArtistViewController.h"
#import "Artist.h"

@interface FDArtistViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *firstNameTF;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTF;
@property (weak, nonatomic) IBOutlet UITextField *genreTF;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *artists;

@end

@implementation FDArtistViewController

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
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.firstNameTF.delegate = self;
    self.lastNameTF.delegate = self;
    self.genreTF.delegate = self;
    
    self.artists = [self.selectedLabel.artists allObjects];
    [self.tableView reloadData];
    
    
}
- (IBAction)saveArtist:(id)sender {
    Artist *newArtist = [NSEntityDescription insertNewObjectForEntityForName:@"Artist" inManagedObjectContext:self.selectedLabel.managedObjectContext];
    
    newArtist.firstName = self.firstNameTF.text;
    newArtist.lastName = self.lastNameTF.text;
    newArtist.genre = self.genreTF.text;
    newArtist.label = self.selectedLabel;
    
    NSError *error;
    [self.selectedLabel.managedObjectContext save:&error];
    
    self.artists = [self.selectedLabel.artists allObjects];
    [self.tableView reloadData];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.artists.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artistCell"];
    Artist *artist = self.artists[indexPath.row];
    cell.textLabel.text = artist.firstName;
    
    return cell;
}

@end
