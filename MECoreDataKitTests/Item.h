//
//  Item.h
//  MECoreDataKit
//
//  Created by William Towe on 3/15/14.
//  Copyright (c) 2014 Maestro, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * identity;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * order;

@end
