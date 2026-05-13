# Decentralized Identity and Verifiable Credentials

This marketplace uses W3C Decentralized Identifiers (DIDs) and Verifiable Credentials (VCs) to establish trust for publishers and agents.

## Canonical DIDs

- Marketplace DID: did:web:agennext.dev
- Publisher DID: did:web:<publisher-domain>
- Agent DID: did:web:agents.<publisher-domain>:<agent-slug>

## Verifiable Credentials

The marketplace can issue:

- VerifiedPublisherCredential
- VerifiedAgentCredential
- ComplianceAttestationCredential

## Verification Flow

1. Resolve DID Document.
2. Verify proof and signature.
3. Check expiration.
4. Check revocation status.
5. Record audit event.
6. Update verification status.
