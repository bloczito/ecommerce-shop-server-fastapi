from fastapi import APIRouter, Request, Depends, Body, Query, HTTPException
from fastapi.responses import RedirectResponse, JSONResponse
from sqlalchemy.orm import Session
from authlib.integrations.starlette_client import OAuth, StarletteOAuth2App
from oauthlib.oauth2 import OAuth2Token
from os import getenv

import crud
from api.deps import get_db
from misc.utils import get_external_username
from core import security, settings
from schemas import OAuthType, UserCreate, UserSignIn
from enums import AccountType

oauth = OAuth()
oauth.register(
    name='google',
    server_metadata_url='https://accounts.google.com/.well-known/openid-configuration',
    client_id=getenv('GOOGLE_CLIENT_ID'),
    client_secret=getenv('GOOGLE_CLIENT_SECRET'),
    client_kwargs={
        'scope': 'openid email profile'
        # 'scope': 'user:email'
    }
)

oauth.register(
    name='github',
    client_id=getenv('GITHUB_CLIENT_ID'),
    client_secret=getenv('GITHUB_CLIENT_SECRET'),
    access_token_url='https://github.com/login/oauth/access_token',
    authorize_url='https://github.com/login/oauth/authorize',
    client_kwargs={
        'scope': 'user'
    }
)

router = APIRouter(tags=['Security'])


@router.route('/login')
async def login_via_google(request: Request):
    google: StarletteOAuth2App = oauth.create_client('google')
    redirect_uri = request.url_for('authorize_google')
    return await google.authorize_redirect(request, redirect_uri)


@router.get('/login/{oauth_type}')
async def login_oauth(request: Request, oauth_type: OAuthType):
    client: StarletteOAuth2App = oauth.create_client('google' if oauth_type == OAuthType.GOOGLE else 'github')
    redirect_uri = request.url_for('authorize_google' if oauth_type == OAuthType.GOOGLE else 'authorize_github')
    return await client.authorize_redirect(request, redirect_uri)


@router.get('/authenticated/google', response_class=RedirectResponse)
async def authorize_google(request: Request, db: Session = Depends(get_db)):
    google: StarletteOAuth2App = oauth.create_client('google')
    token: OAuth2Token = await google.authorize_access_token(request)
    user_info: dict = token.get('userinfo')
    user = crud.users.get(db, username=get_external_username(user_info.get('sub'), AccountType.GOOGLE))

    if not user:
        user = crud.users.create_oauth(
            db,
            external_id=user_info.get('sub'),
            email=user_info.get('email'),
            customer_name=user_info.get('name'),
            account_type=OAuthType.GOOGLE
        )

    jwt = security.create_token(user.username)
    return f'{settings.CLIENT_URL}?token={jwt}'


@router.get('/authenticated/github')
async def authorize_github(request: Request):
    github: StarletteOAuth2App = oauth.create_client('github')
    token: OAuth2Token = await github.authorize_access_token(request)

    return JSONResponse(dict(**token))


@router.post('/sign_up')
def sign_up(db: Session = Depends(get_db), user: UserCreate = Body()):
    return crud.users.create_default(db, new_user=user)


@router.post('/sign_in')
def sign_id(db: Session = Depends(get_db), user: UserSignIn = Body()):
    user = crud.users.authenticate(db, email=user.email, password=user.password)
    if not user:
        raise HTTPException(status_code=404, detail='User not found')

    return security.create_token(user.username)


@router.get('/is_email_available')
def is_email_available(db: Session = Depends(get_db), email: str = Query()):
    return crud.users.get(db, username=email) is None
