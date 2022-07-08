from pydantic import BaseModel, EmailStr, Field
from humps.camel import case


class UserCreate(BaseModel):
    email: EmailStr
    password: str
    name: str | None = None
    street: str | None = None
    postcode: str | None = None
    city: str | None = None


class UserSignIn(BaseModel):
    email: EmailStr
    password: str


class UserOut(BaseModel):
    id: int

    customer_name: str | None = Field(None, alias="customerName")

    email: EmailStr | None = None
    city: str | None = None
    street: str | None = None
    postcode: str | None = None

    class Config:
        orm_mode = True
        # alias_generator = case


class UserUpdate(BaseModel):
    customer_name: str | None = None
    city: str | None = None
    street: str | None = None
    postcode: str | None = None

    class Config:
        orm_mode = True
        alias_generator = case
