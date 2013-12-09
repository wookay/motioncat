//
//  NSArrayExt.m
//  TestApp
//
//  Created by ssukcha on 05/09/13.
//  Copyright (c) 2013 factorcat. All rights reserved.
//

#import "NSArrayExt.h"
#import "NSStringExt.h"


NSInteger sortByFirstObjectComparator(NSArray* uno, NSArray* dos, void* context) {
    return [[uno first] compare:[dos first]];
}


@implementation NSArray (Ext)

-(NSArray*) reverse {
    return [[self reverseObjectEnumerator] allObjects];
}

-(NSString*) join:(NSString*)sep {
    return [self componentsJoinedByString:sep];
}

-(NSString*) join {
    return [self componentsJoinedByString:Empty];
}

-(BOOL) include:(id)obj {
    return [self containsObject:obj];
}

-(NSArray*) slice:(int)loc :(int)length_ {
    NSRange range;
    if (self.count > loc + length_) {
        range = NSMakeRange(loc, length_);
    } else {
        range = NSMakeRange(loc, self.count - loc);
    }
    return [self subarrayWithRange:range];
}

-(NSArray*) slice:(int)loc backward:(int)backward {
    return [self slice:loc :self.count + backward + 1];
}

-(NSString*) to_s {
    NSMutableArray* ary = [NSMutableArray array];
    for (id obj in self) {
        SEL sel  = @selector(to_s);
        if ([obj respondsToSelector:sel]) {
            [ary addObject:[obj to_s]];
        } else {
            [ary addObject:[obj description]];
        }
    }
    return [NSString stringWithFormat:@"[%@]", [ary join:COMMA_SPACE]];
}

-(id) first {
    return [self objectAtIndex:0];
}

-(id) second {
    return [self objectAtIndex:1];
}

-(id) third {
    return [self objectAtIndex:2];
}

-(id) last {
    return [self lastObject];
}

-(NSArray*) append:(NSArray*)ary {
    return [self arrayByAddingObjectsFromArray:ary];
}

-(NSArray*) sort {
	return [self sortedArrayUsingSelector:@selector(compare:)];
}

@end



@implementation NSMutableArray (Ext)

- (id) push:(id)obj {
    [self addObject:obj];
    return self;
}

- (id) pop {
    if (0 == [self count]) {
        return nil;
    }
    id obj = [self lastObject];
    [self removeLastObject];
    return obj;
}

-(void) clear {
    [self removeAllObjects];
}

@end
