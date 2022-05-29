import os
import sys

import psycopg2 as dbapi2

INIT_STATEMENTS = [

    """
    create table if not exists userInfo(
        user_id int primary key,
        username varchar not null,
        firstName varchar not null,
        lastName varchar not null,
        password varchar not null,
        phone varchar not null,
        address varchar not null,
        savedStart varchar not null,
        savedEnd varchar not null
    )
    """,

    """
    create table if not exists tripInfo(
        trip_id int primary key,
        username varchar not null,
        dateTrip varchar not null,
        timeTrip varchar not null,
        startTrip varchar not null,
        endTrip varchar not null
    )
    """,

    """
    create table if not exists testtbl(
        username varchar not null,
        dateTrip varchar not null,
    )
    """,
]

def initialize(url):
    with dbapi2.connect(url) as connection:
        cursor = connection.cursor()
        for statement in INIT_STATEMENTS:
            cursor.execute(statement)
        cursor.close()


if __name__ == "__main__":
    url = os.getenv("DATABASE_URL")
    if url is None:
        print("Usage: DATABASE_URL=url python dbinit.py")  # , file=sys.stderr)
        sys.exit(1)
    initialize(url)
