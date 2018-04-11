GKCache
=======


[![Objective-C](https://img.shields.io/badge/language-objective--c-blue.svg)](https://github.com/gregkrsak/GKCache/blob/master/GKCache/GKCache/GKCache.m)


This is an iterable subclass of NSCache.

* [NSCache Class Reference]

Why is this cool?
-----------------
<strong>NSCache is a key-value container, similar to NSDictionary.</strong> It's useful for caching non-critical, expensive-to-create data that doesn't need a lot of persistence.

What's really interesting is, <strong>NSCache will purge your data if memory is running low.</strong> That might come in handy if you don't want to run out of memory just because of your cache.

The problem is: <strong>NSCache offers no way to enumerate the stored objects.</strong> Why? I don't know.

For situations where you (a) want to use NSCache, and (b) want to iterate through your cached objects, <strong>use GKCache as a replacement for NSCache.</strong> I hope you like it.

Installation (recommended method)
---------------------------------

- Add gregkrsak/GKCache as a submodule to your Git repository:

~~~bash
  git submodule add git@github.com:gregkrsak/GKCache.git ./GKCache
  git submodule update --init
  git commit ./GKCache -m 'Added submodule gregkrsak/GKCache'
~~~

![Image: Console output](https://drive.google.com/uc?export=view&id=0B15HSB1iaOZ2b1JjT0pTaU1zQWs "Oohh.. red. Ahh.")

- Drag GKCache.h and GKCache.m into your Xcode project

![Image: Dragging the source files into Xcode](https://drive.google.com/uc?export=view&id=0B15HSB1iaOZ2SlU4MWkxOUpRWDA "Be sure you grab the GKCache source files directly, and not an operating system folder.")

- Unselect "Copy items into destination group's folder", and click Finish. 

![Image: Confirm you want to add the source files](https://drive.google.com/uc?export=view&id=0B15HSB1iaOZ2WVhUWjFxNGM3Q1k "Just add the source files to your target; there's no need to copy.")

- Finally, `#import "GKCache/GKCache.h"`

Usage
-----

~~~objective-c
  // Declare and initialize an instance of GKCache.
  GKCache *myCacheOfFruit = [[GKCache alloc] init];
  // Add some objects. We'll use string objects, to keep it simple.
  [myCacheOfFruit setObject:@"Blueberry" forKey:@"favorite-fruit"];
  [myCacheOfFruit setObject:@"Durian" forKey:@"least-favorite-fruit"];
  // Sure, we can retrieve them from the cache, if we know their keys.
  id goodFruit = [myCacheOfFruit objectForKey:@"favorite-fruit"];
  id evilFruit = [myCacheOfFruit objectForKey:@"least-favorite-fruit"];
  // But NSCache wouldn't let us do this!
  for (id fruit in myCacheOfFruit.iterableCollection)
  {
    NSLog(@"This particular fruit is a %@", fruit);
  }
~~~

Want to contribute?
-------------------

Go ahead and fork me; pull requests are welcome.

Additional resources
--------------------

* [How do I use Git?]

* [Informal submodule tutorial]

* [Formal submodule documentation]

* [Forking and pull requests]

* [Download GitHub for Windows]

* [Download GitHub for Mac]

* [Download Git for Linux]

* http://en.wikipedia.org/wiki/Git_(software)

  [NSCache Class Reference]: https://developer.apple.com/library/ios/documentation/cocoa/reference/NSCache_Class/Reference/Reference.html
  [Informal submodule tutorial]: http://blog.jacius.info/git-submodule-cheat-sheet/
  [Formal submodule documentation]: http://git-scm.com/book/en/Git-Tools-Submodules
  [Forking and pull requests]: https://help.github.com/articles/using-pull-requests
  [How do I use Git?]: http://git-scm.com/documentation
  [Download GitHub for Windows]: http://windows.github.com/
  [Download GitHub for Mac]: http://mac.github.com/
  [Download Git for Linux]: http://git-scm.com/download/linux


