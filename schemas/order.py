from pydantic import BaseModel, Field, EmailStr
from datetime import datetime
from humps.camel import case

from schemas import Category, Subcategory


class CartProduct(BaseModel):
    id: int
    name: str
    price: float
    url: str
    description: str | None = None
    brand: str

    # category: Category
    # subcategory: Subcategory

    class Config:
        orm_mode = True


class CartElement(BaseModel):
    id: int
    quantity: int
    product: CartProduct

    class Config:
        orm_mode = True


class Order(BaseModel):
    id: int
    customer_name: str
    email: str
    order_number: str
    order_date: datetime
    city: str
    street: str
    postcode: str
    items: list[CartElement]

    class Config:
        orm_mode = True
        alias_generator = case


class CartElementCreate(BaseModel):
    product_id: int
    quantity: int

    class Config:
        orm_mode = True
        alias_generator = case


class OrderCreate(BaseModel):
    customer_name: str
    email: EmailStr

    city: str
    street: str
    postcode: str

    items: list[CartElementCreate]

    class Config:
        orm_mode = True
        alias_generator = case
