# Production Orders

Meta information of the production order is stored in this table. This table is
going to create the connection between the LMS and the SAP. Other tables in the
LMS will use this table as foreign key to create connection. SAP related tables
will also use this table to establish the connection between the system and SAP.

## Table Schema

> Table name: **production_orders**

| Field name     | Key | Description              | Type         | Default value | Required |
|----------------|:---:|--------------------------|--------------|:-------------:|:--------:|
| id             | PK  | PO Number                | Integer      |       -       |    Y     |
| order_quantity |     | Total quantity of the PO | Integer      |       -       |    N     |
| item_code      |     | The number of the item   | Varchar(60)  |       -       |    N     |
| item_name      |     | The name of the item     | Varchar(120) |       -       |    N     |
| customer       |     | The name of the customer | Varchar(255) |       -       |    N     |
| cycle_time     |     | Duration of the process  | Float        |       -       |    N     |
| message        |     | Message to users         | Varchar(255) |       -       |    N     |

## References

### Foreign Keys

This table does not have any reference field to other tables

## SQL Queries

### MsSQL

```SQL
CREATE TABLE production_orders (
    id INT PRIMARY KEY NOT NULL,
	item_code NVARCHAR(60),
	item_name NVARCHAR(120),
    order_quantity INT,
	customer NVARCHAR(255),
	cycle_time FLOAT,
	message NVARCHAR(255)
);
```

### PostgreSQL

```SQL
CREATE TABLE production_orders (
    id SERIAL PRIMARY KEY,
    item_code VARCHAR(60),
    item_name VARCHAR(120),
    order_quantity INT,
    customer VARCHAR(255),
    cycle_time FLOAT,
    message VARCHAR(255)
);
```