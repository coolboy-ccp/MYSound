//
//  PlayMultiMusics.m
//  MYSound
//
//  Created by liqunfei on 15/7/24.
//  Copyright (c) 2015年 QHPay. All rights reserved.
//

#import "PlayMultiMusics.h"

@implementation PlayMultiMusics

static NSMutableDictionary *_musices;
+ (NSMutableDictionary *)musices{
    if (_musices == nil) {
        _musices = [NSMutableDictionary dictionary];
    }
    return _musices;
}

//开始播放音乐
+ (BOOL) playMusic:(NSString *)filename
{
    if (!filename) {
        return NO;
    }
    AVAudioPlayer *player = [self musices][filename];
    if (!player) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        if (![player prepareToPlay]) {
            return NO;
        }
        [self musices][filename] = player;
    }
    if (![player isPlaying]) {
        return [player play];
    }
    return YES;
}

//暂停播放音乐
+ (void) pauseMusic:(NSString *)filename
{
    if (!filename) {
        return;
    }
    AVAudioPlayer *player = [self musices][filename];
    [player pause];
}

//停止播放音乐
+ (void)stopMusic:(NSString *)filename{
    if (!filename) {
        return;
    }
    AVAudioPlayer *player = [self musices][filename];
    [player stop];
    [[self musices] removeObjectForKey:filename];
}

static NSMutableDictionary *_soundIDS;

+ (NSMutableDictionary *)soundIDs{
    if (!_soundIDS) {
        _soundIDS = [NSMutableDictionary dictionary];
    }
    return _soundIDS;
}

#pragma 播放音效
+ (void) playSound:(NSString *)filename
{
    if (!filename) {
        return;
    }
    SystemSoundID soundid = [[self soundIDs][filename] unsignedIntegerValue];
    if (!soundid) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        if (!url) {
            return;
        }
        OSStatus status = AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &soundid);
        [self soundIDs][filename] = @(soundid);
    }
    AudioServicesPlayAlertSound(soundid);
    
}

//销毁音效
+ (void) disposeSound:(NSString *)filename{
    if (!filename) {
        return;
    }
    SystemSoundID soundid = [[self soundIDs][filename] unsignedIntegerValue];
    if (soundid) {
        AudioServicesDisposeSystemSoundID(soundid);
    }
    [[self soundIDs] removeObjectForKey:filename];
}

@end
