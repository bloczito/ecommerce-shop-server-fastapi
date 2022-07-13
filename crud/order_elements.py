from sqlalchemy.orm import Session

from schemas import CartElementCreate
from models import OrderElement


class OrderElementsCRUD:
    def create(self, db: Session, *, order_id: int, dto: CartElementCreate):
        element = OrderElement(
            quantity=dto.quantity,
            order_id=order_id,
            product_id=dto.product_id
        )

        db.add(element)
        db.commit()
        db.refresh(element)

        return element


order_elements = OrderElementsCRUD()
