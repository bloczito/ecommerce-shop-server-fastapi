from sqlalchemy import Column, Integer, ForeignKey
from sqlalchemy.orm import relationship

from db.session import Base


class OrderElement(Base):
    __tablename__ = 'order_elements'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)

    quantity = Column(Integer, nullable=False)

    order_id = Column(Integer, ForeignKey('orders.id'), nullable=False)
    order = relationship('Order', back_populates='order_elements')

    product_id = Column(Integer, ForeignKey('products.id'), nullable=False)
    product = relationship('Product', back_populates='order_elements')
