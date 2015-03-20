//
//  Dicionario.m
//  Navigation
//
//  Created by Fernando Lucheti on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Dicionario.h"

@implementation Dicionario

static Dicionario *SINGLETON = nil;



+ (id)getInstance{
    if (SINGLETON == nil){
        SINGLETON = [[Dicionario alloc] init];
    }
    return SINGLETON;
}

-(id)init {
    if(SINGLETON){
        return SINGLETON;
    }

    self.alfabeto = [[Fila alloc] init];
    [self preencherAlfabeto];
    return self;
}

-(void) preencherAlfabeto{
    for (char a = 'A'; a <= 'Z'; a++)
    {
        [self.alfabeto enfileirar: [NSString stringWithFormat:@"%c", a]];
    }
}



-(NSString *) randomStringWithLength: (NSString*) initial {
    
    NSString *letters = @"abcdefghijklmnopqrstuvwxyz";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: 7];
    
    for (int i=0; i<7; i++) {
        if (i == 0){
            [randomString appendFormat: @"%@", initial];
        }
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    
    return randomString;
}

@end
