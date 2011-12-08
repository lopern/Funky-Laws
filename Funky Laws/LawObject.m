//
//  LawObject.m
//  Funky Laws
//
//  Created by Alexander Alemayhu on 08.12.11.
//  Copyright (c) 2011 Flexnor. All rights reserved.
//

#import "LawObject.h"

@implementation LawObject

@synthesize title, description;

-(id) initWithTitle:(NSString *)aTitle description:(NSString *)aDescription{
    
    if(self = [super init]) {
        title = [aTitle copy];
        description =  [aDescription copy];
    }
    
    return self;
}


-(void) dealloc{
    
    [title release];
    [description release];
    
    [super dealloc];
}

@end
