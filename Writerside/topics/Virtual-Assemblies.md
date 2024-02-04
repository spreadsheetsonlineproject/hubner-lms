# Virtual Assemblies

Virtual Assembly API endpoints make changes or retrieve information based on
content of the [virtual_assemblies](TableSchemas.md#virtual-assemblies) table.

## Virtual Assemblies Create

Creating new virtual assembly item to link products together. This endpoint does
not require any input parameter.

> Flow name: ApiVidCreate

**Sample usage**

```
ApiVidCreate.Run()
```

**Input Schema**

``` json
{
    "type": "object",
    "properties": {},
    "required": []
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
        "to_id": {
            "type": "integer"
        }
    }
}
```

**Sample Response**

``` json
{
  "id": 1,
  "active": true
}
```

## Virtual Assemblies Update By ID

Creating new virtual assembly item to link products together. This endpoint does
not require any input parameter.

> Flow name: ApiVidUpdateById

**Sample usage**

```
ApiVidUpdateById.Run(
    1,
    {
        active: false,
        to_id: 2
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
            "description": "Virtual assembly ID",
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
            "title": "to_id",
            "type": "number",
            "x-ms-dynamically-added": true,
            "description": "New Assembly ID",
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
        "to_id": {
            "type": "integer"
        }
    }
}
```

**Sample Response**

``` json
{
  "id": 1,
  "active": false,
  "to_id": 2
}
```