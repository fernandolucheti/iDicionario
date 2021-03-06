//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraAViewController.h"
#import "TableViewController.h"


@implementation LetraAViewController



-(void) viewDidLoad {
    [super viewDidLoad];
    dicionario= [Dicionario getInstance];
    self.title = [dicionario.alfabeto ler];
    flag = false;
    TableViewController *tableView = [[TableViewController alloc] init];
    self.tabBarController.viewControllers = @[self.navigationController, tableView];
    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:@"Navegação"];
    [[self.tabBarController.tabBar.items objectAtIndex:1] setTitle:@"Detalhes"];
    CGFloat posicaoY = 100;
    CGFloat posicaoX = 20;
    CGFloat width =  44;
    CGFloat height = 44;
    CGFloat center = self.view.center.x;
    foto = [UIImage imageNamed:@"blueHx.jpg"];
    NSString *path = [[NSBundle mainBundle] pathForResource:[[dicionario.alfabeto ler] lowercaseString] ofType:@"jpg"];
    fotoLetra = [UIImage imageWithContentsOfFile:path];
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(posicaoX, posicaoY, width, height)];
    
    imgViewLetra = [[UIImageView alloc] initWithFrame:CGRectMake(posicaoX+80, posicaoY, width, height)];
    imgView.image = foto;
    imgViewLetra.image = fotoLetra;
    [self.view addSubview:imgView];
    [self.view addSubview:imgViewLetra];
    imgView.alpha = 0;
    imgViewLetra.alpha = 0;
    
    
    
    
    
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
        imgViewLetra.transform = CGAffineTransformMakeScale(2.0, 2.0);
        flag = true;
    }else{
        imgViewLetra.transform = CGAffineTransformMakeScale(1.0, 1.0);
        flag = false;
    }


}

-(void) animate{
    letra.alpha = 0;
    imgView.alpha = 0;
    imgViewLetra.alpha = 0;
    letra.transform = CGAffineTransformMakeTranslation(+20, 0);
    [UIView animateWithDuration: 2.0 animations:^{
        imgView.alpha = 1;
        imgViewLetra.alpha = 1;
        letra.alpha = 1;
        letra.transform = CGAffineTransformMakeTranslation(-70, 0);
    }];
}


-(void)next:(id)sender {
    NSString *x = [dicionario.alfabeto rodar];
    self.title = x;
    letra.text = x;
    NSString *path = [[NSBundle mainBundle] pathForResource:[x lowercaseString] ofType:@"jpg"];
    fotoLetra = [UIImage imageWithContentsOfFile:path];
    imgViewLetra.image = fotoLetra;
    [botao setTitle:[dicionario randomStringWithLength:x] forState:UIControlStateNormal];
    [botao sizeToFit];
    [self animate];
}

-(void)back:(id)sender {
    NSString *x = [dicionario.alfabeto back];
    self.title = x;
    letra.text = x;
    NSString *path = [[NSBundle mainBundle] pathForResource: [x lowercaseString] ofType:@"jpg"];
    fotoLetra = [UIImage imageWithContentsOfFile:path];
    imgViewLetra.image = fotoLetra;
    [botao setTitle:[dicionario randomStringWithLength:x] forState:UIControlStateNormal];
    [botao sizeToFit];
    [self animate];
    
}




@end
