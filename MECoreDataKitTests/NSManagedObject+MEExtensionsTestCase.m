//
//  NSManagedObject+MEExtensionsTestCase.m
//  MECoreDataKit
//
//  Created by William Towe on 3/15/14.
//  Copyright (c) 2014 Maestro, LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSManagedObject+MEExtensions.h"
#import "Item.h"

@interface NSManagedObject_MEExtensionsTestCase : XCTestCase
@property (strong,nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong,nonatomic) NSManagedObjectContext *managedObjectContext;
@end

@implementation NSManagedObject_MEExtensionsTestCase

- (void)setUp {
    [super setUp];
    
    [self setPersistentStoreCoordinator:[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[[NSManagedObjectModel alloc] initWithContentsOfURL:[[NSBundle bundleForClass:self.class] URLForResource:@"Model" withExtension:@"momd"]]]];
    [self.persistentStoreCoordinator addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL];
    
    [self setManagedObjectContext:[[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType]];
    [self.managedObjectContext setUndoManager:nil];
    [self.managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
}

- (void)testME_JSONRepresentation {
    Item *item = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Item class]) inManagedObjectContext:self.managedObjectContext];
    
    [item setIdentity:[[NSUUID UUID] UUIDString]];
    [item setName:@"Willbur"];
    [item setOrder:@1];
    
    XCTAssert([item ME_JSONRepresentation]);
}

@end
