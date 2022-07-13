from fastapi.responses import JSONResponse
from fastapi import APIRouter, Body
from os import getenv
import stripe

from schemas import PaymentCreate

router = APIRouter(
    prefix='/payments',
    tags=['Payments'],
)

stripe.api_key = getenv('STRIPE_SECRET_KEY')


@router.post('')
def create_payment(dto: PaymentCreate = Body()):
    try:
        payment = stripe.PaymentIntent.create(
            amount=int(dto.amount * 100),
            currency='pln',
            automatic_payment_methods={
                'enabled': True
            }
        )

        return {'clientSecret': payment['client_secret']}

    except Exception as e:
        print(e)
        return JSONResponse("Cannot process payment", status_code=500)
