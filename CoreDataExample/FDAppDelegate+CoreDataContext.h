//
//  FDAppDelegate+CoreDataContext.h
//  CoreDataExample
//
//  Created by Daniel Fairbanks on 5/7/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import "FDAppDelegate.h"

@interface FDAppDelegate (CoreDataContext)

-(void)createManageObjectContext:(void (^)(NSManagedObjectContext *context))completion;

@end
