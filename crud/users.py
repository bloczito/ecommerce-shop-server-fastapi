from sqlalchemy.orm import Session
from fastapi.encoders import jsonable_encoder

import schemas
from models import User
from enums import AccountType
from misc.utils import get_external_username
from core import security


class UsersCRUD:
    def get(self, db: Session, *, id: int | None = None, username: str | None = None) -> User | None:
        filters = [] * 2

        if id:
            filters.append(User.id == id)

        if username:
            filters.append(User.username == username)

        return db.query(User).filter(*filters).first()

    def create_oauth(
            self,
            db: Session,
            *,
            external_id: str,
            email: str,
            customer_name: str | None = None,
            account_type: AccountType
    ) -> User:
        user = User(
            username=get_external_username(external_id, account_type),
            email=email,
            customer_name=customer_name,
            account_type=account_type
        )

        db.add(user)
        db.commit()
        db.refresh(user)
        return user

    def create_default(self, db: Session, *, new_user: schemas.UserCreate) -> User:
        user = User(
            username=new_user.email,
            password=security.hash_password(new_user.password),
            customer_name=new_user.name,
            email=new_user.email,
            city=new_user.city,
            street=new_user.street,
            postcode=new_user.postcode,
            account_type=AccountType.DEFAULT
        )

        db.add(user)
        db.commit()
        db.refresh(user)
        return user

    def authenticate(self, db: Session, *, email: str, password: str) -> User | None:
        user = self.get(db, username=email)
        if not user:
            return None
        if not security.verify_password(password, user.password):
            return None
        return user

    def update(
            self,
            db: Session,
            *,
            db_user: User,
            user_in: schemas.UserUpdate,
    ) -> User:
        update_data = user_in.dict(exclude_unset=True)
        db_data = jsonable_encoder(db_user)

        for field in db_data:
            if field in update_data:
                setattr(db_user, field, update_data[field])

        db.add(db_user)
        db.commit()
        db.refresh(db_user)
        return db_user


users = UsersCRUD()
