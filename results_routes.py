from typing import List
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session, joinedload
from models.results_model import Result
from db import database
from functions.results_function import create_result, delete_result, update_result
from routes.login import get_current_active_user
from schemas.results_schema import create_myresult,update_myresult
from schemas.users import CreateUser

router_result = APIRouter(
    prefix="/result",
    tags=["Result operations"]
)

@router_result.post('/create')
def create(forms: List[create_myresult], db: Session = Depends(database),
        current_user: CreateUser = Depends(get_current_active_user)):
    create_result(forms, db, current_user, current_user)
    raise HTTPException(200, "amaliyot muvaffaqiyatli yakunlandi!")

@router_result.get('/get')
def get(db: Session = Depends(database),
        current_user: CreateUser = Depends(get_current_active_user)):
    result = db.query(Result).all()
    return result


@router_result.put('/update')
def update(form: List[update_myresult], db: Session = Depends(database),
        current_user: CreateUser = Depends(get_current_active_user)):
    update_result(form, db, current_user)
    raise HTTPException(200, "Amaliyot muvaffaqiyatl bajaridi")

@router_result.delete('/delete')
def delete(ident, db: Session = Depends(database),
        current_user: CreateUser = Depends(get_current_active_user)):
    delete_result(ident, db, current_user)
    raise HTTPException(status_code=200, detail="Amaliyot muvafaqqiyatli amalga oshirildi")
