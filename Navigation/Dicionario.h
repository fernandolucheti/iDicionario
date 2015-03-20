//
//  Dicionario.h
//  Navigation
//
//  Created by Fernando Lucheti on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Fila.h"
#import <Foundation/Foundation.h>

@interface Dicionario : NSObject

@property Fila* alfabeto;

+(id) getInstance;

-(void) preencherAlfabeto;

-(NSString *) randomStringWithLength: (NSString*) initial;

@end
