from sqlalchemy import Column, Integer, String, ForeignKey, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func

from db.session import Base


class Order(Base):
    __tablename__ = 'orders'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)

    customer_name = Column(String, nullable=False)
    email = Column(String, nullable=False)

    order_number = Column(String, nullable=False)
    order_date = Column(DateTime, nullable=False, default=func.now())

    city = Column(String, nullable=False)
    street = Column(String, nullable=False)
    postcode = Column(String, nullable=False)

    user_id = Column(Integer, ForeignKey('users.id'), nullable=False)
    user = relationship('User', back_populates='orders')

    order_elements = relationship('OrderElement', back_populates='order')
