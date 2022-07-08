from fastapi import APIRouter

from enums import Category as CategoryModel
from schemas import Category as CategoryS, Subcategory as SubcategoryS
from misc import utils

router = APIRouter(
    prefix="/categories",
    tags=["Categories"]
)


@router.get("")
def get_categories():

    categories: list[CategoryModel] = [c for c in CategoryModel]
    results: list[CategoryS] = []

    for c in categories:
        results.append(
            CategoryS(
                name=str(c.value),
                title=utils.get_category_label(c),
                subcategories=[
                    SubcategoryS(
                        name=str(s.value),
                        title=utils.get_subcategory_label(s)
                    ) for s in utils.get_subcategories(c)
                ]
            )
        )

    return results
