# Applications

There are different types of applications in the LMS. The metadata of these
applications like default language must be stored in the database.

## Table Schema

> Table name: **applications**

| Field name       | Key | Description                   | Type         | Default value  | Required |
|------------------|:---:|-------------------------------|--------------|:--------------:|:--------:|
| id               | PK  | Unique ID                     | BigInteger   | auto increment |    Y     |
| code name        |     | Short name of the application | Varchar(20)  |       -        |    Y     |
| name             |     | Full name of the application  | Varchar(120) |       -        |    Y     |
| default_language |     | Language code                 | Varchar(10)  |       -        |    Y     |

The `default_language` field defines the display language of the application.
This value must be match country and language code like `en_gb`, `hu_hu`, ...

## References

### Foreign Keys

This table does not have any foreign key.

## Connection Fields

The default language field is the string representation of the default language
of the application. This value must be country code - language format. For
example `en-gb` or `en-us` in case of English language, or `hu-hu` for Hungarian
language. These values will be searched in
the [International Languages](TableInternationalLanguages.md) table as
the `code_name` value.

## SQL Queries

### MsSQL

```SQL
CREATE TABLE applications (
	id INT PRIMARY KEY IDENTITY(1,1),
	code_name NVARCHAR(20) NOT NULL,
	name NVARCHAR(120) NOT NULL,
	default_language NVARCHAR(10)
);
```

### PostgreSQL

```SQL
CREATE TABLE applications (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(20) NOT NULL,
    name VARCHAR(120) NOT NULL,
    default_language VARCHAR(10)
);
```