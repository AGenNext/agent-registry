# Agent Marketplace

A DID-first marketplace for discovering, publishing, verifying, subscribing to, rating, and governing AI agents.

Agent Marketplace is designed as a trusted distribution layer for AI agents. It combines an agent registry, marketplace listings, publisher verification, lifecycle governance, subscriptions, entitlements, reviews, and enterprise-ready audit controls.

> Repository note: the repository is currently named `agent-regitsry`. Before public launch, rename it to `agent-marketplace` or `agent-registry-marketplace`.

## Why this exists

AI agents need more than a directory. Buyers need to know who published an agent, what it can do, what data it touches, which protocols it supports, how it is priced, whether it is verified, and whether it is safe to use inside an organization.

This project aims to provide that marketplace layer.

## Core goals

- Let publishers list AI agents with verifiable identity and clear capability metadata.
- Let users and enterprises discover, compare, test, subscribe to, and review agents.
- Give marketplace operators tools for verification, moderation, lifecycle control, and abuse response.
- Support DID-based identity and protocol interoperability from the start.
- Keep the platform vendor-neutral and extensible.

## Key capabilities

### Marketplace discovery

- Public listing catalog
- Keyword search
- Capability filters
- Category filters
- Protocol filters
- Trust-level filters
- Publisher filters
- Pricing and deployment filters
- Compliance and data-access filters

### Publisher experience

- Publisher profile creation
- Publisher verification
- Agent registration
- Marketplace listing creation
- Versioning and changelogs
- Pricing-plan management
- Listing review submission
- Analytics and usage reporting

### Buyer experience

- Browse listings
- View agent detail pages
- Compare agents
- Test agents in a sandbox
- Subscribe to free or paid plans
- Manage installed/subscribed agents
- Rate and review agents
- Report abuse or security concerns

### Platform governance

- DID-backed agent identity
- Agent verification and attestation
- Publisher verification
- Listing approval workflow
- Lifecycle management
- Trust scoring
- Subscription and entitlement checks
- Audit logging
- Admin moderation
- Abuse reporting
- Tenant isolation

## Product modules

1. Identity and trust
2. Agent registry
3. Marketplace listings
4. Search and discovery
5. Pricing plans
6. Subscriptions
7. Entitlements
8. Reviews and ratings
9. Publisher console
10. Buyer console
11. Admin moderation
12. Billing integration layer
13. Audit and compliance
14. Lifecycle management
15. Sandbox / test drive
16. Analytics

## Suggested technology stack

Backend:

- Python
- FastAPI
- Pydantic
- SQLAlchemy
- Alembic
- PostgreSQL
- Redis for rate limiting, caching, and background jobs
- Pytest

Frontend:

- Next.js or React
- Tailwind CSS
- API-first marketplace and admin UI

Infrastructure:

- Docker
- Docker Compose
- GitHub Actions
- OpenTelemetry-compatible logs, metrics, and traces

## Repository structure

```text
app/                         Backend service
app/api/                     FastAPI routers
app/core/                    Config, security, auth, rate limiting
app/models/                  SQLAlchemy models
app/schemas/                 Pydantic schemas
app/services/                Business logic
app/workers/                 Background jobs
frontend/                    Marketplace UI, optional
schemas/json/                JSON Schemas
examples/                    Example agents, listings, subscriptions
docs/                        Architecture, API, marketplace, security docs
tests/                       Automated tests
alembic/                     Database migrations
.github/workflows/           CI/CD
```

## Minimum API surface

### Public endpoints

- `GET /health`
- `GET /ready`
- `GET /.well-known/agent-marketplace`
- `GET /v1/public/listings`
- `GET /v1/public/listings/{listing_id}`
- `GET /v1/public/agents/{agent_id}`
- `GET /v1/public/publishers/{publisher_id}`
- `GET /v1/discovery/search`
- `GET /v1/discovery/categories`
- `GET /v1/discovery/capabilities`
- `GET /v1/discovery/protocols`

### Authenticated endpoints

- `POST /v1/bootstrap`
- `GET /v1/organizations`
- `POST /v1/api-keys`
- `GET /v1/api-keys`
- `POST /v1/api-keys/{api_key_id}/revoke`
- `POST /v1/publishers`
- `GET /v1/publishers/me`
- `PATCH /v1/publishers/{publisher_id}`
- `POST /v1/agents`
- `GET /v1/agents`
- `GET /v1/agents/{agent_id}`
- `PATCH /v1/agents/{agent_id}`
- `POST /v1/listings`
- `GET /v1/listings`
- `GET /v1/listings/{listing_id}`
- `PATCH /v1/listings/{listing_id}`
- `POST /v1/listings/{listing_id}/submit-review`
- `POST /v1/listings/{listing_id}/publish`
- `POST /v1/listings/{listing_id}/suspend`
- `POST /v1/listings/{listing_id}/delist`
- `POST /v1/listings/{listing_id}/subscribe`
- `GET /v1/subscriptions`
- `GET /v1/entitlements`
- `POST /v1/entitlements/check`
- `POST /v1/reviews`
- `GET /v1/audit-events`

### Admin endpoints

- `GET /v1/admin/review-queue`
- `POST /v1/admin/listings/{listing_id}/approve`
- `POST /v1/admin/listings/{listing_id}/reject`
- `POST /v1/admin/listings/{listing_id}/request-changes`
- `POST /v1/admin/listings/{listing_id}/quarantine`
- `GET /v1/admin/abuse-reports`
- `POST /v1/admin/abuse-reports/{report_id}/resolve`

## Marketplace listing model

A listing should include:

- `listing_id`
- `agent_id`
- `publisher_id`
- `name`
- `short_description`
- `long_description`
- `categories`
- `tags`
- `capabilities`
- `screenshots`
- `demo_url`
- `documentation_url`
- `support_url`
- `privacy_url`
- `terms_url`
- `pricing_plans`
- `deployment_options`
- `protocols`
- `authentication_methods`
- `data_access_profile`
- `compliance_profile`
- `trust_score`
- `verification_status`
- `lifecycle_state`
- `published_at`
- `updated_at`

A JSON Schema for listings is available at:

```text
schemas/json/marketplace-listing.schema.json
```

## Agent model

Agents should include:

- `agent_id`
- `did`
- `did_document_url`
- `verification_methods`
- `publisher_id`
- `owner`
- `sponsor`
- `version`
- `endpoints`
- `protocol_bindings`
- `capabilities`
- `required_permissions`
- `data_access_profile`
- `risk_profile`
- `compliance_profile`
- `lifecycle_state`
- `verification_status`
- `audit_metadata`

## Lifecycle states

### Listing states

- `draft`
- `pending_review`
- `changes_requested`
- `approved`
- `published`
- `suspended`
- `quarantined`
- `deprecated`
- `delisted`
- `archived`
- `deleted`

### Agent states

- `draft`
- `pending_review`
- `approved`
- `active`
- `suspended`
- `quarantined`
- `deprecated`
- `pending_rotation`
- `pending_renewal`
- `deprovisioning`
- `deprovisioned`
- `archived`
- `deleted`

Every lifecycle transition must be validated and audited.

## Security principles

- No default production secrets
- No raw secret storage
- API keys must be hashed
- Tenant isolation must be tested
- Publisher, agent, listing, subscription, and entitlement changes must be audited
- Marketplace moderation actions must be audited
- Production OIDC/SAML must validate tokens and signed assertions
- Rate limiting must be distributed in production
- Agent verification must be repeatable and evidence-backed
- Audit events should be immutable or tamper-evident

## MVP milestone

The first working milestone should include:

- FastAPI backend
- PostgreSQL database support
- Alembic migrations
- organization bootstrap
- API key authentication
- publisher creation
- agent registration
- listing creation
- listing search
- listing detail
- listing review workflow
- publish/suspend/delist listing actions
- subscription creation
- entitlement check
- review creation
- audit events
- Dockerfile
- Docker Compose
- tests
- GitHub Actions CI

## Roadmap

### Phase 1 — Foundation

- Repository documentation
- JSON Schemas
- FastAPI app skeleton
- database models
- migrations
- health/readiness endpoints
- API key authentication
- tests and CI

### Phase 2 — Registry and listings

- publisher model
- agent model
- listing model
- public catalog
- search and filters
- lifecycle events
- audit events

### Phase 3 — Trust and governance

- DID verification
- publisher verification
- agent attestation
- listing review workflow
- admin moderation
- abuse reports
- trust score

### Phase 4 — Marketplace transactions

- pricing plans
- subscriptions
- entitlements
- entitlement check API
- billing provider adapter
- usage tracking

### Phase 5 — Enterprise readiness

- tenant policies
- private marketplace mode
- SSO/OIDC/SAML
- SCIM
- distributed rate limiting
- background workers
- observability
- production deployment guides

## Current status

This repository is at the initial marketplace-foundation stage.

Current files:

- `README.md`
- `docs/marketplace-blueprint.md`
- `schemas/json/marketplace-listing.schema.json`

Not production ready yet. Backend implementation, migrations, tests, CI/CD, security hardening, and deployment files still need to be added.

## Production-readiness target

The project is production-ready only when:

- app starts cleanly
- tests pass
- Docker build passes
- Docker Compose runs locally
- migrations are versioned and repeatable
- secrets are production-safe
- authentication and authorization are enforced
- tenant isolation is tested
- lifecycle transitions are enforced
- audit events are immutable or tamper-evident
- listing review workflow works
- publisher verification works
- agent verification works
- discovery/search works
- subscription and entitlement checks work
- observability is available
- security docs and license are present

## Related documentation

- [Marketplace Blueprint](docs/marketplace-blueprint.md)
- [Marketplace Listing JSON Schema](schemas/json/marketplace-listing.schema.json)
