from sqlalchemy.orm import Session
from sqlalchemy.testing.pickleable import User
from models.categories_model import Categories
from fastapi import HTTPException, Depends
from schemas.users import Users
def create_categories(forms, db, user):
    if user.role == "admin":
        for form in forms:
            create_category = db.query(Categories).filter(Categories.name == form.name).first()
            if create_category:
                raise HTTPException(400, "Bunday kategoriya avvaldan mavjud")
            new_item_db = Categories(
                name=form.name,
            )
            db.add(new_item_db)
            db.commit()
            db.refresh(new_item_db)
    else:
        raise HTTPException(400, "Sizga ruhsat berilmagan")

def get_all_categories(db):
    items = db.query(Categories).all()
    return items


def update_categories(forms, db, user):
    if user.role == "admin":
        for form in forms:
            category = db.query(Categories).filter(Categories.id == form.ident).first()
            if not category:
                raise HTTPException(status_code=400, detail="Berilgan IDga ega bo'lgan kategoriya topilmadi")
            db.query(Categories).filter(Categories.id == form.ident).update({
                Categories.name: form.name
                })
            db.commit()
    else:
        raise HTTPException(400, "Sizga ruhsat berilmagan")


def delete_categories(ident, db, user):
    if user.role == "admin":
        category = db.query(Categories).filter(Categories.id == ident).first()
        if not category:
            raise HTTPException(status_code=400, detail="Berilgan IDga ega bo'lgan kategoriya topilmadi")
        db.query(Categories).filter(Categories.id == ident).delete()
        db.commit()
    else:
        raise HTTPException(400, "Sizga ruhsat berilmagan")

