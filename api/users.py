from fastapi import APIRouter, Depends
from fastapi.encoders import jsonable_encoder
from sqlalchemy.orm import Session

from api.deps import get_db, get_current_user
import models
import schemas
import crud

router = APIRouter(
    prefix="/users",
    tags=["Users"],
    dependencies=[Depends(get_current_user)]
)


@router.get("", response_model=schemas.UserOut)
def get_user(user: models.User = Depends(get_current_user)):
    user_data = jsonable_encoder(user)
    user_data['customerName'] = user.customer_name
    return schemas.UserOut(**user_data)


@router.put("")
def update_user(
        *,
        db: Session = Depends(get_db),
        current_user: schemas.UserUpdate = Depends(get_current_user),
        user_in: schemas.UserUpdate
):
    return crud.users.update(db, db_user=current_user, user_in=user_in)
