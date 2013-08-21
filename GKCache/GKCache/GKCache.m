//
//  GKCache.m
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

#import "GKCache.h"

@implementation GKCache

#pragma mark - NSCache

- (void)setObject:(id)obj forKey:(id)key
{
  [super setObject:obj forKey:key];
  [self.iterableCollection addObject:obj];
}

- (void)setObject:(id)obj forKey:(id)key cost:(NSUInteger)num
{
  [super setObject:obj forKey:key cost:num];
  [self.iterableCollection addObject:obj];
}

#pragma mark - NSCacheDelegate

- (void)cache:(NSCache*)cache willEvictObject:(id)obj
{
  [self.iterableCollection removeObject:obj];
}

#pragma mark - GKCache

@synthesize iterableCollection = _iterableCollection;

- (id)iterableCollection
{
  return self->_iterableCollection;
}

- (void)setIterableCollection:(NSMutableSet*)collection
{
  // Clear the cache
  [self removeAllObjects];
  // Populate the cache with a hash table based on the new collection's objects
  for (id obj in collection) {
    [self setObject:obj forKey:[NSNumber numberWithUnsignedInteger:[obj hash]]];
  }
  self->_iterableCollection = collection;
}

- (id)init
{
  self = [super init];
  __typeof__(self) __weak weakSelf = self;
  self.iterableCollection = [[NSMutableSet alloc] init];
  self.delegate = weakSelf;
  return self;
}

- (id)initWithName:(NSString*)name
{
  self = [self init];
  [self setName:name];
  return self;
}

@end
