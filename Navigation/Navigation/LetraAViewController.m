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
    flag = false;
    
    CGFloat posicaoY = 100;
    CGFloat posicaoX = 20;
    CGFloat width =  44;
    CGFloat height = 44;
    
    foto = [UIImage imageNamed:@"blueHx.jpg"];
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(posicaoX, posicaoY, width, height)];
    imgView.image = foto;
    [self.view addSubview:imgView];
    imgView.alpha = 0;
    
    
    letra = [[UILabel alloc] initWithFrame:CGRectMake(posicaoX+80, posicaoY, width, height)];
    letra.text = [dicionario.alfabeto ler];
    UIFont *font = letra.font;
    letra.font = [font fontWithSize:36];
    letra.alpha = 0;
    letra.textColor = [UIColor whiteColor];
    [self.view addSubview:letra];
    
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem=back;
    
    [self animate];
    
    botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:[dicionario randomStringWithLength:[dicionario.alfabeto rodar]] forState:UIControlStateNormal];
    [botao sizeToFit];
    botao.center = self.view.center;
    [self.view addSubview:botao];
 
}



-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (!flag) {
        imgView.transform = CGAffineTransformMakeScale(2.0, 2.0);
        flag = true;
    }else{
        imgView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        flag = false;
    }


}

-(void) animate{
    letra.alpha = 0;
    imgView.alpha = 0;
    letra.transform = CGAffineTransformMakeTranslation(+20, 0);
    [UIView animateWithDuration: 1.0 animations:^{
        imgView.alpha = 1;
        letra.alpha = 1;
        letra.transform = CGAffineTransformMakeTranslation(-70, 0);
    }];
}

-(void)next:(id)sender {
        NSString *x = [dicionario.alfabeto rodar];
    self.title = x;
    letra.text = x;
    [botao setTitle:[dicionario randomStringWithLength:x] forState:UIControlStateNormal];
    [botao sizeToFit];
    [self animate];
}

-(void)back:(id)sender {
    NSString *x = [dicionario.alfabeto back];
    self.title = x;
    letra.text = x;
    [botao setTitle:[dicionario randomStringWithLength:x] forState:UIControlStateNormal];
    [botao sizeToFit];
    [self animate];
    
}




@end
