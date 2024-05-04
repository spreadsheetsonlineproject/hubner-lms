# Users

Users table stores the individual's information. Only the person can make any
actions in the LMS system, who is member of the table, and they are in
***active*** status. When the ***deleted*** field is set as true, as the active
status should set to false, but that is not mandatory. This step just makes the
continuous development more stable.

> **Hard delete**
>
> Hard delete of any record from this table is not recommended. Instead, use the
> soft delete by setting the ***deleted*** field to `true` and the
***deleted_at***
> value to the time of deletion.

The ***badge_number*** field is useful when an old user needs to be reactivated.
This information gives the advantage of continuing the user history over an
inactive period of time.

## Table Schema

> Table name: **users**

| Field name   | Key | Description                    | Type         | Default value | Required |
|--------------|:---:|--------------------------------|--------------|:-------------:|:--------:|
| id           | PK  | Unique ID                      | BigInteger   |       -       |    Y     |
| active       |  -  | Allow user to take actions     | Bool         |     true      |    N     |
| deleted      |  -  | Deny any actions               | Bool         |     false     |    N     |
| deleted_at   |  -  | Time of deletion               | Timestamp    |       -       |    N     |
| badge_number |  -  | Employee id to identify person | Varchar(40)  |       -       |    N     |
| first_name   |  -  | First name                     | Varchar(60)  |       -       |    Y     |
| last_name    |  -  | First name                     | Varchar(60)  |       -       |    Y     |
| password     |  -  | Hashed password                | Varchar(MAX) |       -       |    N     |

## References

### Foreign Keys

This table does not have any reference field to other tables.

## SQL Queries

```SQL
CREATE TABLE users (
    id BIGINT PRIMARY KEY NOT NULL,
    active BIT DEFAULT 1,
    deleted BIT DEFAULT 0,
    deleted_at DATETIME,
    badge_number NVARCHAR(40) UNIQUE,
    first_name NVARCHAR(60) NOT NULL,
    last_name NVARCHAR(60) NOT NULL,
    password NVARCHAR(MAX)
);
```

### PostgreSQL

```SQL
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    active BOOLEAN DEFAULT TRUE,
    deleted BOOLEAN DEFAULT FALSE,
    deleted_at TIMESTAMP,
    badge_number VARCHAR(40) UNIQUE,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    password TEXT
);
```