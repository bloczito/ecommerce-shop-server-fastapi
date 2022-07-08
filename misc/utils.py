from enums import Category, Subcategory, AccountType


def get_subcategories(category: Category) -> list[Subcategory]:
    match category:
        case Category.SWEATSHIRTS:
            return [Subcategory.HOODIE, Subcategory.CRAWNECK]
        case Category.T_SHIRTS:
            return [Subcategory.T_SHIRT, Subcategory.LONG_SLEEVE, Subcategory.POLO]
        case Category.TROUSERS:
            return [Subcategory.CHINOS, Subcategory.JEANS, Subcategory.ELEGANT]
        case Category.ACCESSORIES:
            return [Subcategory.HATS, Subcategory.WATCHES, Subcategory.STRIPES, Subcategory.BACKPACKS]
        case _:
            return []


def get_category_label(category: Category) -> str:
    match category:
        case Category.T_SHIRTS:
            return "Koszulki"
        case Category.SWEATSHIRTS:
            return "Bluzy"
        case Category.TROUSERS:
            return "Spodnie"
        case Category.ACCESSORIES:
            return "Akcesoria"
        case _:
            return "Błąd"


def get_subcategory_label(subcategory: Subcategory) -> str:
    match subcategory:
        case Subcategory.HOODIE:
            return "Hoodie"
        case Subcategory.CRAWNECK:
            return "Bez kaptura"
        case Subcategory.T_SHIRT:
            return "Z krótkim rękawem"
        case Subcategory.LONG_SLEEVE:
            return "Z długim rękawem"
        case Subcategory.POLO:
            return "Polo"
        case Subcategory.CHINOS:
            return "Chinosy"
        case Subcategory.JEANS:
            return "Jeansy"
        case Subcategory.ELEGANT:
            return "Eleganckie"
        case Subcategory.HATS:
            return "Czapki i kapelusze"
        case Subcategory.WATCHES:
            return "Zegarki"
        case Subcategory.STRIPES:
            return "Paski"
        case Subcategory.BACKPACKS:
            return "Plecaki"
        case _:
            return "Błąd"


def get_external_username(external_id: str, account_type: AccountType):
    return f'{account_type.value}-{external_id}'
