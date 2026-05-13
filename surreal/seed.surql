-- Seed data for starter agent catalog

UPSERT agent:docker-cagent CONTENT {
  canonical_id: 'did:web:agents.agennext.dev:docker-cagent-runtime',
  did: 'did:web:agents.agennext.dev:docker-cagent-runtime',
  agent_id: 'agent_docker_cagent_001',
  publisher_id: 'publisher_docker',
  publisher_did: 'did:web:docker.com',
  name: 'Docker Agent Runtime',
  source_repository: 'https://github.com/docker/cagent',
  short_description: 'Multi-agent runtime for building, sharing, and running specialized agent teams using Docker Agent/cagent.',
  categories: ['runtime','multi-agent','developer-tools'],
  capabilities: ['agent_team_orchestration','mcp_tooling','oci_agent_packaging','terminal_runtime'],
  verification_status: 'source_verified',
  lifecycle_state: 'active'
};

UPSERT agent:google-adk CONTENT {
  canonical_id: 'did:web:agents.agennext.dev:google-adk-agent',
  did: 'did:web:agents.agennext.dev:google-adk-agent',
  agent_id: 'agent_google_adk_001',
  publisher_id: 'publisher_google',
  publisher_did: 'did:web:google.com',
  name: 'Google ADK Agent',
  source_repository: 'https://github.com/google/adk-python',
  short_description: 'Production-grade agent built using Google ADK.',
  categories: ['framework','agent-development'],
  capabilities: ['tool_calling','session_management','evaluation','deployment'],
  verification_status: 'source_verified',
  lifecycle_state: 'active'
};

UPSERT agent:langgraph CONTENT {
  canonical_id: 'did:web:agents.agennext.dev:langgraph-workflow-agent',
  did: 'did:web:agents.agennext.dev:langgraph-workflow-agent',
  agent_id: 'agent_langgraph_001',
  publisher_id: 'publisher_langchain',
  publisher_did: 'did:web:langchain.com',
  name: 'LangGraph Workflow Agent',
  source_repository: 'https://github.com/langchain-ai/langgraph',
  short_description: 'Stateful, durable workflow agent built on LangGraph.',
  categories: ['workflow','stateful-agents'],
  capabilities: ['checkpointing','human_in_the_loop','graph_execution'],
  verification_status: 'source_verified',
  lifecycle_state: 'active'
};

UPSERT agent:crewai CONTENT {
  canonical_id: 'did:web:agents.agennext.dev:crewai-research-crew',
  did: 'did:web:agents.agennext.dev:crewai-research-crew',
  agent_id: 'agent_crewai_research_001',
  publisher_id: 'publisher_crewai',
  publisher_did: 'did:web:crewai.com',
  name: 'CrewAI Research Crew',
  source_repository: 'https://github.com/crewAIInc/crewAI',
  short_description: 'Collaborative research team based on CrewAI.',
  categories: ['research','multi-agent'],
  capabilities: ['web_research','analysis','report_generation'],
  verification_status: 'source_verified',
  lifecycle_state: 'active'
};

UPSERT agent:microsoft-autogen CONTENT {
  canonical_id: 'did:web:agents.agennext.dev:microsoft-autogen-coordinator',
  did: 'did:web:agents.agennext.dev:microsoft-autogen-coordinator',
  agent_id: 'agent_microsoft_autogen_001',
  publisher_id: 'publisher_microsoft',
  publisher_did: 'did:web:microsoft.com',
  name: 'AutoGen Coordinator',
  source_repository: 'https://github.com/microsoft/autogen',
  short_description: 'Multi-agent orchestration based on Microsoft AutoGen.',
  categories: ['orchestration','multi-agent'],
  capabilities: ['agent_coordination','tool_use','workflow_execution'],
  verification_status: 'source_verified',
  lifecycle_state: 'active'
};
