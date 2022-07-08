from pydantic import BaseModel

from .subcategory import Subcategory


class Category(BaseModel):
    name: str
    title: str
    subcategories: list[Subcategory]
