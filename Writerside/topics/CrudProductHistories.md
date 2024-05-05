# Product Histories

## Create

This endpoint is responsible for creating a new item in the
[**Product Histories**](TableProductHistories.md) table.

> Flow name: **CrudProductHistoriesCreate**

**Input Schema**

```json
{
  "type": "object",
  "properties": {
    "number": {
      "title": "created_by",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "User ID",
      "x-ms-content-hint": "NUMBER"
    },
    "number_1": {
      "title": "product_id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Product ID",
      "x-ms-content-hint": "NUMBER"
    },
    "number_2": {
      "title": "workstation_id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Workstation ID",
      "x-ms-content-hint": "NUMBER"
    },
    "number_3": {
      "title": "virtual_handling_unit_id_from",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Virtual Handling Unit ID From",
      "x-ms-content-hint": "NUMBER"
    },
    "number_4": {
      "title": "virtual_handling_unit_id_to",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Virtual Handling Unit ID To",
      "x-ms-content-hint": "NUMBER"
    },
    "number_5": {
      "title": "production_order_from",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Previous Production Order Number",
      "x-ms-content-hint": "NUMBER"
    },
    "number_6": {
      "title": "production_order_to",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "New Production Order Number",
      "x-ms-content-hint": "NUMBER"
    },
    "text": {
      "title": "created_at",
      "type": "string",
      "x-ms-dynamically-added": true,
      "description": "Created At Format:(2024-03-19 17:18:45)",
      "x-ms-content-hint": "TEXT"
    }
  },
  "required": [
    "number",
    "number_1",
    "number_2"
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
    "virtual_handling_unit_to": {
      "type": "integer"
    },
    "production_order_from": {
      "type": "integer"
    },
    "production_order_to": {
      "type": "integer"
    }
  }
}
```

**Response Sample**

```json
{
  "id": 23,
  "created_at": "2024-04-23T09:50:47.033Z",
  "created_by": 3,
  "product_id": 129,
  "workstation_id": 41,
  "virtual_handling_unit_id_from": 3,
  "virtual_handling_unit_id_to": 3,
  "production_order_from": 11213220,
  "production_order_to": 11213220
}
```

## Get Detailed By ID

A product history item stores multiple information. This endpoint returns the
details of a single history item.

> Flow name: **CrudProductHistoriesGetDetailedByID**

> Dependencies:
> 1. [**CrudUsersGetById**](CrudUsers.md#get-by-id)
> 2. [**CrudWorkstationsGetById**](CrudWorkstations.md#get-by-id)

**Input Schema**

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
  "id": 14,
  "product_id": 127,
  "created_at": "2024-04-23T09:27:13.715Z",
  "created_by": {
    "id": 1,
    "active": true,
    "deleted": false,
    "badge_number": "1",
    "first_name": "User Steinl",
    "last_name": "Doe"
  },
  "workstation": {
    "id": 9,
    "code_name": "STEINL9",
    "name": "Steinl 9",
    "active": true
  },
  "items": [
    {
      "id": 24,
      "comment": "",
      "job": {
        "id": 23,
        "code_name": "PROV",
        "name": "Vulkanizálás",
        "description": "Steinl munkafolyamatok",
        "active": true,
        "disassemble": false,
        "create_product": false
      },
      "qa_reason": {}
    }
  ]
}
```