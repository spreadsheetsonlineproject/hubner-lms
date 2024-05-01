# Applications

## Get By ID

Returns the application meta information by Application ID.

> Flow name: **CrudApplicationsGetById**

**Input Schema**

```json
{
  "type": "object",
  "properties": {
    "number": {
      "title": "id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Aplication ID",
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
    "default_language": {
      "type": "string"
    }
  }
}
```

**Response Sample**

```json
{
  "id": 1,
  "code_name": "PROD",
  "name": "Gyártás",
  "default_language": "hu-hu"
}
```