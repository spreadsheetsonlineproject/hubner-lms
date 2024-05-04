# Groups

Groups are meant to use grouping users by role and responsibility. Users
from [Users](TableUsers.md) table will be assigned to these groups. Jobs
from [Jobs](TableJobs.md) table are going to be the other end of the
responsibility.

## Table Schema

> Table name: **groups**

| Field name | Key | Description          | Type         | Default value | Required |
|------------|:---:|----------------------|--------------|:-------------:|:--------:|
| id         | PK  | Unique ID            | BigInteger   |       -       |    Y     |
| code_name  |     | Short name           | Varchar(20)  |       -       |    Y     |
| name       |     | Long name to display | Varchar(120) |       -       |    Y     |

## References

## Foreign Keys

This table does not have any reference to other tables.

## SQL Queries

### MsSQL

```SQL
CREATE TABLE groups (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(20) UNIQUE NOT NULL,
    name NVARCHAR(120) NOT NULL
);
CREATE INDEX idx_groups_code_name ON groups(code_name);
```

```SQL
CREATE TABLE groups (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(120) NOT NULL
);
CREATE INDEX idx_groups_code_name ON groups(code_name);
```