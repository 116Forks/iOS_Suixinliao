//
//  IMAHost.h
//  TIMAdapter
//
//  Created by AlexiChen on 16/1/29.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import "IMAUser.h"

// 当前是用户信息
@interface IMAHost : IMAUser

@property (nonatomic, strong) TIMLoginParam     *loginParm;

@property (nonatomic, strong) TIMUserProfile    *profile;

@property (nonatomic, assign) BOOL isConnected;     // 当前是否连接上，外部可用此方法判断是否有网

// 同步自己的个人资料
- (void)asyncProfile;

// 判断用户是不是自己
- (BOOL)isMe:(IMAUser *)user;

@end
