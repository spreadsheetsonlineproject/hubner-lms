# International Languages

The applications of the Lifecycle Management System supports international
options. The users can select their preferred language. This table stores the
list of available and supported languages.

## Table Schema

> Table name: **international_languages**

| Field name | Key | Description              | Type        | Default value | Required |
|------------|:---:|--------------------------|-------------|:-------------:|:--------:|
| id         | PK  | Unique ID                | BigInteger  |       -       |    Y     |
| code_name  |     | Unique short name        | Varchar(8)  |       -       |    Y     |
| language   |     | The name of the language | Varchar(20) |       -       |    Y     |

## References

### Foreign Keys

This table does not have any reference field to other tables

## SQL Queries

### MsSQL

```SQL
CREATE TABLE international_languages (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(8) NOT NULL,
    language NVARCHAR(20) NOT NULL
);
```

### PostgreSQL

```SQL
CREATE TABLE international_languages (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(8) NOT NULL,
    language VARCHAR(20) NOT NULL
);
```