from fastapi import Depends, HTTPException, Header, status
from typing import Generator
from pydantic import ValidationError
from sqlalchemy.orm import Session
from jose import jwt

from db.session import SessionLocal
from models.user import User
from core import security, settings
from schemas import TokenPayload
import crud


def get_db() -> Generator:
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


def get_current_user(db: Session = Depends(get_db), authorization: str = Header()) -> User:
    try:
        payload = jwt.decode(authorization[7:], settings.SECRET_KEY, algorithms=[security.ALGORITHM])
        token_data = TokenPayload(**payload)
    except (jwt.JWTError, ValidationError) as e:
        print(e)
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Could not validate credentials",
        )
    user = crud.users.get(db, id=4)

    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    return user
