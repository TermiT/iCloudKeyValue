//
//  Plugin.m
//  iCloudKeyValue
//
//  Created by Gennadii Potapov on 30/7/16.
//  Copyright © 2016 General Arcade. All rights reserved.
//

#import <Foundation/Foundation.h>

void iCloudKV_Synchronize() {
    [[NSUbiquitousKeyValueStore defaultStore] synchronize];
}

void iCloudKV_SetInt(char * key, int value) {
    [[NSUbiquitousKeyValueStore defaultStore] setObject:[NSNumber numberWithInt:value] forKey:[NSString stringWithUTF8String:key]];

}

void iCloudKV_SetFloat(char * key, float value) {
    [[NSUbiquitousKeyValueStore defaultStore] setObject:[NSNumber numberWithFloat:value] forKey:[NSString stringWithUTF8String:key]];
}

int iCloudKV_GetInt(char * key) {
    NSNumber * num = (NSNumber *)([[NSUbiquitousKeyValueStore defaultStore] objectForKey:[NSString stringWithUTF8String:key]]);
    int i = 0;
    if (num != nil)
        i = [num intValue];
    return i;
}

float iCloudKV_GetFloat(char * key) {
    NSNumber * num = (NSNumber *)([[NSUbiquitousKeyValueStore defaultStore] objectForKey:[NSString stringWithUTF8String:key]]);
    float i = 0;
    if (num != nil)
        i = [num floatValue];
    return i;
}

void iCloudKV_Reset() {
    NSUbiquitousKeyValueStore *kvStore = [NSUbiquitousKeyValueStore defaultStore];
    NSDictionary *kvd = [kvStore dictionaryRepresentation];
    NSArray *arr = [kvd allKeys];
    for (int i=0; i < arr.count; i++){
        NSString *key = [arr objectAtIndex:i];
        [kvStore removeObjectForKey:key];
    }
    [[NSUbiquitousKeyValueStore defaultStore] synchronize];
}
