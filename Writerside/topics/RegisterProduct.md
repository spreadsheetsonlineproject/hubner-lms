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

This action is going to return `true` or `false` depends on the user active
or not. To get this result call the [ApiUserActive](UsersApiEndpoints.md#active)
API function from **PowerAutomate**.

### User has Access

Users needs to have the required permission to create new product in the LMS.
Checking the permissions of the current user should be done by calling the
[ApiUserAccess](UsersApiEndpoints.md#has-permission) endpoint.

### Register Product

The [ApiRegisterProduct](ProductsApiEndpoints.md#register-product) API
endpoint should be called when the user is active and 