# Users

## Get By ID

Returns a user object by the given ID

> Flow name: **CrudUsersGetById**

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
    "active": {
      "type": "boolean"
    },
    "deleted": {
      "type": "boolean"
    },
    "deleted_at": {
      "type": "string"
    },
    "badge_number": {
      "type": "integer"
    },
    "first_name": {
      "type": "string"
    },
    "last_name": {
      "type": "string"
    }
  }
}
```

**Response Sample**

```json
{
  "id": 1,
  "active": true,
  "deleted": false,
  "badge_number": "1",
  "first_name": "User Steinl",
  "last_name": "Doe"
}
```