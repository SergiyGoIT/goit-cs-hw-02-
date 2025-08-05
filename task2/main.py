from fastapi import FastAPI
from sqlalchemy import create_engine
from conf.db import SQLALCHEMY_DATABASE_URL

app = FastAPI()

engine = create_engine(SQLALCHEMY_DATABASE_URL)


@app.get("/")
def read_root():
    return {"message": "Welcome to FastAPI!"}


@app.get("/check-db")
def check_db():
    try:
        with engine.connect() as connection:
            connection.execute("SELECT 1")
        return {"message": "Database connection works correctly!"}
    except Exception as e:
        return {"error": str(e)}
