# Product Endpoints

The product is the main item in the LMS. The following endpoints allow to
create, delete, modify these products in a centralized, independent environment.

Endpoints below interact with the [products](TableSchemas.md#products)
table to create, update, delete or get single or multiple rows.

## Products Create

Creating a new instance of a product.

> The name of the flow is `ApiProductsCreate`

**Sample usage**

```
ApiProductsCreate.Run(
    1001,
    5001,
    {
        virtual_assembly_id: 1,
        qa_ok_status: true,
        active: true
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
            "description": "Product ID",
            "x-ms-content-hint": "NUMBER"
        },
        "number_1": {
            "title": "production_order_id",
            "type": "number",
            "x-ms-dynamically-added": true,
            "description": "Production Order ID",
            "x-ms-content-hint": "NUMBER"
        },
        "number_2": {
            "title": "virtual_assembly_id",
            "type": "number",
            "x-ms-dynamically-added": true,
            "description": "Virtual Assembly ID",
            "x-ms-content-hint": "NUMBER"
        },
        "boolean": {
            "title": "qa_ok_status",
            "type": "boolean",
            "x-ms-dynamically-added": true,
            "description": "Quality OK Status",
            "x-ms-content-hint": "BOOLEAN"
        },
        "boolean_1": {
            "title": "active",
            "type": "boolean",
            "x-ms-dynamically-added": true,
            "description": "Active",
            "x-ms-content-hint": "BOOLEAN"
        }
    },
    "required": [
        "number",
        "number_1"
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
        "active": {
            "type": "boolean"
        },
        "production_order_id": {
            "type": "integer"
        },
        "virtual_assembly_id": {
            "type": "integer"
        },
        "qa_ok_status": {
            "type": "boolean"
        }
    }
}
```

**Sample Response**

``` json
{
  "id": 1001,
  "active": true,
  "production_order_id": 5001,
  "virtual_assembly_id": 1,
  "qa_ok_status": true
}
```

## Products Get By ID

Request a single product by its ID.

> The name of the flow is `ApiProductsGetById`

**Sample usage**

```
ApiProductsGetById.Run(1001)
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
            "description": "ProductId",
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
        "active": {
            "type": "boolean"
        },
        "production_order_id": {
            "type": "integer"
        },
        "virtual_assembly_id": {
            "type": "integer"
        },
        "qa_ok_status": {
            "type": "boolean"
        }
    }
}
```

**Sample Response**

``` json
{
  "id": 1001,
  "active": true,
  "production_order_id": 5001,
  "virtual_assembly_id": 1,
  "qa_ok_status": true
}
```

## Products Update By ID

Request a single product by its ID.

> The name of the flow is `ApiProductsUpdateById`

**Sample usage**

```
ApiProductsUpdateById.Run(
    1001,
    {
        active: true,
        virtual_assembly_id: 1,
        qa_ok_status: true
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
            "description": "Product ID",
            "x-ms-content-hint": "NUMBER"
        },
        "number_1": {
            "title": "virtual_assembly_id",
            "type": "number",
            "x-ms-dynamically-added": true,
            "description": "Virtual Assembly ID",
            "x-ms-content-hint": "NUMBER"
        },
        "boolean_1": {
            "title": "qa_ok_status",
            "type": "boolean",
            "x-ms-dynamically-added": true,
            "description": "QA OK Status",
            "x-ms-content-hint": "BOOLEAN"
        },
        "boolean": {
            "title": "active",
            "type": "boolean",
            "x-ms-dynamically-added": true,
            "description": "Active status",
            "x-ms-content-hint": "BOOLEAN"
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
        "active": {
            "type": "boolean"
        },
        "production_order_id": {
            "type": "integer"
        },
        "virtual_assembly_id": {
            "type": "integer"
        },
        "qa_ok_status": {
            "type": "boolean"
        }
    }
}
```

**Sample Response**

``` json
{
  "id": 1001,
  "active": true,
  "production_order_id": 5001,
  "virtual_assembly_id": 1,
  "qa_ok_status": true
}
```

## Products Get By Virtual Assembly ID

Request a list of products by Virtual Assembly ID.

> The name of the flow is `ApiProductsGetByVid`

**Sample usage**

```
ApiProductsGetByVid.Run(1)
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
            "description": "Virtual Assembly ID",
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
    "type": "array",
    "items": {
        "type": "object",
        "properties": {
            "id": {
                "type": "integer"
            },
            "production_order_id": {
                "type": "integer"
            },
            "active": {
                "type": "boolean"
            },
            "virtual_assembly_id": {
                "type": "integer"
            },
            "qa_ok_status": {
                "type": "boolean"
            }
        }
    }
}
```

**Sample Response**

``` json
[
    {
      "id": 1001,
      "active": true,
      "production_order_id": 5001,
      "virtual_assembly_id": 1,
      "qa_ok_status": true
    },
    {
      "id": 1002,
      "active": true,
      "production_order_id": 5001,
      "virtual_assembly_id": 1,
      "qa_ok_status": true
    },
    {
      "id": 1003,
      "active": true,
      "production_order_id": 5001,
      "virtual_assembly_id": 1,
      "qa_ok_status": true
    }
]
```