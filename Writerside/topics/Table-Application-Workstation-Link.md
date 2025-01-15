# Application Workstation Link

Connection definition between [Applications](TableApplications.md) and
[Workstations](TableWorkstations.md) tables.

## Table Schema

> Table name: **LMS Application Workstation Link**

| Field name  | Description              | Type   | Default value | Required |
|-------------|--------------------------|--------|:-------------:|:--------:|
| Application | The Application instance | Lookup |       -       |    Y     |
| Workstation | The Workstation instance | Lookup |       -       |    Y     |

## Relationships

| Display Name | Related table   | Relationship |
|--------------|-----------------|--------------|
| Application  | LMS Application | Many-to-one  |
| Workstation  | LMS Workstation | Many-to-one  |

## Keys

This table does not have keys.