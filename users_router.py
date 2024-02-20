from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from fastapi.security import OAuth2PasswordBearer
from functions.login_function import get_current_active_user
from functions.users_funksya import get_users, create_user_f, update_user_f, delete_user
from schemas.users import CreateUser, UpdateUser
from db import database
from models.users_model import Users
users_router = APIRouter(
    prefix="/users",
    tags=["Users operation"]
)

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

async def get_current_user(token: str = Depends(oauth2_scheme)):
    credentials_exception = HTTPException(
        status_code=401,
        detail="Invalid credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )


@users_router.post('/create')
def create_user(form: CreateUser, db: Session = Depends(database)):
    create_user_f(form, db)
    raise HTTPException(status_code=201, detail="User created successfully")

@users_router.get('/get')
def get(db: Session = Depends(database),
                current_user: Users = Depends(get_current_active_user)):
    users = db.query(Users).filter(Users.role.in_(["admin"])).all()
    return users


@users_router.get('/get own')
def get(current_user: Users = Depends(get_current_active_user)):
    return current_user


@users_router.put("/update")
def update_user(form: UpdateUser, db: Session = Depends(database),
                current_user: Users = Depends(get_current_active_user)):
    update_user_f(form, db, current_user)
    raise HTTPException(status_code=200, detail="User updated successfully")


@users_router.delete("/delete")
def delete_user(ident, db: Session = Depends(database),
    current_user: Users = Depends(get_current_active_user)):
    if current_user.role == "admin":
        delete_user(ident, db, current_user)
        raise HTTPException(200, "O'chirish muvaffaqiyatli amalga oshirildi!")
    else:
        raise HTTPException(status_code=400, detail="Sizga ruhsat berilmagan")