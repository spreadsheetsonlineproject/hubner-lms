# Quality Reasons

Products are going through steps where their quality is checked. Users are able
to register an issue on the product. These reasons codes help to identify the
problem.

## Table Schema

> Table name: **qa_reasons**

| Field name  | Key | Description                                    | Type         | Default value | Required |
|-------------|:---:|------------------------------------------------|--------------|:-------------:|:--------:|
| id          | PK  | Unique ID                                      | BigInteger   |       -       |    Y     |
| code_name   |     | Unique short name of the reason                | Varchar(20)  |       -       |    Y     |
| name        |     | Full name of the reason                        | Varchar(120) |       -       |    N     |
| description |     | Detailed description of the reason             | Varchar(255) |       -       |    N     |
| ok_status   |     | True means the product is fine                 | Bool         |     False     |    N     |
| active      |     | Can be used in production if the value is true | Bool         |     True      |    N     |

## References

### Foreign Keys

This table does not have any reference to other table.

## SQL Queries

### MsSQL

```SQL
CREATE TABLE qa_reasons (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(20) UNIQUE NOT NULL,
    name NVARCHAR(120),
	description NVARCHAR(255),
	ok_status BIT DEFAULT 0,
    active BIT DEFAULT 1
);
```

### PostgreSQL

```SQL
CREATE TABLE qa_reasons (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(120),
    description VARCHAR(255),
    ok_status BOOLEAN DEFAULT FALSE,
    active BOOLEAN DEFAULT TRUE
);
```