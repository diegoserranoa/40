//
//  MatchmakingClient.m
//  Cuarenta_UIKit
//
//  Created by Brounie on 7/7/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

#import "MatchmakingClient.h"

@implementation MatchmakingClient
{
	NSMutableArray *availableServers;
}

- (void)startSearchingForServersWithSessionID:(NSString *)sessionID
{
	availableServers = [NSMutableArray arrayWithCapacity:10];
    
	_session = [[GKSession alloc] initWithSessionID:sessionID displayName:nil sessionMode:GKSessionModeClient];
	_session.delegate = self;
	_session.available = YES;
}

- (NSArray *)availableServers
{
	return availableServers;
}

#pragma mark - GKSessionDelegate

- (void)session:(GKSession *)session peer:(NSString *)peerID didChangeState:(GKPeerConnectionState)state
{
	NSLog(@"MatchmakingClient: peer %@ changed state %d", peerID, state);
}

- (void)session:(GKSession *)session didReceiveConnectionRequestFromPeer:(NSString *)peerID
{
	NSLog(@"MatchmakingClient: connection request from peer %@", peerID);
}

- (void)session:(GKSession *)session connectionWithPeerFailed:(NSString *)peerID withError:(NSError *)error
{
	NSLog(@"MatchmakingClient: connection with peer %@ failed %@", peerID, error);
}

- (void)session:(GKSession *)session didFailWithError:(NSError *)error
{
	NSLog(@"MatchmakingClient: session failed %@", error);
}

@end
