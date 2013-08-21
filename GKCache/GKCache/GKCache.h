//
//  GKCache.h
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

#import <Foundation/Foundation.h>

@interface GKCache : NSCache <NSCacheDelegate>

#pragma mark - NSCache

- (void)setObject:(id)obj forKey:(id)key;

- (void)setObject:(id)obj forKey:(id)key cost:(NSUInteger)num;

#pragma mark - NSCacheDelegate

- (void)cache:(NSCache *)cache willEvictObject:(id)obj;

#pragma mark - GKCache

@property (strong, nonatomic,
           getter = iterableCollection,
           setter = setIterableCollection:) NSMutableSet* iterableCollection;

- (id)iterableCollection;

- (void)setIterableCollection:(NSMutableSet*)collection;

- (id)init;

- (id)initWithName:(NSString*)name;

@end
