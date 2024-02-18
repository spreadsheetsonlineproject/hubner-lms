# Product History Items

## Get By Product Histories ID

The input schema requires the id from the product_histories. This ID is not
equivalent for the ID from this table.

**Input Schema**

```json
{
  "type": "object",
  "properties": {
    "number": {
      "title": "product_history_id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Product History ID",
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
  "type": "array",
  "items": {
    "type": "object",
    "properties": {
      "id": {
        "type": "integer"
      },
      "job_id": {
        "type": "integer"
      },
      "product_history_id": {
        "type": "integer"
      },
      "qa_reason_id": {
        "type": "integer"
      },
      "comment": {
        "type": "string"
      }
    },
    "required": [
      "id",
      "job_id",
      "product_history_id",
      "qa_reason_id",
      "comment"
    ]
  }
}
```

**Response sample**

```json
[
  {
    "id": 34,
    "job_id": 3,
    "product_history_id": 30,
    "qa_reason_id": 3,
    "comment": "Comment by user"
  },
  {
    "id": 35,
    "job_id": 4,
    "product_history_id": 30,
    "qa_reason_id": 3,
    "comment": "Comment by user"
  }
]
```