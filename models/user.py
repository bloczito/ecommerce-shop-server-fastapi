from sqlalchemy import Column, Integer, String, Enum as SqlEnum
from sqlalchemy.orm import relationship

from db.session import Base
from enums import AccountType


class User(Base):
    __tablename__ = 'users'

    id = Column(Integer, primary_key=True, autoincrement=True, index=True)

    username = Column(String, nullable=False, unique=True)
    password = Column(String, nullable=True)

    customer_name = Column(String, nullable=True)
    email = Column(String, nullable=True)
    city = Column(String, nullable=True)
    street = Column(String, nullable=True)
    postcode = Column(String, nullable=True)

    account_type = Column(SqlEnum(AccountType), nullable=False)

    orders = relationship('Order', back_populates='user')
