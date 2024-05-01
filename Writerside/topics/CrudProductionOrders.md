# Production Orders

## Get By ID

Returns the meta information of a
single [ProductionOrders](TableSchemas.md#production-orders).

> Flow name: **CrudProductionOrdersGetById**

**Input Schema**

```json
{
  "type": "object",
  "properties": {
    "number": {
      "title": "id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Production Order number",
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
    "item_code": {
      "type": "string"
    },
    "item_name": {
      "type": "string"
    },
    "order_quantity": {
      "type": "integer"
    },
    "customer": {
      "type": "string"
    },
    "cycle_time": {
      "type": "integer"
    }
  }
}
```

**Response Sample**

```json
{
  "id": 11213220,
  "item_code": "32344523",
  "item_name": "Test Product",
  "order_quantity": 20,
  "customer": "Test Customer",
  "cycle_time": 15
}
```