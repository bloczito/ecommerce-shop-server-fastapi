from os import getenv
from typing import Generator

from fastapi import Depends, HTTPException, Header, status
from jose import jwt
from pydantic import ValidationError
from sqlalchemy.orm import Session

import crud
from core import security
from db.session import SessionLocal
from models.user import User
from schemas import TokenPayload

SECRET_KEY = getenv('SECRET_KEY')


def get_db() -> Generator:
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


def get_current_user(db: Session = Depends(get_db), authorization: str = Header()) -> User:
    if db is None:
        print('db is None')
    try:
        payload = jwt.decode(authorization[7:], SECRET_KEY, algorithms=[security.ALGORITHM])
        token_data = TokenPayload(**payload)
    except (jwt.JWTError, ValidationError) as e:
        print(e)
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail='Could not validate credentials',
        )
    user = crud.users.get(db, id=4)

    if not user:
        raise HTTPException(status_code=404, detail='User not found')

    return user
