from fastapi import FastAPI
from routes.results_routes import router_result
from routes.answer_routes import router_answer
from routes.categories_routes import router_categories
from routes.question_routes import router_question
from routes.users_router import users_router
from routes.admin_routes import admin_router
from routes.login import login_router
from routes.final_result_routes import routes_final_result
app = FastAPI()

app.include_router(login_router)
app.include_router(admin_router)
app.include_router(users_router)
app.include_router(router_categories)
app.include_router(router_question)
app.include_router(router_answer)
app.include_router(router_result)
app.include_router(routes_final_result)




