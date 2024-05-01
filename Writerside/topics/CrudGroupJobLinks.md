# Group Job Links

## Get All

This CRUD operation fetches the connections between **Groups** and **Jobs**. The
response is a list of connections by **Group ID** and **Job ID**.

> Flow name: **CrudGroupJobLinksGetAll**

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
      "job_id": {
        "type": "integer"
      },
      "group_id": {
        "type": "integer"
      }
    },
    "required": [
      "job_id",
      "group_id"
    ]
  }
}
```

**Response Sample**

```json
[
  {
    "job_id": 1,
    "group_id": 3
  },
  {
    "job_id": 2,
    "group_id": 3
  },
  {
    "job_id": 3,
    "group_id": 4
  },
  {
    "job_id": 4,
    "group_id": 3
  },
  {
    "job_id": 5,
    "group_id": 3
  },
  {
    "job_id": 6,
    "group_id": 3
  }
]
```