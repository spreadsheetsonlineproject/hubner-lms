# User Endpoints

User related actions in the database performed via the flows below. The
attributes of the PowerAutomate calls have to follow the given order.

## Get User By ID

> The name of the flow is `ApiUsersGetById`

The most common user endpoint is getting the user details by the ID of the user.
This action will always return the user. Further actions in the user interface
will be handled by the result of this endpoint.

The request will query the [users](TableSchemas.md#users) table to find the
user.

**Sample usage**

```
ApiUsersGetById.Run(locCurrentUser.id)
```

**Input Schema**

``` json
{
  "type": "object",
  "properties": {
    "number": {
      "title": "id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "User ID",
      "x-ms-content-hint": "NUMBER"
    }
  },
  "required": [
    "number"
  ]
}
```

**Response Schema**

``` json
{
  "type": "object",
  "properties": {
    "id": {
      "type": "integer"
    },
    "first_name": {
      "type": "string"
    },
    "last_name": {
      "type": "string"
    },
    "active": {
      "type": "boolean"
    },
    "deleted": {
      "type": "boolean"
    }
  }
}
```

**Sample Response**

``` json
{
  "id": 1,
  "first_name": "Auto",
  "last_name": "LMS",
  "active": true,
  "deleted": false
}
```

**Response sample**

``` json
{
  "id": 123456,
  "first_name": "John",
  "last_name": "Doe",
  "active": true,
  "deleted": false
}
```

## Has permission

Actions in the LMS require permissions to execute the task. A job in the
[jobs](TableSchemas.md#jobs) table represents an executable task. Different
permission levels are assigned to users.

This endpoint checks the required permission level for the current user for the
given job.

> The name of the flow is **ApiUserAccess**

**Input attributes**

| Attribute          | Type   | Position | Required |
|--------------------|--------|----------|:--------:|
| UniqueId           | Number | 1        |    Y     |
| JobID              | Number | 2        |    Y     |
| RequiredPermission | String | 3        |    Y     |

**Response**

| Attribute     | Type    | Position |
|---------------|---------|----------|
| HasPermission | Boolean | 1        |

> If the user, job or permission do not exist in the database, the API endpoint
> will return error.
