from pydantic import BaseModel


class Subcategory(BaseModel):
    name: str
    title: str
