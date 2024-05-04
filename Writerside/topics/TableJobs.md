# Jobs

Each row of the jobs table is an action that adds value to the product.
The `disassemble` is a boolean type field. When the value of this field is true,
then the system can use this job to split virtual handling units.
The `create_product` field is used to register new products in the database.

## Table Schema

> Table name: **jobs**

| Field name     | Key | Description                          | Type         | Default value  | Required |
|----------------|:---:|--------------------------------------|--------------|:--------------:|:--------:|
| id             | PK  | Unique ID                            | BigInteger   | auto increment |    Y     |
| code_name      |     | Unique short name of the job         | Varchar(20)  |       -        |    Y     |
| name           |     | Full name of the job                 | Varchar(120) |       -        |    Y     |
| description    |     | Description of the job               | Varchar(255) |       -        |    N     |
| active         |     | If true, the job is usable           | Bool         |      True      |    N     |
| disassemble    |     | This action can split VHU            | Bool         |     False      |    N     |
| create_product |     | This action can register new product | Bool         |     False      |    N     |

## References

### Foreign Keys

This table does not have references to other tables.

## SQL

**MsSQL**

``` SQL
CREATE TABLE jobs (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(20) UNIQUE NOT NULL,
    description NVARCHAR(255),
    active BIT DEFAULT 1,
);
```

**Postgresql**

``` SQL
CREATE TABLE jobs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL,
    description VARCHAR(255),
    active BOOLEAN DEFAULT true,
);
```