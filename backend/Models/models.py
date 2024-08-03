import sys
sys.path.append("Models")

from sqlalchemy.ext.automap import automap_base
from connect_db import engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy import inspect

Base = automap_base()
Base.prepare(autoload_with=engine)

# Log available classes to debug
#print("Available classes:", Base.classes.keys())

# Inspect the database to get detailed information about tables
inspector = inspect(engine)
tables = inspector.get_table_names()
#print("Tables in the database:", tables)

Users = Base.classes.users
Comment = Base.classes.comment
Post = Base.classes.post
Post_Like = Base.classes.post_like
Category = Base.classes.category
Post_Category = Base.classes.post_category
Blacklist_Token = Base.classes.blacklist_token

Session = sessionmaker(bind=engine)
session = Session()