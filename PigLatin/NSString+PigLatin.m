//
//  NSString+PigLatin.m
//  PigLatin
//
//  Created by Aaron Johnson on 2017-10-06.
//  Copyright © 2017 Aaron Johnson. All rights reserved.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)
-(NSString *)stringByPigLatinization{
    NSArray *words = [self componentsSeparatedByString:@" "];
    NSMutableString *pigLatin = [NSMutableString new];
    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiouy"];
    for(NSString *any in words){
        NSRange firstVowel = [any rangeOfCharacterFromSet:vowels];
        NSMutableString *pigWord = [NSMutableString new];
        if(any.length == 1 || firstVowel.location == 0){
            [pigWord appendString:any];
        } else{
            [pigWord appendFormat:@"%@", [any substringWithRange:NSMakeRange(firstVowel.location, any.length - firstVowel.location)]];
            [pigWord appendFormat:@"%@", [any substringToIndex:firstVowel.location]];
        }
        [pigWord appendFormat:@"ay"];
        [pigLatin appendFormat:@"%@ ",pigWord];
    }
    return [pigLatin stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];;
}
@end
