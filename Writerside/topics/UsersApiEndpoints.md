# User Endpoints

User related actions in the database performed via the flows below.
The attributes of the PowerAutomate calls have to follow the given order.

## Active

The status of the user depends on two different fields in the
[users](TableSchemas.md#users) table. The **active** column
with `true` value always represents an active user. An inactive user can be
determined by the `false` value of **active** field or the `true` value of the
**deleted** field.
In case of any inconsistent changes on the **deleted** and **active** field of
the [users](TableSchemas.md#users)
table

> The name of the flow is **ApiUserActive**

The flow requires a single input value to check the active status of a user. The
input must be a number and comes from the **DataMatrix** ID of the user. This
field is called **unique_id** in the [users](TableSchemas.md#users)
table.

**Input attributes:**

| Attribute | Type   | Position | Required |
|-----------|--------|----------|:--------:|
| UniqueId  | Number | 1        |    Y     |

**Output Attributes:**

| Attribute | Type    | Position |
|-----------|---------|----------|
| Active    | Boolean | 1        |

> If the user does not exist in the database, the API endpoint will return
> error.

## Has permission

Actions in the LMS require permissions to execute the task. A job in the
[jobs](TableSchemas.md#jobs) table represents an executable task.
Different permission levels are assigned to users.

This endpoint checks the required permission level for the current user for the
given job.

> The name of the flow is **ApiUserAccess**

**Input attributes:**

| Attribute          | Type   | Position | Required |
|--------------------|--------|----------|:--------:|
| UniqueId           | Number | 1        |    Y     |
| JobID              | Number | 2        |    Y     |
| RequiredPermission | String | 3        |    Y     |

**Output Attributes:**

| Attribute     | Type    | Position |
|---------------|---------|----------|
| HasPermission | Boolean | 1        |

> If the user, job or permission do not exist in the database, the API endpoint
> will return error.
