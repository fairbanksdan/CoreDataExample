//
//  FDAlbumViewController.h
//  CoreDataExample
//
//  Created by Cole Bratcher on 5/7/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Artist.h"

@interface FDAlbumViewController : UIViewController

@property (weak, nonatomic) Artist *selectedArtist;

@end
