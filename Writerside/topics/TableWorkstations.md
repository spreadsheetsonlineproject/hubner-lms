# Workstations

A single workstation represents a place in the production area where the users
are able to perform any actions during the production process. Workstation can
be described as a device where users can open an LMS application.

## Table Schema

> Table name: **workstations**

| Field name | Key | Description                     | Type         | Default value  | Required |
|------------|:---:|---------------------------------|--------------|:--------------:|:--------:|
| id         | PK  | Unique ID                       | BigInteger   | auto increment |    Y     |
| code_name  |     | Short name of the workstation   | Varchar(20)  |       -        |    Y     |
| name       |     | Full name of the workstation    | Varchar(120) |       -        |    Y     |
| active     |     | Activate or disable workstation | Bool         |      true      |    N     |

## References

### Foreign Keys

This table does not have any reference field to other tables.

## SQL Queries

### MsSQL

```SQL
CREATE TABLE workstations (
    id INT PRIMARY KEY IDENTITY(1,1),
	code_name NVARCHAR(20),
    name NVARCHAR(120),
    active BIT DEFAULT 1,
);
```

### PostgreSQL

```SQL
CREATE TABLE workstations (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(20),
    name VARCHAR(120),
    active BOOLEAN DEFAULT TRUE
);
```