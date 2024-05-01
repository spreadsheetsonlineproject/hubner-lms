# Users

API endpoints in the users group are responsible for managing users, user rights
and user permissions.

## Get By ID

Users get by ID endpoint returns the user information by their ID.

> Flow name: **ApiUserGetById**

> Dependencies:
> 1. [**CrudUsersGetById**](CrudUsers.md#get-by-id)


**Input Schema**

```json
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

```json
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

**Response Sample**

```json
{
  "id": 1,
  "first_name": "John",
  "last_name": "Doe",
  "active": true,
  "deleted": false
}
```

## Group User Links Get All

Users are assigned to groups, where a group collects different roles and
responsibilities. This approach helps to manage users and their user rights.

> Flow name: **ApiUserGroupLinksGetAll**

**Used CRUD operations**

**Input Schema**

```json
{
  "schema": {
    "type": "object",
    "properties": {},
    "required": []
  }
}
```

**Response Schema**

```json
{
  "type": "array",
  "items": {
    "type": "object",
    "properties": {
      "user_id": {
        "type": "integer"
      },
      "group_id": {
        "type": "integer"
      }
    },
    "required": [
      "user_id",
      "group_id"
    ]
  }
}
```

**Sample Response**

```json
[
  {
    "user_id": 1,
    "group_id": 7
  },
  {
    "user_id": 1,
    "group_id": 8
  },
  {
    "user_id": 1,
    "group_id": 9
  },
  {
    "user_id": 2,
    "group_id": 8
  },
  {
    "user_id": 2,
    "group_id": 9
  },
  {
    "user_id": 3,
    "group_id": 7
  }
]
```