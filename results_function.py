from Universal_funksyalar import user_id
from models.results_model import Result
from sqlalchemy.orm import Session
from models.answers_model import Answers
from Universal_funksyalar.update_db import post_put_db
from models.users_model import Users
from models.final_result_model import Final_Result
def create_result(forms, db, user):
    hamma_savollar= 0
    n_javoblar = 0
    t_javoblar = 0

    for form in forms:
        new_item_db = Result(
            question_id=form.question_id,
            category_id=form.category_id,
            answer_id=form.answer_id,
            user_id=user.id
        )
        db.add(new_item_db)
        db.commit()
        db.refresh(new_item_db)


        hamma_savollar += 1
        answer = post_put_db(db, Answers, form.answer_id)
        if answer.t_javob:
            t_javoblar += 1
        else:
            n_javoblar += 1

    foiz = t_javoblar / hamma_savollar * 100




    final_results = Final_Result(
        hamma_savollar=hamma_savollar,
        t_javoblar=t_javoblar,
        foiz=foiz,
        user_id=user.id
    )

    db.add(final_results)
    db.commit()
    db.refresh(final_results)


    return f"umumiy: {hamma_savollar}, topildi: {t_javoblar}, foizda: {foiz}"

def get_result(ident, db):
    if ident > 0:
        items = db.query(Result).filter(Result.id == ident).first()
    else:
        items = db.query(Result).all()
    return items


def update_result(forms, db, user):
    for form in forms:
        db.query(Result).filter(Result.id == user.id).update({
            Result.question_id: form.question_id,
            Result.category_id: form.category_id,
            Result.answer_id: form.answer_id
            })
    db.commit()


def delete_result(db, user):
    if user.role in ["admin", "user"]:
        db.query(Result).filter(Result.id == user.id).delete()
    db.commit()



