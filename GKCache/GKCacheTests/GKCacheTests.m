//
//  GKCacheTests.m
//  https://github.com/gregkrsak/GKCache
//
//  Created by Greg M. Krsak (greg.krsak@gmail.com) on 8/20/13.
//
//  Copyright 2013 Greg M. Krsak
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "GKCacheTests.h"

#import "GKCache.h"

#import <XCTest/XCTest.h>

@interface GKCacheTests : XCTestCase

@end

@implementation GKCacheTests
{
  GKCache* _cacheUnderTest;
}

- (void)setUp
{
  [super setUp];
  self->_cacheUnderTest = [GKCache alloc];
}

- (void)tearDown
{
  self->_cacheUnderTest = nil;
  [super tearDown];
}

- (void)test_IsNotNilWhenInitialized
{
  self->_cacheUnderTest = [self->_cacheUnderTest init];
  XCTAssertNotNil(self->_cacheUnderTest, msg_IsNotNilWhenInitialized);
}

- (void)test_IsNotNilWhenInitializedWithName
{
  self->_cacheUnderTest = [self->_cacheUnderTest initWithName:TestCacheName];
  XCTAssertNotNil(self->_cacheUnderTest, msg_IsNotNilWhenInitializedWithName);
}

- (void)test_IterableCollectionIsNotNilWhenInitialized
{
  self->_cacheUnderTest = [self->_cacheUnderTest init];
  XCTAssertNotNil(self->_cacheUnderTest.iterableCollection, msg_IterableCollectionIsNotNilWhenInitialized);
}

- (void)test_NameIsSetProperlyWhenInitializedWithName
{
  self->_cacheUnderTest = [self->_cacheUnderTest initWithName:TestCacheName];
  NSString* expected = TestCacheName;
  NSString* actual = self->_cacheUnderTest.name;
  XCTAssertEqualObjects(actual, expected, msg_NameIsSetProperlyWhenInitializedWithName);
}

- (void)test_DelegateIsSetToSelf
{
  self->_cacheUnderTest = [self->_cacheUnderTest init];
  GKCache* expected = self->_cacheUnderTest;
  GKCache* actual = self->_cacheUnderTest.delegate;
  XCTAssertEqual(actual, expected, msg_DelegateIsSetToSelf);
}

- (void)test_CanSetObjectForKeyInSelfAndRetrieveFromIterableCollection
{
  self->_cacheUnderTest = [self->_cacheUnderTest init];
  [self->_cacheUnderTest setObject:TestCacheObject forKey:TestCacheKey];
  NSString* expected = TestCacheObject;
  NSString* actual = [[self->_cacheUnderTest.iterableCollection objectEnumerator] nextObject];
  XCTAssertEqualObjects(actual, expected, msg_CanSetObjectForKeyInSelfAndRetrieveFromIterableCollection);
}

- (void)test_CanSetObjectForKeyWithCostInSelfAndRetrieveFromIterableCollection
{
  self->_cacheUnderTest = [self->_cacheUnderTest init];
  [self->_cacheUnderTest setObject:TestCacheObject forKey:TestCacheKey cost:TestCacheCost];
  NSString* expected = TestCacheObject;
  NSString* actual = [[self->_cacheUnderTest.iterableCollection objectEnumerator] nextObject];
  XCTAssertEqualObjects(actual, expected, msg_CanSetObjectForKeyWithCostInSelfAndRetrieveFromIterableCollection);
}

- (void)test_CanRemoveObjectInSelfAndNotRetrieveFromIterableCollection
{
  self->_cacheUnderTest = [self->_cacheUnderTest init];
  [self->_cacheUnderTest setObject:TestCacheObject forKey:TestCacheKey]; // add
  [self->_cacheUnderTest removeObjectForKey:TestCacheKey]; // remove
  NSString* expected = nil;
  NSString* actual = [[self->_cacheUnderTest.iterableCollection objectEnumerator] nextObject];
  XCTAssertEqualObjects(actual, expected, msg_CanRemoveObjectInSelfAndNotRetrieveFromIterableCollection);
}

- (void)test_CanRemoveAllObjectsInSelfAndNotRetrieveFromIterableCollection
{
  self->_cacheUnderTest = [self->_cacheUnderTest init];
  [self->_cacheUnderTest setObject:TestCacheObject forKey:TestCacheKey]; // add
  [self->_cacheUnderTest removeAllObjects]; // remove
  NSString* expected = nil;
  NSString* actual = [[self->_cacheUnderTest.iterableCollection objectEnumerator] nextObject];
  XCTAssertEqualObjects(actual, expected, msg_CanRemoveAllObjectsInSelfAndNotRetrieveFromIterableCollection);
}

@end
