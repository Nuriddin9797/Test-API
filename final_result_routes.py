from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session, joinedload

from Universal_funksyalar.update_db import post_put_db
from db import database
from models.answers_model import Answers
from models.results_model import Result
from routes.login import get_current_active_user
from schemas.users import CreateUser
from models.final_result_model import Final_Result

routes_final_result = APIRouter(
    prefix="/final_result",
    tags=["Final_result operations"]
)



@routes_final_result.get("/get_final_result")
def get_all(db: Session = Depends(database),
        current_user: CreateUser = Depends(get_current_active_user)):
    forms = db.query(Result).filter(Result.user_id == current_user.id).all()
    total = 0
    currect = 0
    procent = 0
    for form in forms:
        total += 1
        answer = post_put_db(db, Answers, form.answer_id)
        if answer.t_javob:
            currect += 1

        procent = currect // total * 100
    return f"All Answers: {total}, Trues: {currect}, Percentage: {procent}%"



    # # final_results = final_result(db, current_user)
    # final_results = db.query(Final_Result).filter(Final_Result.id == user.id).all
    # total = 0
    # currect = 0
    # procent = 0
    # for result in final_results:
    #     total += 1
    #     total += result.hamma_savollar,
    #     currect += result.t_javoblar,
    #     procent += result.foiz
    #     if total != 0:
    #         procent = currect / total
    #     return f"All Answers: {total}, Trues: {currect}, Percentage: {procent}%"




@routes_final_result.get('/final_finally_result')
def final_finally_results(db: Session = Depends(database)):
    return db.query(Final_Result).all()


