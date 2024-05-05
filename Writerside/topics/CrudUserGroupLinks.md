# User Group Links

Handle the changes in the table that stores the connections between Users and
Groups. This information is stored in
the [UserGroupLinks](TableUserGroupLinks.md) table.

## Get All

Returns a list of User and Group connections.

> Flow name: **CrudUserGroupLinksGetAll**

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
      "user_id": {
        "type": "integer"
      },
      "group_id": {
        "type": "integer"
      }
    },
    "required": [
      "user_id",
      "group_id"
    ]
  }
}
```

**Response Sample**

```json
[
  {
    "user_id": 1,
    "group_id": 2
  },
  {
    "user_id": 2,
    "group_id": 1
  },
  {
    "user_id": 3,
    "group_id": 4
  },
  {
    "user_id": 4,
    "group_id": 3
  },
  {
    "user_id": 5,
    "group_id": 3
  },
  {
    "user_id": 6,
    "group_id": 3
  },
  {
    "user_id": 7,
    "group_id": 3
  }
]
```