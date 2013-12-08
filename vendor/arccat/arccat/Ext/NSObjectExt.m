//
//  NSObjectExt.m
//  TestApp
//
//  Created by ssukcha on 06/09/13.
//  Copyright (c) 2013 factorcat. All rights reserved.
//

#import "NSObjectExt.h"
#import "NSClassExt.h"
#import "objc/runtime.h"

@implementation NSObject (Ext)

-(NSString*) className {
    return NSStringFromClass([self class]);
}

-(NSArray*) methods {
    return [NSClassExt methodsForClass:[self class]];
}

-(NSArray*) classMethods {
    Class klass = [self class];
    Class targetClass = object_getClass(klass);
    return [NSClassExt methodsForClass:targetClass];
}

@end
