# Workstations

Workstations is a place where the users make changes on the product.

## Get By ID

Returns a single workstation object.

> Flow name: **CrudWorkstationsGetById**

**Input Schema**

```json
{
  "type": "object",
  "properties": {
    "number": {
      "title": "id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Workstation ID",
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
    "active": {
      "type": "boolean"
    }
  }
}
```

**Response Sample**

```json
{
  "id": 9,
  "code_name": "STEINL9",
  "name": "Steinl 9",
  "active": true
}
```