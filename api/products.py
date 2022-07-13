from fastapi import APIRouter, Depends, Path
from fastapi.encoders import jsonable_encoder
from sqlalchemy.orm import Session

from enums import Category, Subcategory
from api.deps import get_db
import models
import schemas
import crud

router = APIRouter(
    prefix='/products',
    tags=['Products'],
)


@router.get('')
def get_products(
        db: Session = Depends(get_db),
        category: Category | None = None,
        subcategory: Subcategory | None = None,
        random: bool = False,
) -> list[models.Product]:
    return crud.products.get(db, category=category, subcategory=subcategory, random=random)


@router.get('/{id}')
def get_by_id(db: Session = Depends(get_db), id: int = Path(ge=0)):
    product: models.Product = crud.products.get_by_id(db, id)
    products_data = jsonable_encoder(product)
    products_data['brand'] = {'id': product.brand.id, 'name': product.brand.name}
    return schemas.Product(**products_data)
