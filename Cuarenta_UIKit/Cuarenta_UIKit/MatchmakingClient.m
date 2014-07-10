//
//  MatchmakingClient.m
//  Cuarenta_UIKit
//
//  Created by Brounie on 7/7/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

#import "MatchmakingClient.h"

typedef enum
{
	ClientStateIdle,
	ClientStateSearchingForServers,
	ClientStateConnecting,
	ClientStateConnected,
}
ClientState;

@implementation MatchmakingClient
{
	NSMutableArray *availableServers;
	ClientState clientState;
	NSString *serverPeerID;
}

- (id)init
{
	if ((self = [super init]))
	{
		clientState = ClientStateIdle;
	}
	return self;
}

- (void)startSearchingForServersWithSessionID:(NSString *)sessionID
{
	if (clientState == ClientStateIdle)
	{
		clientState = ClientStateSearchingForServers;
        
        availableServers = [NSMutableArray arrayWithCapacity:10];
        
        _session = [[GKSession alloc] initWithSessionID:sessionID displayName:nil sessionMode:GKSessionModeClient];
        _session.delegate = self;
        _session.available = YES;
	}
}

- (void)connectToServerWithPeerID:(NSString *)peerID
{
	NSAssert(clientState == ClientStateSearchingForServers, @"Wrong state");
    
	clientState = ClientStateConnecting;
	serverPeerID = peerID;
	[_session connectToPeer:peerID withTimeout:_session.disconnectTimeout];
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

- (void)disconnectFromServer
{
	NSAssert(clientState != ClientStateIdle, @"Wrong state");
    
	clientState = ClientStateIdle;
    
	[_session disconnectFromAllPeers];
	_session.available = NO;
	_session.delegate = nil;
	_session = nil;
    
	availableServers = nil;
    
	[self.delegate matchmakingClient:self didDisconnectFromServer:serverPeerID];
	serverPeerID = nil;
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
			if (clientState == ClientStateSearchingForServers)
			{
				if (![availableServers containsObject:peerID])
				{
					[availableServers addObject:peerID];
					[self.delegate matchmakingClient:self serverBecameAvailable:peerID];
				}
			}
			break;
            
            // The client sees that a server goes away.
		case GKPeerStateUnavailable:
			if (clientState == ClientStateSearchingForServers)
			{
				if ([availableServers containsObject:peerID])
				{
					[availableServers removeObject:peerID];
					[self.delegate matchmakingClient:self serverBecameUnavailable:peerID];
				}
			}
			break;
            
            // You're now connected to the server.
		case GKPeerStateConnected:
			if (clientState == ClientStateConnecting)
			{
				clientState = ClientStateConnected;
			}
			break;
            
            // You're now no longer connected to the server.
		case GKPeerStateDisconnected:
			if (clientState == ClientStateConnected)
			{
				[self disconnectFromServer];
			}
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
    
    [self disconnectFromServer];
}

- (void)session:(GKSession *)session didFailWithError:(NSError *)error
{
#ifdef DEBUG
	NSLog(@"MatchmakingClient: session failed %@", error);
#endif
    
    if ([[error domain] isEqualToString:GKSessionErrorDomain])
	{
		if ([error code] == GKSessionCannotEnableError)
		{
			[self.delegate matchmakingClientNoNetwork:self];
			[self disconnectFromServer];
		}
	}
}

@end
