# Product Histories

One of the most important tables in the LMS system. This table stores the
history of the products. Every time when the product is going to be moved to
another workstation or the product is going to be inspected, a new row is going
to be created in the history table.

## Table Schema

> Table name: **product_histories**

| Field name                    | Key | Description              | Type       | Default value  | Required |
|-------------------------------|:---:|--------------------------|------------|:--------------:|:--------:|
| id                            | PK  | Unique ID                | BigInteger | auto increment |    Y     |
| created_at                    |     | Timestamp saved in UTC   | DateTime   |     UTCNOW     |    N     |
| created_by                    | FK  | User ID                  | Integer    |       -        |    Y     |
| product_id                    | FK  | Product ID               | Integer    |       -        |    Y     |
| workstation_id                | FK  | Workstation ID           | Integer    |       -        |    Y     |
| virtual_handling_unit_id_from | FK  | Virtual Handling Unit ID | Integer    |       -        |    N     |
| virtual_handling_unit_id_to   | FK  | Virtual Handling Unit ID | Integer    |       -        |    N     |
| production_order_from         |     | Production Order ID      | Integer    |       -        |    N     |
| production_order_to           |     | Production Order ID      | Integer    |       -        |    N     |

## References

### Foreign Keys

1. The [created_by](TableUsers.md) field point to the user who performed the
   action in the production.
2. The [product_id](TableProducts.md) field is the product that was involved in
   the production.
3. The [workstation_id](TableWorkstations.md) is the place where the action item
   is created.
4. The [virtual_handling_unit_id_from](TableVirtualHandlingUnits.md) is the
   previous VHU.
5. The [virtual_handling_unit_id_to](TableVirtualHandlingUnits.md) is the next (
   current) VHU.

### Connection Fields

1. The [production_order_from](TableProductionOrders.md) and
   the [production_order_to](TableProducts.md) fields are can not be set
   as `Foreign Key`

## SQL Queries

### MsSQL

```SQL
CREATE TABLE product_histories (
    id INT PRIMARY KEY IDENTITY(1,1),
    created_at DATETIMEOFFSET(7) DEFAULT GETUTCDATE(),
    created_by BIGINT REFERENCES users(id) NOT NULL,
    product_id BIGINT REFERENCES products(id) NOT NULL,
	workstation_id INT REFERENCES workstations(id),
	virtual_handling_unit_id_from INT REFERENCES virtual_handling_units(id),
	virtual_handling_unit_id_to INT REFERENCES virtual_handling_units(id),
	production_order_from INT,
	production_order_to INT
);
```

### PostgreSQL

```SQL
CREATE TABLE product_histories (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    created_by BIGINT REFERENCES users(id) NOT NULL,
    product_id BIGINT REFERENCES products(id) NOT NULL,
    workstation_id INT REFERENCES workstations(id),
    virtual_handling_unit_id_from INT REFERENCES virtual_handling_units(id),
    virtual_handling_unit_id_to INT REFERENCES virtual_handling_units(id),
    production_order_from INT,
    production_order_to INT
);
```