# Register New Product

When the user registers new product, then the physical item becomes available in
the LMS system. The new product will have PO number and future processes are
going to be applicable on the product.

## Production flow

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
    RequestPO --> RegisterProduct[(Register Product)]
```

## Database actions

### Get User From DB

### User has Access

### Register Product
