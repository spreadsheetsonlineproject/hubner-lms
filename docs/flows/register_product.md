# Register New Product

## Overview
When the user registers new product, then the physical item becomes available in
the LMS system. The new product will have PO number attribute.

## Production flow
The Register Product application knows the id of the job. 
``` mermaid
flowchart

    Flow((Register Product)) --> RequestUserID[\Request User ID\]
    Stop --> Flow
    RequestUserID --> GetUserFromDB[(Get User From DB)]
    GetUserFromDB --> UserIsActive{User is Active}
    UserIsActive -->|YES| GetUserRightsFromDB[(Get User Rights)]
    GetUserRightsFromDB -->|YES| UserHasAccess{User has Access}
    UserHasAccess -->|NO| Stop((Stop))
    UserIsActive -->|NO| Stop
    UserHasAccess -->|YES| RequestProductID[\Request Product ID\]
    RequestProductID --> ProductIdInDB{Product ID in DB}
    ProductIdInDB -->|YES| Stop
    ProductIdInDB -->|NO| RequestPO[\Request PO\]
    RequestPO --> DbAction[(Database actions)]
```

## Database flow
When a new product is being created in the database a new entry is written in the following tables:
1. [products](database_schemas/tables.md#products),
2. [product_histories](database_schemas/tables.md#product-histories),
3. [job_items](database_schemas/tables.md#job-items),


``` mermaid
flowchart

    RegisterProduct((Register Product)) --> RegisterProductAPI((API))
```