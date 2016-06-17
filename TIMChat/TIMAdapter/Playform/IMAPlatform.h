//
//  IMAPlatform.h
//  TIMAdapter
//
//  Created by AlexiChen on 16/2/17.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

// Demo的业务逻辑入口，外部所的要使用IMSDK的地方，都间接能过IMAPlatform调用

@interface IMAPlatform : IMABase
{
@protected
    IMAHost                     *_host;             // 当前用户
    IMAContactManager           *_contactMgr;       // 联系人
    IMAConversationManager      *_conversationMgr;  // 会话列表

}


@property (nonatomic, readonly) IMAHost                 *host;

@property (nonatomic, readonly) IMAConversationManager  *conversationMgr;

@property (nonatomic, readonly) IMAContactManager       *contactMgr;

+ (instancetype)configWith:(IMAPlatformConfig *)cfg;

+ (instancetype)sharedInstance;

// 是否是自动登录
+ (BOOL)isAutoLogin;

+ (void)setAutoLogin:(BOOL)autologin;

- (IMAPlatformConfig *)localConfig;

- (void)saveToLocal;

// 初始化新增的缓存同步逻辑

// 退出
- (void)logout:(TIMLoginSucc)succ fail:(TIMFail)fail;

- (IMAUser *)getReceiverOf:(IMAConversation *)conv;

// 被踢下线后，再重新登录
- (void)offlineLogin;

@end


