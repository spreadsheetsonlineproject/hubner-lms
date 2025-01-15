# Applications

There are different types of applications in the LMS system. The metadata of
these applications like code name and display name must be stored in the
database.

## Table Schema

> Table name: **LMS Application**

| Field name | Description                  | Type         | Default value | Required |
|------------|------------------------------|--------------|:-------------:|:--------:|
| Code Name  | Unique ID                    | Text         |       -       |    Y     |
| Name       | Full name of the application | Varchar(120) |       -       |    Y     |

## Relationships

| Display Name | Related table                    | Relationship |
|--------------|----------------------------------|--------------|
| Application  | LMS Application Workstation Link | One-to-many  |

## Keys

| Display Name  | Columns   |
|---------------|-----------|
| Code Name Key | Code name |
