# Virtual Handling Units

Collection of assembled profiles. An item in this table is a representation of a
group of profiles (products), called a single frame.

## Table Schema

> Table name: **virtual_handling_units**

| Field name | Key | Description        | Type    | Default value  | Required |
|------------|:---:|--------------------|---------|:--------------:|:--------:|
| id         | PK  | Unique ID          | Integer | auto increment |    -     |
| active     |  -  | Is the item active | Bool    |      true      |    -     |

## References

### Foreign Keys

This table does not have any reference field to other tables

## SQL Queries

### MsSQL

```SQL
CREATE TABLE virtual_handling_units (
    id INT PRIMARY KEY IDENTITY(1,1),
    active BIT DEFAULT 1
);
```

### PostgreSQL

```SQL
CREATE TABLE virtual_handling_units (
    id SERIAL PRIMARY KEY,
    active BOOLEAN DEFAULT TRUE
);
```