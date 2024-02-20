from routes.login import get_password_hash
from models.users_model import Users
from Universal_funksyalar import update_db
from fastapi import HTTPException
def get_users(db, user):
    if user.role in ["admin"]:
        return db.query(Users).all()


def create_user_f(form, db, user):
    create_db = Users(
        name=form.name,
        username=form.username,
        password=get_password_hash(form.password),
        role=form.role,
        token="Nuriddin")
    db.add(create_db)
    db.commit()
    db.refresh(create_db)



def update_user_f(form, db, user):
    if user.role in ["admin", "user"]:
        db.query(Users).filter(Users.id == form.id).update({
            Users.name: form.name,
            Users.username: form.username,
            Users.password: get_password_hash(form.password),
        })
    else:
        raise HTTPException(400, "Sizga ruhsat berilmagan")
    db.commit()

def delete_user(db, user):
    db.query(Users).filter(Users.id == user.id).delete()
    db.commit()
    return {"message": "Ma'lumotlaringiz o'chirildi"}