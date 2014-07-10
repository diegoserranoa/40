//
//  MatchmakingServer.m
//  Cuarenta_UIKit
//
//  Created by Brounie on 7/7/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

#import "MatchmakingServer.h"

@implementation MatchmakingServer{
	NSMutableArray *connectedClients;
}

- (void)startAcceptingConnectionsForSessionID:(NSString *)sessionID
{
    connectedClients = [NSMutableArray arrayWithCapacity:self.maxClients];
    
	_session = [[GKSession alloc] initWithSessionID:sessionID displayName:nil sessionMode:GKSessionModeServer];
	_session.delegate = self;
	_session.available = YES;
}


- (NSArray *)connectedClients
{
	return connectedClients;
}

#pragma mark - GKSessionDelegate

- (void)session:(GKSession *)session peer:(NSString *)peerID didChangeState:(GKPeerConnectionState)state
{
	NSLog(@"MatchmakingServer: peer %@ changed state %d", peerID, state);
}

- (void)session:(GKSession *)session didReceiveConnectionRequestFromPeer:(NSString *)peerID
{
	NSLog(@"MatchmakingServer: connection request from peer %@", peerID);
}

- (void)session:(GKSession *)session connectionWithPeerFailed:(NSString *)peerID withError:(NSError *)error
{
	NSLog(@"MatchmakingServer: connection with peer %@ failed %@", peerID, error);
}

- (void)session:(GKSession *)session didFailWithError:(NSError *)error
{
	NSLog(@"MatchmakingServer: session failed %@", error);
}

@end

