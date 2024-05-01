# Products

## Create

Register a new profile in the database.

> Flow name: **CrudProductsCreate**

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
      "description": "Production Order",
      "x-ms-content-hint": "NUMBER"
    },
    "number_2": {
      "title": "virtual_handling_unit_id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Virtual Handling Unit ID",
      "x-ms-content-hint": "NUMBER"
    }
  },
  "required": [
    "number",
    "number_1"
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
    }
  }
}
```

**Response Sample**

```json
{
  "id": 134,
  "production_order": 11213220,
  "active": true,
  "virtual_handling_unit_id": 3
}
```

## Get By ID

Returns a [Product](TableSchemas.md#products) objects.

> Flow name: CrudProductsGetById

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
    },
    "qa_status": {
      "type": "boolean"
    }
  }
}
```

**Response Sample**

```json
{
  "id": 128,
  "production_order": 11213220,
  "active": true,
  "virtual_handling_unit_id": 2,
  "qa_status": true,
  "last_job_history": 4
}
```

## Get By VHU

Returns a list of products that part of the same frame.

> Flow name: CrudProductsGetByVhu

**Input Schema**

```json
{
  "type": "object",
  "properties": {
    "number": {
      "title": "virtual_handling_unit_id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Virtual Handling Unit ID",
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
      "production_order": {
        "type": "integer"
      },
      "virtual_handling_unit_id": {
        "type": "integer"
      },
      "qa_status": {
        "type": "boolean"
      },
      "last_job_history": {
        "type": "integer"
      },
      "last_qa_history": {
        "type": "integer"
      }
    },
    "required": [
      "id",
      "production_order",
      "virtual_handling_unit_id",
      "qa_status",
      "last_job_history",
      "last_qa_history"
    ]
  }
}
```

**Response Sample**

```json
[
  {
    "id": 127,
    "production_order": 11213220,
    "active": true,
    "virtual_handling_unit_id": 2,
    "qa_status": true,
    "last_job_history": 14
  },
  {
    "id": 128,
    "production_order": 11213220,
    "active": true,
    "virtual_handling_unit_id": 2,
    "qa_status": true,
    "last_job_history": 4
  },
  {
    "id": 133,
    "production_order": 11213220,
    "active": true,
    "virtual_handling_unit_id": 2,
    "qa_status": true,
    "last_job_history": 13
  }
]
```

## Get Detailed By ID

Creates a detailed product object with the information about the last history
items.

> Flow name: **CrudProductGetDetailedById**

> Dependencies:
> 1. [CrudProductsGetById](#get-by-id)
> 2. [CrudProductHistoriesGetDetailedById](CrudProductHistories.md#get-detailed-by-id)

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
    "active": {
      "type": "boolean"
    },
    "production_order": {
      "type": "integer"
    },
    "virtual_handling_unit_id": {
      "type": "integer"
    },
    "scanned": {
      "type": "boolean"
    },
    "last_job_history": {
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
                "properties": {}
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
    },
    "last_qa_history": {
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
  }
}
```

**Response Sample**

```json
{
  "id": 127,
  "active": true,
  "production_order": 11213220,
  "virtual_handling_unit_id": 2,
  "last_qa_history": {},
  "last_job_history": {
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
}
```

## Update

Update the base information of a single product.

> Flow name: **CrudProductsUpdate**

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
    "boolean": {
      "title": "active",
      "type": "boolean",
      "x-ms-dynamically-added": true,
      "description": "Active",
      "x-ms-content-hint": "BOOLEAN"
    },
    "number_2": {
      "title": "virtual_handling_unit_id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Virtual Handling Unit ID",
      "x-ms-content-hint": "NUMBER"
    },
    "number_3": {
      "title": "last_job_history",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Last Product History ID for job",
      "x-ms-content-hint": "NUMBER"
    },
    "number_4": {
      "title": "last_qa_history",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Last Product History ID for qa",
      "x-ms-content-hint": "NUMBER"
    },
    "number_1": {
      "title": "production_order",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Prodution Order Number",
      "x-ms-content-hint": "NUMBER"
    },
    "boolean_1": {
      "title": "qa_status",
      "type": "boolean",
      "x-ms-dynamically-added": true,
      "description": "QA status true or false",
      "x-ms-content-hint": "BOOLEAN"
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
    },
    "qa_status": {
      "type": "boolean"
    }
  }
}
```

**Response Sample**

```json
{
  "id": 134,
  "production_order": 11213220,
  "active": true,
  "virtual_handling_unit_id": 3,
  "qa_status": true,
  "last_job_history": 17,
  "last_qa_history": 22
}
```