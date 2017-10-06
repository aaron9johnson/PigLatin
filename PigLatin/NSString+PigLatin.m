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
    //separate into indivdiual words
    NSArray *words = [self componentsSeparatedByString:@" "];
    NSMutableString *pigLatin = [NSMutableString new];
    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiouy"];
    for(NSString *any in words){
        //find index of first vowel
        NSRange firstVowel = [any rangeOfCharacterFromSet:vowels];
        NSMutableString *pigWord = [NSMutableString new];
        if(any.length == 1 || firstVowel.location == 0){
            [pigWord appendString:any];
        } else{
            //add characters after, and including, first vowel
            [pigWord appendFormat:@"%@", [any substringWithRange:NSMakeRange(firstVowel.location, any.length - firstVowel.location)]];
            //add characters before first vowel to end
            [pigWord appendFormat:@"%@", [any substringToIndex:firstVowel.location]];
        }
        //add "ay" to end
        [pigWord appendFormat:@"ay"];
        [pigLatin appendFormat:@"%@ ",pigWord];
    }
    return [pigLatin stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];;
}
@end
