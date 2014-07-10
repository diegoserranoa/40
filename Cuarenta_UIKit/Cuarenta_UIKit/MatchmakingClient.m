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

- (NSUInteger)availableServerCount
{
	return [availableServers count];
}

- (NSString *)peerIDForAvailableServerAtIndex:(NSUInteger)index
{
	return [availableServers objectAtIndex:index];
}

- (NSString *)displayNameForPeerID:(NSString *)peerID
{
	return [_session displayNameForPeer:peerID];
}

#pragma mark - GKSessionDelegate

- (void)session:(GKSession *)session peer:(NSString *)peerID didChangeState:(GKPeerConnectionState)state
{
#ifdef DEBUG
	NSLog(@"MatchmakingClient: peer %@ changed state %d", peerID, state);
#endif
    
    switch (state)
	{
            // The client has discovered a new server.
		case GKPeerStateAvailable:
			if (![availableServers containsObject:peerID])
			{
				[availableServers addObject:peerID];
				[self.delegate matchmakingClient:self serverBecameAvailable:peerID];
			}
			break;
            
            // The client sees that a server goes away.
		case GKPeerStateUnavailable:
			if ([availableServers containsObject:peerID])
			{
				[availableServers removeObject:peerID];
				[self.delegate matchmakingClient:self serverBecameUnavailable:peerID];
			}
			break;
            
		case GKPeerStateConnected:
			break;
            
		case GKPeerStateDisconnected:
			break;
            
		case GKPeerStateConnecting:
			break;
	}
}

- (void)session:(GKSession *)session didReceiveConnectionRequestFromPeer:(NSString *)peerID
{
#ifdef DEBUG
	NSLog(@"MatchmakingClient: connection request from peer %@", peerID);
#endif
}

- (void)session:(GKSession *)session connectionWithPeerFailed:(NSString *)peerID withError:(NSError *)error
{
#ifdef DEBUG
	NSLog(@"MatchmakingClient: connection with peer %@ failed %@", peerID, error);
#endif
}

- (void)session:(GKSession *)session didFailWithError:(NSError *)error
{
#ifdef DEBUG
	NSLog(@"MatchmakingClient: session failed %@", error);
#endif
}

@end
