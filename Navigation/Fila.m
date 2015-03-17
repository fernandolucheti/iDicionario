//
//  Fila.m
//  Fila
//
//  Created by Fernando Lucheti on 06/02/15.
//  Copyright (c) 2015 Fernando Lucheti. All rights reserved.
//

#import "Fila.h"

@implementation Fila

-(id)init {
    self = [super init];
    self.elementos = [[NSMutableArray alloc]init];
    self.tamanho = 0;
    return self;
}


-(void) enfileirar:(NSObject *)elem {
    [self.elementos addObject: elem];
    self.tamanho++;
}
-(void) desenfileirar{
    [self.elementos removeObjectAtIndex: 0];
    self.tamanho--;
}

-(NSObject*) rodar{
    NSObject *x = [self ler];
    [self desenfileirar];
    [self enfileirar:x];
    return x;
}

-(NSObject*) back{
    NSObject *x1 = self.elementos.lastObject;
    [self.elementos removeLastObject];
    NSObject *x2 = self.elementos.lastObject;
    self.tamanho--;
    [self.elementos insertObject:x1 atIndex:0];
    self.tamanho++;
    return x2;
}

-(NSString *) ler{
    if (! [self vazio]){
      return self.elementos.firstObject;
    }else{
        return nil;
    }
}

-(int) tamanho{
    return _tamanho;
}

-(BOOL) vazio{
    if (self.elementos.count == 0){
        return true;
    }else{
        return false;
    }
}

@end
