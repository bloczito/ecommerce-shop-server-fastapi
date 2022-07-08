from fastapi import APIRouter, Depends

import schemas
from api.deps import get_current_user
from models.user import User


router = APIRouter(
    prefix="/orders",
    tags=["Orders"],
)

router.get("")
def get_orders(user: User = Depends(get_current_user)):
    return user.orders

