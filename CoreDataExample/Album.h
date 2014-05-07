//
//  Album.h
//  CoreDataExample
//
//  Created by Cole Bratcher on 5/7/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Artist, Song;

@interface Album : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * year;
@property (nonatomic, retain) Artist *artist;
@property (nonatomic, retain) NSSet *songs;
@end

@interface Album (CoreDataGeneratedAccessors)

- (void)addSongsObject:(Song *)value;
- (void)removeSongsObject:(Song *)value;
- (void)addSongs:(NSSet *)values;
- (void)removeSongs:(NSSet *)values;

@end
