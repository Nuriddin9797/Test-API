from models.answers_model import Answers
from fastapi import HTTPException
from models.users_model import Users


def create_answer(forms, db):
    if Users.role in ["admin", "user"]:

        for form in forms:
            answers = db.query(Answers).filter(Answers.answer == form.answer).first()
            if answers:
                raise HTTPException(400, "Xatolik!")
            new_item_db = Answers(

                answer=form.answer,
                t_javob=form.t_javob,
                question_id=form.question_id
            )
            db.add(new_item_db)
            db.commit()
            db.refresh(new_item_db)


def update_answer(forms, db):
    if Users.role in ["admin", "user"]:

        for form in forms:
            updatequestion = db.query(Answers).filter(Answers.id == form.ident).first()
            if updatequestion is None:
                raise HTTPException(400, "id bo'yicha ma'lumot topilmadi")
            db.query(Answers).filter(Answers.id == form.ident).update({
                Answers.answer: form.answer,
                Answers.question_id: form.question_id
            })
        db.commit()


def delete_answer(ident, db):
    if Users.role in ["admin", "user"]:
        db.query(Answers).filter(Answers.id == ident.id).delete()
        db.commit()