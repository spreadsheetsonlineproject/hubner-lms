# User Group Links

This table stores the connection between the users and user groups.

## Table Schema

> Table name: **table_name**

| Field name |  Key   | Description | Type    | Default value | Required |
|------------|:------:|-------------|---------|:-------------:|:--------:|
| user_id    | PK, FK | User ID     | Integer |       -       |    Y     |
| group_id   | PK, FK | Group ID    | Integer |       -       |    Y     |

## References

### Foreign Keys

1. The [user_id](TableUsers.md) represents the user.
2. The [group_id](TableGroups.md) represents the group.

## SQL Queries

### MsSQL

```SQL
CREATE TABLE user_group_links (
    user_id BIGINT REFERENCES users(id),
    group_id INT REFERENCES groups(id),
    PRIMARY KEY (user_id, group_id)
);
```

### PostgreSQL

```SQL
CREATE TABLE user_group_links (
    user_id BIGINT REFERENCES users(id),
    group_id INT REFERENCES groups(id),
    PRIMARY KEY (user_id, group_id)
);
```