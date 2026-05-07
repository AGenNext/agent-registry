from __future__ import annotations

from collections.abc import Generator
from pathlib import Path

from sqlalchemy import create_engine
from sqlalchemy.orm import DeclarativeBase, Session, sessionmaker

from app.config import settings


class Base(DeclarativeBase):
    pass


engine = None
SessionLocal = None


def init_database(database_url: str | None = None):
    global engine, SessionLocal
    resolved = database_url or settings.database_url
    connect_args = {}
    if resolved.startswith("sqlite:///"):
        db_file = Path(resolved.replace("sqlite:///", "", 1))
        db_file.parent.mkdir(parents=True, exist_ok=True)
        connect_args = {"check_same_thread": False}
    engine = create_engine(resolved, future=True, connect_args=connect_args)
    SessionLocal = sessionmaker(bind=engine, autoflush=False, autocommit=False, future=True)
    return engine


def create_schema() -> None:
    import app.models  # noqa: F401
    if engine is None:
        init_database()
    Base.metadata.create_all(bind=engine)


def get_db() -> Generator[Session, None, None]:
    if SessionLocal is None:
        init_database()
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


init_database()
