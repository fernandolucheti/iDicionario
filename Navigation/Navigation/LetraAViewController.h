//
//  LetraAViewController.h
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dicionario.h"

@interface LetraAViewController : UIViewController{
    Dicionario* dicionario;
    UIButton *botao;
    UILabel *letra;
    UIImage *foto;
    UIImage *fotoLetra;
    UIImageView *imgView;
    UIImageView *imgViewLetra;
    BOOL flag;
}

@end
