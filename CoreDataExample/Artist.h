//
//  Artist.h
//  CoreDataExample
//
//  Created by Cole Bratcher on 5/7/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Album, Label;

@interface Artist : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * genre;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) Label *label;
@property (nonatomic, retain) NSSet *albums;
@end

@interface Artist (CoreDataGeneratedAccessors)

- (void)addAlbumsObject:(Album *)value;
- (void)removeAlbumsObject:(Album *)value;
- (void)addAlbums:(NSSet *)values;
- (void)removeAlbums:(NSSet *)values;

@end
