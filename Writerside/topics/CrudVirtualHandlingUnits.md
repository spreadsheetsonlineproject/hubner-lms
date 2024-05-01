# Virtual Handling Units

A virtual handling unit represents a group of products, where the product is a
single profile, and the group of them is called frame.

## Create

Creates a new virtual handling unit entity.

> Flow name: **CrudVirtualHandlingUnitsCreate**

**Input Schema**

```json
{
  "type": "object",
  "properties": {},
  "required": []
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
    }
  }
}
```

**Response Sample**

```json
{
  "id": 4,
  "active": true
}
```