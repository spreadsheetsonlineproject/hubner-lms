# Product History Items

A product history item row represents a history event. Multiple rows of this
table can have the same [Product Histories](TableProductHistories.md) row as a
parent reference. This way the system is able to register multiple actions for
the same product at the same time.

## Table Schema

> Table name: **product_history_items**

| Field name         | Key | Description               | Type         | Default value | Required |
|--------------------|:---:|---------------------------|--------------|:-------------:|:--------:|
| id                 | PK  | Unique ID                 | BigInteger   |       -       |    Y     |
| job_id             | FK  | ID of the job             | Integer      |       -       |    Y     |
| product_history_id | FK  | ID of the product history | Integer      |       -       |    Y     |
| qa_reason_id       | FK  | ID of the qa reason       | Integer      |       -       |    N     |
| comment            |     | Comment by the user       | Varchar(255) |       -       |    N     |

## References

### Foreign Keys

1. The [job_id](TableJobs.md) defines the performed action that the user made.
2. The [product_history_id](TableProductHistories.md) is the parent of the row
   here.
3. The [qa_reason_id](TableQaReasons.md) is on optional value. Value is needed
   here when the user made a quality check on the product.

## SQL Queries

### MsSQL

```SQL
CREATE TABLE product_history_items (
    id INT PRIMARY KEY IDENTITY(1,1),
    job_id INT REFERENCES jobs(id) NOT NULL,
	product_history_id INT REFERENCES product_histories(id) NOT NULL,
    qa_reason_id INT REFERENCES qa_reasons(id),
	comment NVARCHAR(255)
);
```

### PostgreSQL

```SQL
CREATE TABLE product_history_items (
    id SERIAL PRIMARY KEY,
    job_id INT REFERENCES jobs(id) NOT NULL,
    product_history_id INT REFERENCES product_histories(id) NOT NULL,
    qa_reason_id INT REFERENCES qa_reasons(id),
    comment VARCHAR(255)
);
```