//
//  PlayMultiMusics.h
//  MYSound
//
//  Created by liqunfei on 15/7/24.
//  Copyright (c) 2015年 QHPay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface PlayMultiMusics : NSObject

#pragma 音乐文件
+ (BOOL) playMusic:(NSString *)filename;
+ (void) pauseMusic:(NSString *)filename;
+ (void)stopMusic:(NSString *)filename;

#pragma 音效文件
+ (void) playSound:(NSString *)filename;
+ (void) disposeSound:(NSString *)filename;
@end
