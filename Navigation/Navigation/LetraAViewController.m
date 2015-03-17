//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraAViewController.h"


@implementation LetraAViewController



-(void) viewDidLoad {
    [super viewDidLoad];
    dicionario= [[Dicionario alloc] init];
    self.title = [dicionario.alfabeto ler];
    
    
    CGFloat posicaoY = 100;
    CGFloat posicaoX = 20;
    CGFloat width =  44;
    CGFloat height = 44;
    
    letra = [[UILabel alloc] initWithFrame:CGRectMake(posicaoX, posicaoY, width, height)];
    letra.text = [dicionario.alfabeto ler];
    UIFont *font = letra.font;
    letra.font = [font fontWithSize:36];
    [self.view addSubview:letra];
    
    foto = [UIImage imageNamed:@"smile"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(posicaoX+50, posicaoY, width, height)];
    imgView.image = foto;
    [self.view addSubview:imgView];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem=back;
    
    
    
    botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:[dicionario randomStringWithLength:[dicionario.alfabeto rodar]] forState:UIControlStateNormal];
    [botao sizeToFit];
    botao.center = self.view.center;
    [self.view addSubview:botao];
 
}

-(void)next:(id)sender {
        NSString *x = [dicionario.alfabeto rodar];
    self.title = x;
    letra.text = x;
    [botao setTitle:[dicionario randomStringWithLength:x] forState:UIControlStateNormal];
    [botao sizeToFit];
}

-(void)back:(id)sender {
    NSString *x = [dicionario.alfabeto back];
    self.title = x;
    letra.text = x;
    [botao setTitle:[dicionario randomStringWithLength:x] forState:UIControlStateNormal];
    [botao sizeToFit];
}




@end
