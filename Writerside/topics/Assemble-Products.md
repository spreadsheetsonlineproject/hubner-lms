# Assemble Products

Assemble product is the group of actions when the employee creates a new
physical product out of multiple items. The new product will be represented
as one by the Virtual ID (VID).

``` mermaid
flowchart

	Flow((Assemble Product)) --> RequestUserID[\Request User ID\]
    RequestUserID --> GetUserFromDB[(Get User From DB)]
    GetUserFromDB --> UserIsActive{User is Active}
    UserIsActive -->|NO| Stop
    Stop --> Flow
    UserIsActive -->|YES| GetUserRightsFromDB[(Get User Rights)]
    GetUserRightsFromDB -->|YES| UserHasAccess{User has Access}
    UserHasAccess -->|NO| Stop((Stop))
    UserHasAccess -->|YES| RequestProductID[\Request Product ID\]
    RequestProductID --> GetProduct[(Get Product)]
    GetProduct --> ValidateProduct{Product valid}
    ValidateProduct -->|NO| Continue
    ValidateProduct -->|YES| AddToCollection[Add to collection]
    AddToCollection --> Continue{Continue}
    Continue -->|YES| RequestProductID
```
