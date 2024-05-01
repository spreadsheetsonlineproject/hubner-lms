# Products

Handling products and product histories are the key parts of the system.
Endpoints starting with `ApiProducts*` handle Product related changes or
requests.

## Create

Create new product in the database. Product history and related information is
also registered in the database.

> Flow name: **ApiProductsCreate**

> Dependencies:
> 1. [**CrudProductsCreate**](CrudProducts.md#create)
> 2. [**CrudProductHistoriesCreate**](CrudProducts.md#create)
> 3. [**CrudProductHistoryItemsCreate**](CrudProductHistoryItems.md#create)
> 4. [**CrudProductsUpdate**](CrudProducts.md#update)

**Input Schema**

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
    },
    "number_1": {
      "title": "production_order",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Production Order ID",
      "x-ms-content-hint": "NUMBER"
    },
    "number_2": {
      "title": "virtual_handling_unit_id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Virtual Handling Unit ID",
      "x-ms-content-hint": "NUMBER"
    },
    "number_3": {
      "title": "user_id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "User ID",
      "x-ms-content-hint": "NUMBER"
    },
    "number_4": {
      "title": "workstation_id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Workstation ID",
      "x-ms-content-hint": "NUMBER"
    },
    "number_5": {
      "title": "job_id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Job ID",
      "x-ms-content-hint": "NUMBER"
    },
    "text": {
      "title": "comment",
      "type": "string",
      "x-ms-dynamically-added": true,
      "description": "User comment",
      "x-ms-content-hint": "TEXT"
    },
    "text_1": {
      "title": "created_at",
      "type": "string",
      "x-ms-dynamically-added": true,
      "description": "Action timestamp in format (2024-03-22 11:42:00)",
      "x-ms-content-hint": "TEXT"
    }
  },
  "required": [
    "number",
    "number_1",
    "number_3",
    "number_4",
    "number_5"
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
    "production_order": {
      "type": "integer"
    },
    "active": {
      "type": "boolean"
    },
    "virtual_handling_unit_id": {
      "type": "integer"
    },
    "last_job_history": {
      "type": "integer"
    },
    "last_qa_history": {
      "type": "integer"
    }
  }
}
```

**Sample Response**

```json
{
  "id": 20014,
  "production_order": 2001,
  "active": true,
  "virtual_handling_unit_id": 185,
  "last_job_history": 276,
  "qa_status": true
}
```