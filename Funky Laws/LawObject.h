//
//  LawObject.h
//  Funky Laws
//
//  Created by Alexander Alemayhu on 08.12.11.
//  Copyright (c) 2011 Flexnor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LawObject : NSObject{
    NSString *title;
    NSString *description;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *description;

-(id) initWithTitle:(NSString *) aTitle description:(NSString *)aDescription;

@end
