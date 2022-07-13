from sqlalchemy.orm import Session
from datetime import datetime

from schemas import OrderCreate
from models import Order
from crud import order_elements as order_elements_service


def create_order_number(db: Session):
    now = datetime.today()

    start_of_month = now.replace(day=1, hour=0, minute=0, second=0, microsecond=0)
    count = db.query(Order).where(Order.order_date >= start_of_month, Order.order_date <= now).count()
    return f'{now.year}{now.month}{str(count).zfill(4)}'


class OrdersCRUD:
    def create(self, db: Session, *, user_id: int, dto: OrderCreate):
        order = Order(
            customer_name=dto.customer_name,
            email=dto.email,
            order_number=create_order_number(db),
            city=dto.city,
            street=dto.street,
            postcode=dto.postcode,
            user_id=user_id
        )

        db.add(order)
        db.commit()
        db.refresh(order)

        for element in dto.items:
            order_elements_service.create(db, order_id=order.id, dto=element)

        return order


orders = OrdersCRUD()
