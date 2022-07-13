from pydantic import BaseModel, AnyHttpUrl

from enums import Category, Subcategory


class Brand(BaseModel):
    id: int
    name: str


class Product(BaseModel):
    id: int
    name: str
    price: float
    url: AnyHttpUrl
    description: str | None = None
    brand: Brand
    category: Category
    subcategory: Subcategory
