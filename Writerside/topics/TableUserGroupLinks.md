# User Group Links

This table stores the connection between the [User](TableUsers.md)
and [Group](TableGroups.md).

## Table Schema

> Table name: **LMS Group User Link**

| Field name | Description                   | Type   | Default value | Required |
|------------|-------------------------------|--------|:-------------:|:--------:|
| Group      | Connection to the Group table | Lookup |       -       |    Y     |
| User       | Connection to the User table  | Lookup |       -       |    Y     |

## Relationships

| Display Name | Related table | Relationship |
|--------------|---------------|--------------|
| Group        | LMS Group     | Many-to-one  |
| User         | LMS User      | Many-to-one  |

## Keys

This table does not have keys.