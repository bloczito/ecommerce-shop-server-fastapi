from fastapi import APIRouter, Depends, Body
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
from sqlalchemy.orm import Session

import crud
import schemas
from api.deps import get_current_user, get_db
from models import User, Order, OrderElement

router = APIRouter(
    prefix="/orders",
    tags=["Orders"],
    dependencies=[Depends(get_current_user)]
)


@router.get("")
def get_orders(user: User = Depends(get_current_user)):
    orders: list[Order] = user.orders

    results = []

    for o in orders:
        elements: list[OrderElement] = o.order_elements
        cart_elements = [schemas.CartElement(
            id=e.id,
            quantity=e.quantity,
            product=schemas.CartProduct(
                id=e.product.id,
                name=e.product.name,
                price=e.product.price,
                url=e.product.url,
                description=e.product.description,
                brand=e.product.brand.name,
            )
        ) for e in elements]

        order_data: dict = jsonable_encoder(o)
        order_data["orderNumber"] = o.order_number
        order_data["orderDate"] = str(o.order_date)
        order_data['items'] = cart_elements
        order_data['customerName'] = o.customer_name
        results.append(schemas.Order(**order_data))

    return results


@router.post("")
def create_order(
        db: Session = Depends(get_db),
        user: User = Depends(get_current_user),
        dto: schemas.OrderCreate = Body()
):
    order = crud.orders.create(db, user_id=user.id, dto=dto)
    return JSONResponse({'orderId': order.id, 'orderNumber': order.order_number}, status_code=201)
