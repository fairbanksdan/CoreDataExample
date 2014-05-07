//
//  Artist.h
//  CoreDataExample
//
//  Created by Daniel Fairbanks on 5/7/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Label;

@interface Artist : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * genre;
@property (nonatomic, retain) Label *label;

@end
