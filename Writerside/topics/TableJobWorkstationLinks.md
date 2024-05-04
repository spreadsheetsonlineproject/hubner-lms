# Job Workstation Links

The items of this table define the connection between job items
from [Jobs](TableJobs.md) and workstations
from [Workstations](TableWorkstations.md) table..

## Table Schema

> Table name: **job_workstation_links**

| Field name     |  Key   | Description    | Type    | Default value | Required |
|----------------|:------:|----------------|---------|:-------------:|:--------:|
| workstation_id | PK, FK | Workstation ID | Integer |       -       |    Y     |
| job_id         | PK, FK | Job ID         | Integer |       -       |    Y     |

## References

### Foreign Keys

1. The [workstation_id](TableWorkstations.md) determines the workstation.
2. The [job_id](TableJobs.md) represents the job item.

## SQL Queries

### MsSQL

```SQL
CREATE TABLE job_workstation_links (
    workstation_id INT REFERENCES workstations(id),
    job_id INT REFERENCES jobs(id),
    PRIMARY KEY (workstation_id, job_id)
);
```

### PostgreSQL

```SQL
CREATE TABLE job_workstation_links (
    workstation_id INT REFERENCES workstations(id),
    job_id INT REFERENCES jobs(id),
    PRIMARY KEY (workstation_id, job_id)
);
```