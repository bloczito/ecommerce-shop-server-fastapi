from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from enums import Category, Subcategory
from api.deps import get_db
import models
import schemas
import crud

router = APIRouter(
    prefix="/products",
    tags=["Products"],
)


@router.get("")
def get_products(
        db: Session = Depends(get_db),
        category: Category | None = None,
        subcategory: Subcategory | None = None,
        random: bool = False,
) -> list[models.Product]:
    return crud.products.get(db, category=category, subcategory=subcategory, random=random)


@router.get("/{id}")
def get_by_id(id: int):
    return schemas.Subcategory(name="asd", title="qwe")
    # return schemas.Subcategory(name=f'Name - {id}', title='Title')
