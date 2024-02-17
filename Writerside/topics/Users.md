# Users

## Get By ID

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

**Response sample**

```json
{
  "id": 1003347848,
  "active": false,
  "deleted": true,
  "deleted_at": "2023-12-24T11:24:45",
  "badge_number": 388475,
  "first_name": "John",
  "last_name": "Doe"
}
```