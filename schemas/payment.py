from pydantic import BaseModel


class PaymentCreate(BaseModel):
    amount: float
