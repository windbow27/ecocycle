import os
import urllib.parse
from sqlalchemy import Column, Integer, String, DateTime, Unicode, ForeignKey
from dotenv import load_dotenv
from sqlalchemy import create_engine, MetaData
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
# Load environment variables from .env file
load_dotenv()

# Get database credentials from environment variables

db_user = os.getenv("DB_USER")
db_password = urllib.parse.quote_plus(os.getenv("DB_PASSWORD"))
db_host = os.getenv("DB_HOST")
db_name = os.getenv("DB_NAME")

# print(db_user, db_password, db_host, db_name)

# SQLALCHEMY_DATABASE_URL = "mysql+mysqlconnector://user:password@localhost/your_database_name"
# SQLALCHEMY_DATABASE_URL = "mysql+mysqlconnector://{db_user}:{db_password} @{db_host}/{db_name}"
#SQLALCHEMY_DATABASE_URL = "mysql+mysqlconnector://root:ngocanh5624@localhost:3307/projectdb_quanlidaotao"
SQLALCHEMY_DATABASE_URL = "mysql+mysqlconnector://{}:{}@{}/{}".format(db_user, db_password, db_host, db_name)

engine = create_engine(
    SQLALCHEMY_DATABASE_URL
)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

meta = MetaData()
Base = declarative_base()

# Check the connection
try:
    connection = engine.connect()
    print("Connection successful!")
    connection.close()
except Exception as e:
    print(f"Error connecting to the database: {e}")
    
    