# Jobs

## Get By Workstation

There are connections between **Jobs** and **Workstations** to assign specific
jobs to specific workstations. This CRUD operation returns back the list of jobs
that are assigned to a specific workstation.

> Flow name: **CrudJobsGetByWorkstation

**Input Schema**

```json
{
  "type": "object",
  "properties": {
    "number": {
      "title": "workstation_id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Workstation ID",
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
      },
      "disassemble": {
        "type": "boolean"
      },
      "create_product": {
        "type": "boolean"
      },
      "register_production_order": {
        "type": "boolean"
      },
      "assemble": {
        "type": "boolean"
      }
    }
  }
}
```

**Response Sample**

```json
[
  {
    "id": 23,
    "code_name": "PROV",
    "name": "Vulkanizálás",
    "description": "Steinl munkafolyamatok",
    "active": true,
    "disassemble": false,
    "create_product": false
  },
  {
    "id": 24,
    "code_name": "PROS",
    "name": "Sorjázás",
    "description": "Steinl munkafolyamatok",
    "active": true,
    "disassemble": false,
    "create_product": false
  }
]
```