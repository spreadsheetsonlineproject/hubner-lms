# Product Histories

## Get By ID

**Input schema**

```json
{
  "type": "object",
  "properties": {
    "number": {
      "title": "id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Product ID",
      "x-ms-content-hint": "NUMBER"
    }
  },
  "required": [
    "number"
  ]
}
```

**Response schema**

```json
{
  "type": "object",
  "properties": {
    "id": {
      "type": "integer"
    },
    "created_at": {
      "type": "string"
    },
    "created_by": {
      "type": "integer"
    },
    "product_id": {
      "type": "integer"
    },
    "workstation_id": {
      "type": "integer"
    },
    "virtual_handling_unit_id_from": {
      "type": "integer"
    },
    "virtual_handling_unit_id_to": {
      "type": "integer"
    }
  }
}
```