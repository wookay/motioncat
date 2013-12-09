//
//  NSStringExt.h
//  TestApp
//
//  Created by ssukcha on 05/09/13.
//  Copyright (c) 2013 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSValueExt.h"

#define Empty            @""
#define SPACE            @" "
#define LF               @"\n"
#define TABCHAR          @"\t"
#define AMP              @"&"
#define AT_SIGN          @"@"
#define EQUAL            @"="
#define COLON            @":"
#define SEMICOLON        @";"
#define SEMICOLON_SPACE  @"; "
#define COMMA            @","
#define UNDERBAR         @"_"
#define COMMA_SPACE      @", "
#define COMMA_LF         @",\n"
#define DOT              @"."
#define DOT_SPACE        @". "
#define DOT_DOT          @".."
#define STAR             @"*"
#define SLASH            @"/"
#define PLUS             @"+"
#define PIPE             @"|"
#define MINUS            @"-"
#define QUESTION_MARK    @"?"
#define EXCLAMATION_MARK @"!"
#define DOLLAR           @"$"
#define TILDE            @"~"
#define LESS_THAN        @"<"
#define GREATER_THAN     @">"
#define OPENING_BRACE    @"{"
#define CLOSING_BRACE    @"}"
#define OPENING_PARENTHESE      @"("
#define CLOSING_PARENTHESE      @")"
#define OPENING_SQUARE_BRACKET  @"["
#define CLOSING_SQUARE_BRACKET  @"]"
#define DOUBLE_QUOTATION_MARK   @"\""
#define SINGLE_QUOTATION_MARK   @"'"


#define to_s(got) ({\
    typeof(got) __got = got;\
    [[NSValue stringWithAny:&__got objCType: @encode(__typeof__(got))] description];\
})


NSString* SWF(NSString* format, ...) ;
NSArray* _w(NSString* str) ;
NSString* unichar_to_string(unichar ch) ;


@interface NSString (Ext)

-(NSString*) strip ;
-(NSArray*) split:(NSString*)sep ;
-(NSArray*) each_chars ;
-(NSString*) reverse ;
-(NSString*) slice:(int)loc :(int)length_ ;
-(NSString*) slice:(int)loc backward:(int)backward ;
-(NSString*) gsub:(NSString*)str to:(NSString*)to ;
-(BOOL) include:(NSString*)str ;
-(NSString*) repeat:(int)times ;
-(int) to_int ;
-(float) to_float ;
-(double) to_double ;
-(NSString*) to_s ;
-(NSString*) ljust:(int)justified ;
-(unichar) to_unichar ;
-(NSString*) stringAtIndex:(int)idx ;
-(BOOL) isEmptyString ;

@end