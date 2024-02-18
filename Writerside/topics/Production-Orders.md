# Production Orders

The [production_orders](TableSchemas.md#production-orders) table is the place
where production order meta information is stored.

Creating new Production Order is required at this point of the project. Future
developments will allow to update the content of this table by SAP refresh.

## Create

Creating new item in the [production_orders](TableSchemas.md#production-orders)
table.

> Flow name: ApiProductionOrdersCreate

**Sample usage**

```
ApiProductionOrdersCreate.Run(
    5001,
    {
        quantity: 1
    }
)
```

**Input Schema**

``` json
{
  "type": "object",
  "properties": {
    "number": {
      "title": "id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Production Order Number",
      "x-ms-content-hint": "NUMBER"
    },
    "number_1": {
      "title": "quantity",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Total Quantity of Production Order",
      "x-ms-content-hint": "NUMBER"
    }
  },
  "required": [
    "number"
  ]
}
```

**Response Schema**

``` json
{
  "type": "object",
  "properties": {
    "id": {
      "type": "integer"
    },
    "quantity": {
      "type": "integer"
    }
  }
}
```

**Sample Response**

``` json
{
  "id": 5001,
  "quantity": 1
}
```

## Get By ID

Retrieve existing Production Order.

> Flow name: ApiProductionOrdersGetById

**Sample usage**

```
ApiProductionOrdersGetById.Run(5001)
```

**Input Schema**

``` json
{
  "type": "object",
  "properties": {
    "number": {
      "title": "id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Production Order Number",
      "x-ms-content-hint": "NUMBER"
    }
  },
  "required": [
    "number"
  ]
}
```

**Response Schema**

``` json
{
  "type": "object",
  "properties": {
    "id": {
      "type": "integer"
    },
    "quantity": {
      "type": "integer"
    }
  }
}
```

**Sample Response**

``` json
{
  "id": 5001,
  "quantity": 1
}
```