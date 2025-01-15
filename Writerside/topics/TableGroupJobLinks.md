# Group Job Links

This is the table where the roles and responsibilities are defined in the
system. The connection between the [Group](TableGroups.md) and
the [Job](TableJobs.md) defines what kind of action can be made in the
production area by the user who is member of the given group.

## Table Schema

> Table name: **LMS Group Job Link**

| Field name | Description                   | Type   | Default value | Required |
|------------|-------------------------------|--------|:-------------:|:--------:|
| Group      | Connection to the Group table | Lookup |       -       |    Y     |
| Job        | Connection to the Job table   | Lookup |       -       |    Y     |

## Relationships

| Display Name | Related table | Relationship |
|--------------|---------------|--------------|
| Group        | LMS Group     | Many-to-one  |
| Job          | LMS Job       | Many-to-one  |

## Keys

This table does not have keys.