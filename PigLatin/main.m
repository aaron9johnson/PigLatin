//
//  main.m
//  PigLatin
//
//  Created by Aaron Johnson on 2017-10-06.
//  Copyright © 2017 Aaron Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *myString = @"Hello my name is Aaron I live on fifteenth street";
        SEL pigLatin = @selector(stringByPigLatinization);
        if([myString respondsToSelector:pigLatin]){
            myString = [myString performSelector:pigLatin];
        }
        
        NSLog(@"%@", myString);
    }
    return 0;
}
