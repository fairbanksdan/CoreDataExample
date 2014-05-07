//
//  FDViewController.m
//  CoreDataExample
//
//  Created by Daniel Fairbanks on 5/7/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import "FDViewController.h"
//#import "FDAppDelegate.h"
#import "FDAppDelegate+CoreDataContext.h"
#import "Label.h"
#import "FDArtistViewController.h"
#import "Artist.h"

@interface FDViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) NSManagedObjectContext *objectContext;
@property (strong, nonatomic) NSArray *labels;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation FDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FDAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    [appDelegate createManageObjectContext:^(NSManagedObjectContext *context) {
        
        self.objectContext = context;
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)seedCoreData:(id)sender {
    
    Label *rapLabel = [NSEntityDescription insertNewObjectForEntityForName:@"Label" inManagedObjectContext:self.objectContext];
    rapLabel.name = @"Gangsta P";
    Label *countryLabel = [NSEntityDescription insertNewObjectForEntityForName:@"Label" inManagedObjectContext:self.objectContext];
    countryLabel.name = @"Cowboy Hats";
    
    Label *popLabel = [NSEntityDescription insertNewObjectForEntityForName:@"Label" inManagedObjectContext:self.objectContext];
    popLabel.name = @"Lolipopcorn";
    NSError *error;
    
    [self.objectContext save:&error];
    
    if (error)
    {
        NSLog(@"error: %@", error.localizedDescription);
    }
    
    
}

- (IBAction)fetchResults:(id)sender {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Label"];
    NSError *error;
    
//    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"name CONTAINS[cd] %@", @"popc"];
    
    self.labels = [self.objectContext executeFetchRequest:fetchRequest error:&error];
    
    NSLog(@" count: %lu", (unsigned long)self.labels.count);
    
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.labels.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"labelCell"];
    Label *label = self.labels[indexPath.row];
    cell.textLabel.text = label.name;
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"goToArtist"]) {
        FDArtistViewController *destinationVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        destinationVC.selectedLabel = self.labels[indexPath.row];
        
    }
}

@end
