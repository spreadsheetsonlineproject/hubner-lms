# Product Endpoints

The product is the main item in the LMS. The following endpoints allow to
create,
delete, modify these products in a centralized, independent environment.

## Register Product

When a new product starts its journey in the production, the item has to be
created in the system. Without this action the item is not usable at any other
places in the production.

This endpoint aim to register a new product and track the user and the job where
the action was made.

> The name of the flow is **ApiRegisterProduct**

The flow requires multiple inputs to make the actions in the database. The
**UserID** represents the DataMatrix ID of a user. The **ProductID** is also
a DataMatrix ID read from the barcode of the product.

Input attributes:

| Attribute | Type   | Position | Required |
|-----------|--------|----------|:--------:|
| UserID    | Number | 1        |    Y     |
| ProductID | Number | 2        |    Y     |
| JobID     | Number | 3        |    Y     |
| PoNumber  | Number | 4        |    Y     |

The flow is going to create a new item in the
[products](TableSchemas.md#products) table where the **data_matrix** get the
value of the **ProductID**. The **po_number** column value is going to be the
**PoNumber** by the input value. Other field of the table will have the
default value or `NULL`.

There are other tables in the database where new rows are created.

**Output Attributes:**

| Attribute   | Type   | Position |
|-------------|--------|----------|
| ProductDbID | Number | 1        |

## Assemble Product

Multiple product items are become a single product during the assembly
process. The unique id (DataMatrix) of the product is still linked to the
item, but a new **Virtual ID** is going to be created for the assembled
products.

> The name of the flow is **ApiAssemble**

| Attribute | Type   | Position | Required |
|-----------|--------|----------|:--------:|
| UniqueId  | Number | 1        |    Y     |
| ProductID | Number | 2        |    Y     |
| JobID     | Number | 3        |    Y     |

**Output Attributes:**

| Attribute   | Type   | Position |
|-------------|--------|----------|
| ProductDbID | Number | 1        |