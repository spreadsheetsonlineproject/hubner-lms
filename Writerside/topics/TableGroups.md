# Groups

Groups represent the different user roles. These groups should be defined by
responsibility. [User](TableUsers.md) and [Job](TableJobs.md) are connected
to these records. Combination of these connections can define the user role.

## Table Schema

> Table name: **LMS User Group**

| Field name | Description                  | Type                | Default value | Required |
|------------|------------------------------|---------------------|:-------------:|:--------:|
| Code Name  | Unique ID                    | Single line of text |       -       |    Y     |
| Name       | Full name of the application | Single line of text |       -       |    Y     |
| Is Active  | Group can be deactivated     | Yes/No              |      Yes      |    N     |

## Relationships

| Display Name | Related table       | Relationship |
|--------------|---------------------|--------------|
| Group        | LMS Group User Link | One-to-many  |
| Group        | LMS Group Job Link  | One-to-many  |

## Keys

| Display Name  | Columns   |
|---------------|-----------|
| Code Name Key | Code name |
