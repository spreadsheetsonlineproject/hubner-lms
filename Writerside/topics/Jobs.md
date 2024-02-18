# Jobs

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
      "description": "Job ID",
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
    "code_name": {
      "type": "string"
    },
    "name": {
      "type": "string"
    },
    "description": {
      "type": "string"
    },
    "active": {
      "type": "boolean"
    }
  }
}
```

**Response Sample**

```json
{
  "id": 1,
  "code_name": "K1",
  "name": "Create Product",
  "description": "Create a new Product",
  "active": true
}
```