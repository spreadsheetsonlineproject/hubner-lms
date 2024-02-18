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

## Get Detailed By ID

**Input Schema**

```json
{
  "type": "object",
  "properties": {
    "number": {
      "title": "id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Product Histories ID",
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
    "product_id": {
      "type": "integer"
    },
    "created_at": {
      "type": "string"
    },
    "workstation": {
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
    },
    "created_by": {
      "type": "object",
      "properties": {
        "id": {
          "type": "integer"
        },
        "first_name": {
          "type": "string"
        },
        "last_name": {
          "type": "string"
        },
        "active": {
          "type": "boolean"
        },
        "deleted": {
          "type": "boolean"
        }
      }
    },
    "items": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "id": {
            "type": "integer"
          },
          "job": {
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
          },
          "qa_reason": {
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
              "ok_status": {
                "type": "boolean"
              },
              "active": {
                "type": "boolean"
              }
            }
          },
          "comment": {
            "type": "string"
          }
        },
        "required": [
          "id",
          "job",
          "qa_reason",
          "comment"
        ]
      }
    }
  }
}
```

**Response Sample**

```json
{
  "id": 3,
  "product_id": 1001,
  "created_at": "2024-02-12 12:23:23",
  "workstation": {
    "id": 4,
    "code_name": "Qa1",
    "name": "Quality Workstation 1",
    "active": true
  },
  "created_by": {
    "id": 2,
    "first_name": "John",
    "last_name": "Doe",
    "active": true,
    "deleted": false
  },
  "items": [
    {
      "id": 3,
      "job": {
        "id": 5,
        "code_name": "QADOK",
        "name": "Qaulity Inspection",
        "description": "Dimension measure",
        "active": true
      },
      "qa_reason": {
        "id": 5,
        "code_name": "QADOK",
        "name": "Qaulity Default OK",
        "description": "Default OK status",
        "ok_status": true,
        "active": true
      },
      "comment": "User input for the inspection"
    }
  ]
}
```