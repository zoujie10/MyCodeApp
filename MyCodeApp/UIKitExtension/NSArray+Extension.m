//
//  NSArray+Extension.m
//  MyCodeApp
//
//  Created by 邹杰 on 4/7/21.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)
+ (instancetype)qmui_arrayWithObjects:(id)object, ... {
    void (^addObjectToArrayBlock)(NSMutableArray *array, id obj) = ^void(NSMutableArray *array, id obj) {
        if ([obj isKindOfClass:[NSArray class]]) {
            [array addObjectsFromArray:obj];
        } else {
            [array addObject:obj];
        }
    };
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    addObjectToArrayBlock(result, object);
    
    va_list argumentList;
    va_start(argumentList, object);
    id argument;
    while ((argument = va_arg(argumentList, id))) {
        addObjectToArrayBlock(result, argument);
    }
    va_end(argumentList);
    if ([self isKindOfClass:[NSMutableArray class]]) {
        return result;
    }
    return result.copy;
}

- (void)qmui_enumerateNestedArrayWithBlock:(void (^)(id, BOOL *))block {
    BOOL stop = NO;
    for (NSInteger i = 0; i < self.count; i++) {
        id object = self[i];
        if ([object isKindOfClass:[NSArray class]]) {
            [((NSArray *)object) qmui_enumerateNestedArrayWithBlock:block];
        } else {
            block(object, &stop);
        }
        if (stop) {
            return;
        }
    }
}

- (NSMutableArray *)qmui_mutableCopyNestedArray {
    NSMutableArray *mutableResult = [self mutableCopy];
    for (NSInteger i = 0; i < self.count; i++) {
        id object = self[i];
        if ([object isKindOfClass:[NSArray class]]) {
            NSMutableArray *mutableItem = [((NSArray *)object) qmui_mutableCopyNestedArray];
            [mutableResult replaceObjectAtIndex:i withObject:mutableItem];
        }
    }
    return mutableResult;
}

- (NSArray *)qmui_filterWithBlock:(BOOL (^)(id))block {
    if (!block) {
        return self;
    }
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < self.count; i++) {
        id item = self[i];
        if (block(item)) {
            [result addObject:item];
        }
    }
    return [result copy];
}

@end
