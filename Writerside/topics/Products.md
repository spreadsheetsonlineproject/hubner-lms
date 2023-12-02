# Product Endpoints

The product is the main item in the LMS. The following endpoints allow to create,
delete, modify these products in a centralized, independent environment.

## Register Product

When a new product starts its journey in the production, the item has to be
created in the system. Without this action the item is not usable at any other
places in the production.

This endpoint aim to register a new product and track the user and the job where
the action was made.

> The name of the flow is **ApiRegisterProduct**

The flow requires multiple inputs to make the actions in the database. The
**UniqueID** represents the DataMatrix ID of a user. The **ProductID** is also
a DataMatrix ID read from the barcode of the product.

Input attributes:

**Input attributes:**

| Attribute | Type   | Position | Required |
|-----------|--------|----------|:--------:|
| UniqueId  | Number | 1        |    Y     |
| ProductID | Number | 2        |    Y     |
| JobID     | Number | 3        |    Y     |

**Output Attributes:**

| Attribute   | Type   | Position |
|-------------|--------|----------|
| ProductDbID | Number | 1        |
