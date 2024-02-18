# Workstations

## Get By ID

**Input Schema**

```json
{
  "schema": {
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
  "id": 1,
  "code_name": "assembly1",
  "name": "Assembly Workstation 1",
  "active": true
}
```