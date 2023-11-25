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
    RequestUserID --> UserHasAccess{User Has Access}
    UserHasAccess -->|NO| Stop((Stop))
    UserHasAccess -->|YES| RequestProductID[\Request Product ID\]
    RequestProductID --> ProductIdInDB{Product ID in DB}
    ProductIdInDB -->|YES| Stop
    ProductIdInDB -->|NO| RequestPO[\Request PO\]
    RequestPO --> DbAction[(Database actions)]
```

## API Flow
Describes the database actions from the register product
job to the database.

``` mermaid
flowchart

    RegisterProduct((Register Product)) --> RegisterProductAPI((API))
```