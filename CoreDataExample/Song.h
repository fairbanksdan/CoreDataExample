//
//  Song.h
//  CoreDataExample
//
//  Created by Cole Bratcher on 5/7/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Song : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * trackNumber;
@property (nonatomic, retain) NSManagedObject *album;

@end
