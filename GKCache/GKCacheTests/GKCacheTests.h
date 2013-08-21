//
//  GKCacheTests.h
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

#define TestCacheName @"ThisIsAGKCacheInstance"

#define TestCacheObject @"ThisIsAGKCacheTestObject"

#define TestCacheKey @"ThisIsAGKCacheTestKey"

#define TestCacheCost 100

#define msg_IsNotNilWhenInitialized @"(GKCache instance should not be nil following init)"

#define msg_IsNotNilWhenInitializedWithName @"(GKCache instance should not be nil following initWithName:)"

#define msg_IterableCollectionIsNotNilWhenInitialized @"(Iterable collection should not be nil following any member of the init family)"

#define msg_NameIsSetProperlyWhenInitializedWithName @"(name property should be set following initWithName:)"

#define msg_DelegateIsSetToSelf @"(delegate property of GKCache instance should be set to the GKCache instance)"

#define msg_CanSetObjectForKeyInSelfAndRetrieveFromIterableCollection @"(iterableCollection property should contain added object following setValue:forKey:)"

#define msg_CanSetObjectForKeyWithCostInSelfAndRetrieveFromIterableCollection @"(iterableCollection property should contain added object following setValue:forKey:cost:)"

#define msg_CanRemoveObjectInSelfAndNotRetrieveFromIterableCollection @"(iterableCollection property should not contain removed object following removeObjectForKey:)"

#define msg_CanRemoveAllObjectsInSelfAndNotRetrieveFromIterableCollection @"(iterableCollection property should be empty following removeAllObjects)"
