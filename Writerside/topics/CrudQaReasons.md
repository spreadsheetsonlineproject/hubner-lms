# Quality Reasons

Quality Reasons endpoints are responsible for handling database communication
with the [QualityReasons](TableQaReasons.md) table.

## Get By ID

Returns a single QA Reason object.

> Flow name: CrudQaReasonsGetById

**Input Schema**

```json
{
  "type": "object",
  "properties": {
    "number": {
      "title": "id",
      "type": "number",
      "x-ms-dynamically-added": true,
      "description": "Qa Reason ID",
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
}
```

**Response Sample**

```json
{
  "id": 1,
  "code_name": "OK0",
  "name": "OK",
  "description": "Alapertelmezett OK statusz",
  "ok_status": true,
  "active": true
}
```

## Get All

Returns the list of QA Reason objects.

> Flow name: **CrudQaReasonsGetAll**

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
      "ok_status": {
        "type": "boolean"
      },
      "active": {
        "type": "boolean"
      }
    },
    "required": [
      "id",
      "code_name",
      "name",
      "description",
      "ok_status",
      "active"
    ]
  }
}
```

**Response Sample**

```json
[
  {
    "id": 1,
    "code_name": "OK0",
    "name": "OK",
    "description": "Alapertelmezett OK statusz",
    "ok_status": true,
    "active": true
  },
  {
    "id": 2,
    "code_name": "NOK1",
    "name": "1  Szkorcs szemcse",
    "description": "1  Szkorcs szemcse",
    "ok_status": false,
    "active": true
  },
  {
    "id": 3,
    "code_name": "NOK2",
    "name": "2  Eloszlatlan szemcse",
    "description": "2  Eloszlatlan szemcse",
    "ok_status": false,
    "active": true
  },
  {
    "id": 4,
    "code_name": "NOK3",
    "name": "3  Beszakadás",
    "description": "3  Beszakadás",
    "ok_status": false,
    "active": true
  },
  {
    "id": 5,
    "code_name": "NOK4",
    "name": "4  Karc",
    "description": "4  Karc",
    "ok_status": false,
    "active": true
  }
]
```