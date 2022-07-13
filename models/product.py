from typing import TYPE_CHECKING
from db.session import Base
from sqlalchemy import Column, Integer, String, Float, Enum as SqlEnum, ForeignKey
from sqlalchemy.orm import relationship

from enums import Category, Subcategory

if TYPE_CHECKING:
    from .brand import Brand  # noqa: F401


class Product(Base):
    __tablename__ = 'products'

    id = Column(Integer, primary_key=True, autoincrement=True, index=True)
    name = Column(String, nullable=False)

    description = Column(String, nullable=True)
    price = Column(Float, nullable=False)
    url = Column(String, nullable=False)

    category = Column(SqlEnum(Category), nullable=False)
    subcategory = Column(SqlEnum(Subcategory), nullable=False)

    brand_id = Column(Integer, ForeignKey('brands.id'), nullable=False)
    brand = relationship('Brand', back_populates='products')

    order_elements = relationship('OrderElement', back_populates='product')