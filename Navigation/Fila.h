//
//  Fila.h
//  Fila
//
//  Created by Fernando Lucheti on 06/02/15.
//  Copyright (c) 2015 Fernando Lucheti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fila : NSObject

@property  NSMutableArray *elementos;
@property  int tamanho;

-(void) enfileirar:(NSObject *)elem;
-(void) desenfileirar;
-(NSString *) ler;
-(NSObject *) rodar;
-(NSObject *) back;
-(BOOL) vazio;
-(int) tamanho;

@end
