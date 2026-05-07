from __future__ import annotations

import os
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parents[1]


class Settings:
    def __init__(self) -> None:
        self.service_name = os.getenv("SERVICE_NAME", "agent-marketplace")
        self.app_version = os.getenv("APP_VERSION", "0.1.0")
        self.environment = os.getenv("APP_ENV", "development")
        self.database_url = os.getenv("DATABASE_URL", f"sqlite:///{ROOT_DIR / 'data' / 'agent_marketplace.db'}")
        self.api_key_pepper = os.getenv("API_KEY_PEPPER", "dev-only-pepper")
        self.rate_limit_requests = int(os.getenv("RATE_LIMIT_REQUESTS", "120"))
        self.rate_limit_window_seconds = int(os.getenv("RATE_LIMIT_WINDOW_SECONDS", "60"))
        self.root_dir = ROOT_DIR

    def validate_for_runtime(self) -> None:
        if self.environment.lower() == "production":
            if self.api_key_pepper in {"", "dev-only-pepper"}:
                raise RuntimeError("API_KEY_PEPPER must be set to a strong secret in production")
            if self.database_url.startswith("sqlite"):
                raise RuntimeError("SQLite is not allowed for production")


settings = Settings()
