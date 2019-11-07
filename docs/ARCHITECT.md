# Architecture of the p2p chat application

This document contains a discussion on the fundamental ideas behind overcomming the challenges faced by this peer-to-peer system. It should be used as a reference before making any significant changes.

## Challenges in a peer-to-peer implementation and possible solutions

### Issues
1. Discovery of a first node without a dedicated relay server.
2. Connecting to clients behind a Symmetric NAT.
3. Connecting to clients behind a Randomized NAT.
4. Building routing tables so that each client .doesn't have to know about every other client.
5. Maintaining a secure contact list
6. Secure p2p communication for messaging and calls

### Solutions

1. Use DDNS to ensure that an outside node can always connect to a currently active node
2. Use TCP hole punching
3. Use a node with either a public ip or a hole punched address known by both peers to relay information
4. Use an XOR distance of a GUID and only store clients exponentially further away.
5. Only distribute public keys to trusted peers and use encrypted id whenever communication identification is needed between two peers
6. Attempt to get a direct connection without a relay. If this is not possible use one time keys to encrypt communication syncronisly.

## Solutions to Issues in greater detail
### 1. DDNS
### 2. TCP hole punching
### 3. Relays
### 4. Routing
### 5. Encryption
### 6. Message passing and Calling

