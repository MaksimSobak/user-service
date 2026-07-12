from fastapi import FastAPI
from .routes import router
from .database import Base, engine

app = FastAPI()

app.include_router(router)


@app.on_event("startup")
def startup():
    Base.metadata.create_all(bind=engine)


@app.get("/")
def root():
    return {"\nmessage": "User service is working!"}


@app.get("/health")
def health():
    return {"\nstatus": "ok"}