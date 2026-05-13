-- SurrealDB schema for the Agent Marketplace starter catalog

DEFINE TABLE IF NOT EXISTS agent SCHEMAFULL;

DEFINE FIELD canonical_id ON TABLE agent TYPE string ASSERT string::starts_with($value, 'did:');
DEFINE FIELD did ON TABLE agent TYPE string ASSERT string::starts_with($value, 'did:');
DEFINE FIELD agent_id ON TABLE agent TYPE string;
DEFINE FIELD publisher_id ON TABLE agent TYPE string;
DEFINE FIELD publisher_did ON TABLE agent TYPE string ASSERT string::starts_with($value, 'did:');
DEFINE FIELD name ON TABLE agent TYPE string;
DEFINE FIELD source_repository ON TABLE agent TYPE string;
DEFINE FIELD short_description ON TABLE agent TYPE string;
DEFINE FIELD categories ON TABLE agent TYPE array<string>;
DEFINE FIELD capabilities ON TABLE agent TYPE array<string>;
DEFINE FIELD verification_status ON TABLE agent TYPE string;
DEFINE FIELD lifecycle_state ON TABLE agent TYPE string;
DEFINE FIELD created_at ON TABLE agent TYPE datetime DEFAULT time::now();
DEFINE FIELD updated_at ON TABLE agent TYPE datetime DEFAULT time::now();

DEFINE INDEX IF NOT EXISTS agent_canonical_id_unique ON TABLE agent COLUMNS canonical_id UNIQUE;
DEFINE INDEX IF NOT EXISTS agent_did_unique ON TABLE agent COLUMNS did UNIQUE;
DEFINE INDEX IF NOT EXISTS agent_name_search ON TABLE agent COLUMNS name SEARCH ANALYZER ascii BM25;
DEFINE INDEX IF NOT EXISTS agent_description_search ON TABLE agent COLUMNS short_description SEARCH ANALYZER ascii BM25;
DEFINE INDEX IF NOT EXISTS agent_publisher_idx ON TABLE agent COLUMNS publisher_id;
DEFINE INDEX IF NOT EXISTS agent_verification_idx ON TABLE agent COLUMNS verification_status;
DEFINE INDEX IF NOT EXISTS agent_lifecycle_idx ON TABLE agent COLUMNS lifecycle_state;
