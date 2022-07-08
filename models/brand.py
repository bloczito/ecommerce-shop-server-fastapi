from typing import TYPE_CHECKING
from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship

from db.session import Base

if TYPE_CHECKING:
    from .product import Product  # noqa: F401


class Brand(Base):
    __tablename__ = "brands"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    name = Column(String, index=True)
    products = relationship("Product", back_populates="brand")

    def __repr__(self):
        return f"<Brand(name='{self.name}')>"

    def __str__(self):
        return self.name
