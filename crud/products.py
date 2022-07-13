from sqlalchemy.sql.expression import func
from sqlalchemy.orm import Session
from typing import Optional

from models import Product
from enums import Category, Subcategory


class ProductsCRUD:
    def get_random(self, db: Session) -> list[Product]:
        return db.query(Product).order_by(func.random()).limit(20).all()

    def get(
            self,
            db,
            *,
            category: Category | None = None,
            subcategory: Subcategory | None = None,
            random: bool = False
    ) -> list[Product]:

        if random:
            return db.query(Product).order_by(func.random()).limit(20).all()
        else:
            queries = []

            if category:
                queries.append(Product.category == category)

            if subcategory:
                queries.append(Product.subcategory == subcategory)

            return db.query(Product).filter(*queries).all()

    def get_by_id(self, db: Session, id: int) -> Optional[Product]:
        return db.query(Product).where(Product.id == id).first()


products = ProductsCRUD()
