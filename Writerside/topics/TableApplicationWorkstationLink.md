# Application Workstation Links

Connection definition between the [Application](TableApplications.md) and the
[Workstation](TableWorkstations.md) tables is a many-to-many type. A workstation
can be assigned to multiple applications and a single application can be used on
multiple workstations.

## Table Schema

> Table name: **application_workstation_links**

| Field name     | Key | Description    | Type    | Default value | Required |
|----------------|:---:|----------------|---------|:-------------:|:--------:|
| application_id | PK  | Application ID | Integer |       -       |    Y     |
| workstation_id | PK  | Workstation ID | Integer |       -       |    Y     |

## References

### Foreign Keys

1. The [application_id](TableApplications.md) is the reference field to an
   application entity.
2. The [workstation_id](TableWorkstations.md) is the reference field to a
   workstation entity.

## SQL queries

### MsSQL

```SQL
CREATE TABLE application_workstation_links (
	application_id INT REFERENCES applications(id),
	workstation_id INT REFERENCES workstations(id),
	PRIMARY KEY (application_id, workstation_id)
);
```

### PostgreSQL

```SQL
CREATE TABLE application_workstation_links (
    application_id INT REFERENCES applications(id),
    workstation_id INT REFERENCES workstations(id),
    PRIMARY KEY (application_id, workstation_id)
);
```