# Group Job Links

This is the table where the roles and responsibilities are defined in the
system. Groups are the user groups where the jobs in this table are assigned to
them. A job can be assigned for multiple groups and group can have multiple jobs
of course.

## Table Schema

> Table name: **group_job_links**

| Field name |  Key   | Description | Type    | Default value | Required |
|------------|:------:|-------------|---------|:-------------:|:--------:|
| job_id     | PK, FK | Job ID      | Integer |       -       |    Y     |
| group_id   | PK, FK | Group ID    | Integer |       -       |    Y     |

## References

### Foreign Keys

1. The [job_id](TableJobs.md) represents the job part of the connection
2. The [group](TableGroups.md) represents the group part of the connection

## SQL Queries

### MsSQL

```SQL
CREATE TABLE group_job_links (
    job_id INT REFERENCES jobs(id),
    group_id INT REFERENCES groups(id),
    PRIMARY KEY (job_id, group_id)
);
```

### PostgreSQL

```SQL
CREATE TABLE group_job_links (
    job_id INT REFERENCES jobs(id),
    group_id INT REFERENCES groups(id),
    PRIMARY KEY (job_id, group_id)
);
```