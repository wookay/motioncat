//
//  NSObjectExt.m
//  TestApp
//
//  Created by ssukcha on 06/09/13.
//  Copyright (c) 2013 factorcat. All rights reserved.
//

#import "NSObjectExt.h"
#import "NSClassExt.h"
#import "NSStringExt.h"
#import "NSArrayExt.h"
#import "objc/runtime.h"
#import "objc/message.h"
#import "Logger.h"
#import "NSValueExt.h"

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

-(NSString*) getValueStringForProperty:(NSString*)propertyName {
    SEL sel = NSSelectorFromString(propertyName);
	if (! [self respondsToSelector:sel]) {
		return @"-";
	}
    NSMethodSignature* sig = [self methodSignatureForSelector:sel];
	const char* aTypeDescription = [sig methodReturnType];
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:sig];
    [invocation setSelector:sel];
    [invocation invokeWithTarget:self];
    switch (*aTypeDescription) {
        case _C_VOID:
            break;
        case _C_BOOL: {
                BOOL value;
                [invocation getReturnValue:&value];
                return [NSValue stringWithAny:&value objCType:aTypeDescription];
            }
            break;
        case _C_CHR: {
                char value;
                [invocation getReturnValue:&value];
                return [NSValue stringWithAny:&value objCType:aTypeDescription];
            }
            break;
        case _C_DBL: {
                double value;
                [invocation getReturnValue:&value];
                return [NSValue stringWithAny:&value objCType:aTypeDescription];
            }
            break;
        case _C_INT: {
                int value;
                [invocation getReturnValue:&value];
                return [NSValue stringWithAny:&value objCType:aTypeDescription];
            }
            break;
        case _C_UINT: {
                unsigned int value;
                [invocation getReturnValue:&value];
                return [NSValue stringWithAny:&value objCType:aTypeDescription];
            }
            break;
        case _C_FLT: {
                float value;
                [invocation getReturnValue:&value];
                return [NSValue stringWithAny:&value objCType:aTypeDescription];
            }
            break;
        case _C_STRUCT_B:
        case _C_STRUCT_E: {
                const void* value;
                [invocation getReturnValue:&value];
                return [NSValue stringWithAny:&value objCType:aTypeDescription];
            }
            break;
        case _C_ID: {
                id value;
                [invocation getReturnValue:&value];
                if (value) {
                    CFRetain((CFTypeRef)value);
                }
                return to_s(value);
            }
            break;
        default: {
                id value;
                [invocation getReturnValue:&value];
                return [NSValue stringWithAny:&value objCType:aTypeDescription];
            }
            break;
    }
	return Empty;
}

-(NSArray*) properties {
    NSMutableArray* ary = [NSMutableArray array];
    int typeStrMax = 0;
    int propertyNameMax = 0;
    for (Class targetClass in @[self.class, self.superclass]) {
        unsigned int count = 0;
        objc_property_t *properties = class_copyPropertyList((Class)targetClass, &count);
        for(unsigned int idx = 0; idx < count; idx++ ) {
            objc_property_t property = properties[idx];
            const char* name = property_getName(property);
            NSString* propertyName = SWF(@"%s", name);
            const char* attr = property_getAttributes(property);
            const char *argType = (const char*)&attr[1];
            NSString* argTypeString = TypeEncodingDescription(argType);
            NSString* valueString = [self getValueStringForProperty:propertyName];
            [ary addObject:@[propertyName, argTypeString, valueString]];
            typeStrMax = MAX(typeStrMax, argTypeString.length);
            propertyNameMax = MAX(propertyNameMax, propertyName.length);
        }
        free(properties);
    }
    NSMutableArray* ret = [NSMutableArray array];
	for (NSArray* trio in [ary sortedArrayUsingFunction:sortByFirstObjectComparator context:nil]) {
		[ret addObject:SWF(@"%@ %@ %@", [trio.second Ljust:typeStrMax], [trio.First Ljust:propertyNameMax], trio.third)];
	}
	return ret;
}

@end
