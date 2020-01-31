# Manual Reference Counting

Answer the following questions inline with this document.

1. Are there memory leaks with this code? (If so, where are the leaks?)

	```swift
	NSString *quote = @"Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. And the only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle. As with all matters of the heart, you'll know when you find it. - Steve Jobs";

	NSCharacterSet *punctuationSet = [[NSCharacterSet punctuationCharacterSet] retain];

	NSString *cleanQuote = [[quote componentsSeparatedByCharactersInSet:punctuationSet] componentsJoinedByString:@""];
	NSArray *words = [[cleanQuote lowercaseString] componentsSeparatedByString:@" "];

	NSMutableDictionary<NSString *, NSNumber *> *wordFrequency = [[NSMutableDictionary alloc] init];

	for (NSString *word in words) {
		NSNumber *count = wordFrequency[word];
		if (count) {
			wordFrequency[word] = [NSNumber numberWithInteger:count.integerValue + 1];
		} else {
			wordFrequency[word] = [[NSNumber alloc] initWithInteger:1];
		}
	}

	printf("Word frequency: %s", wordFrequency.description.UTF8String);
// RIGHT HERE NEEDS TO HAVE THIS CODE
   
	```

	2. Rewrite the code so that it does not leak any memory with ARC disabled
 [punctuationSet release] //put this on line 28
 
2. Which of these objects is autoreleased?  Why?

	1. `NSDate *yesterday = [NSDate date];` Autoreleased with ***[NSDate  date]
	
	2. `NSDate *theFuture = [[NSDate dateWithTimeIntervalSinceNow:60] retain];`
	
	3. `NSString *name = [[NSString alloc] initWithString:@"John Sundell"];`
	
	4. `NSDate *food = [NSDate new];` Autoreleased with ***[NSDate new]
	
	5. `LSIPerson *john = [[LSIPerson alloc] initWithName:name];`
	
	6. `LSIPerson *max = [[[LSIPerson alloc] initWithName:@"Max"] autorelease];` Autoreleased with explicit wording to Autorelease

3. Explain when you need to use the `NSAutoreleasePool`. I think this is most useful when there are large amounts of data to loop through


4. Implement a convenience `class` method to create a `LSIPerson` object that takes a `name` property and returns an autoreleased object.

```swift
@interface LSIPerson: NSObject

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end

@interface LSIPerson: NSObject

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithName;
+ (LSIPerson)PersonWithNameOf(NSString *)name;

+ (LSIPerson)PersonWithNameOf(NSString *)name {
    return [[[LSIPerson alloc] initWithName:name] autorelease];
}

@end
```
Jonalynn Masters
