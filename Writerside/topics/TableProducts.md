# Products

The main table of the LMS system. This table stores the products that are going
to be produced. Every product has a unique data matrix number. Other tables of
the system are created to support the tracking of the products.

## Table Schema

> Table name: **products**

| Field name               | Key | Description                                          | Type       | Default value | Required |
|--------------------------|:---:|------------------------------------------------------|------------|:-------------:|:--------:|
| id                       | PK  | Unique ID                                            | BigInteger |       -       |    Y     |
| production_order         |     | The ID of the                                        | Integer    |       -       |    Y     |
| active                   |     | Shows the active status of the product               | Integer    |     True      |    N     |
| virtual_handling_unit_id | FK  | Connection field to Frame ID                         | Integer    |       -       |    N     |
| qa_status                |     | Shows that the product is good to use in production. | Bool       |     True      |    N     |
| last_job_history         |     | The ID of the last history item                      | Integer    |       -       |    N     |
| last_qa_history          |     | The ID of the last quality history item              | Integer    |       -       |    N     |

## References

### Foreign Keys

1. The [virtual_handling_unit_id](TableVirtualHandlingUnits.md) is the
   connection field to the VHU table. This is defined as a `ForeingKey`.

### Connection Fields

1. The [production_order](TableProductionOrders.md) field is not a foreign key,
   just the id of the production order.
2. The [last_job_history](TableProductHistories.md) is the ID of the latest job
   history entity.
3. The [last_qa_history](TableProductHistories.md) is the ID of the latest job
   history entity where quality was registered.

## SQL Queries

### MsSQL

```SQL
CREATE TABLE products (
    id BIGINT PRIMARY KEY NOT NULL,
	production_order INT NOT NULL,
    active BIT DEFAULT 1,
    virtual_handling_unit_id INT REFERENCES virtual_handling_units(id),
	qa_status BIT,
    last_job_history INT,
	last_qa_history INT
);
CREATE INDEX idx_products_virtual_handling_unit_id ON products(virtual_handling_unit_id);
CREATE INDEX idx_products_production_order on products(production_order);
```

### PostgreSQL

```SQL
CREATE TABLE products (
    id BIGINT PRIMARY KEY NOT NULL,
	production_order INT NOT NULL,
    active BIT DEFAULT 1,
    virtual_handling_unit_id INT REFERENCES virtual_handling_units(id),
	qa_status BIT,
    last_job_history INT,
	last_qa_history INT
);
CREATE INDEX idx_products_virtual_handling_unit_id ON products(virtual_handling_unit_id);
CREATE INDEX idx_products_production_order on products(production_order);
```