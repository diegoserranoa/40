//
//  MatchmakingClient.h
//  Cuarenta_UIKit
//
//  Created by Brounie on 7/7/14.
//  Copyright (c) 2014 Brounie. All rights reserved.

@class MatchmakingClient;

@protocol MatchmakingClientDelegate <NSObject>

- (void)matchmakingClient:(MatchmakingClient *)client serverBecameAvailable:(NSString *)peerID;
- (void)matchmakingClient:(MatchmakingClient *)client serverBecameUnavailable:(NSString *)peerID;

@end


@interface MatchmakingClient : NSObject <GKSessionDelegate>

@property (nonatomic, strong, readonly) NSArray *availableServers;
@property (nonatomic, strong, readonly) GKSession *session;
@property (nonatomic, weak) id <MatchmakingClientDelegate> delegate;

- (void)startSearchingForServersWithSessionID:(NSString *)sessionID;
- (void)connectToServerWithPeerID:(NSString *)peerID;
- (NSUInteger)availableServerCount;
- (NSString *)peerIDForAvailableServerAtIndex:(NSUInteger)index;
- (NSString *)displayNameForPeerID:(NSString *)peerID;

@end
