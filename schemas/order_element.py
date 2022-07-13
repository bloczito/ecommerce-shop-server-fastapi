from pydantic import BaseModel

class OrderElement(BaseModel):
    id: int
    quantity: int
    product: 