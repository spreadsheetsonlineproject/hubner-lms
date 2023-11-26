# Schemas of the tables in the database
The schema of a table discribes the different fields and gives an overview about the usage of the table.

Every section describes a table in the database. You are going to find the recommendations, schema and indexes
with the MsSQL and PostgreSQL queries.

## Users
Users table stores the individual's information. Only those people can make any actions
in the LMS system, who is part of the table and they are in **active** status. When the **deleted**
field is set as true then the active status should set to false but that is not mandatory. This step
just makes the continous development more stable.

Hard delete of any record from this table is not recommended. Instead use the soft delete by
setting the **deleted** field to `true` and the **deleted_at** value to the time of deletition.

**Email** or **badge_number** fields are useful when an old user needs to be activated again. This information
gives the advantage of continuing the user history over an inactive period of time.

> Table name: users

| Field name   |  Key  | Description                        | Type       | Default value | Required |
| ------------ | :---: | ---------------------------------- | ---------- | :-----------: | :------: |
| id           |  PK   | Unique ID                          | Integer    |   sequence    |    N     |
| unique_id    |   -   | User's Data matrix number (Unique) | BigInteger |       -       |    Y     |
| active       |   -   | Allow user to take actions         | Bool       |     true      |    N     |
| deleted      |   -   | Deny any actions                   | Bool       |     false     |    N     |
| deleted_at   |   -   | Time of deletition                 | Timestamp  |       -       |    N     |
| email        |   -   | Email to identify person           | Varchar    |       -       |    Y     |
| badge_number |   -   | Emloyee id to identify person      | Varchar    |       -       |    Y     |
| first_name   |   -   | First name                         | Varchar    |       -       |    Y     |
| last_name    |   -   | First name                         | Varchar    |       -       |    Y     |

Indexes of the table should be the **unique_id**. This field is going to be the most queried field in this table.

<!-- tabs:start -->
#### **MsSQL**

``` sql
CREATE TABLE users (
    id INT PRIMARY KEY,
    unique_id BIGINT UNIQUE,
    active BIT DEFAULT 1,
    deleted BIT DEFAULT 0,
    deleted_at DATETIME,
    email NVARCHAR(MAX) NOT NULL,
    badge_number NVARCHAR(MAX) NOT NULL,
    first_name NVARCHAR(MAX) NOT NULL,
    last_name NVARCHAR(MAX) NOT NULL
);
CREATE INDEX idx_users_unique_id ON users(unique_id);
```

#### **PostgreSQL**

``` sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    unique_id BIGINT UNIQUE NOT NULL,
    active BOOLEAN DEFAULT true,
    deleted BOOLEAN DEFAULT false,
    deleted_at TIMESTAMP,
    email VARCHAR(255) NOT NULL,
    badge_number VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);
CREATE INDEX idx_users_unique_id ON users(unique_id);
```
<!-- tabs:end -->

## Production Flow items
Through the production different orders requires different steps to take. These steps are defined in the PO.

*This is the table, where the flow of production can be followed. Additional field can make the tracking more precise.*

> Table name: flow_items

| Field name |  Key  | Description               | Type    | Default value | Required |
| ---------- | :---: | ------------------------- | ------- | :-----------: | :------: |
| id         |  PK   | Unique ID                 | Integer |   sequence    |    N     |
| code_name  |   -   | Codename of the flow item | Varchar |       -       |    Y     |

Indexing of the table can be made by the **code_name** field.

<!-- tabs:start -->
#### **MsSQL**

``` sql
CREATE TABLE flow_items (
    id INT PRIMARY KEY,
    code_name NVARCHAR(MAX) NOT NULL
);
CREATE INDEX idx_code_name on flow_items(code_name);
```

#### **PostgreSQL**

``` sql
CREATE TABLE flow_items (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(255) NOT NULL
);
CREATE INDEX idx_code_name on flow_items(code_name);
```
<!-- tabs:end -->

## Jobs
This table stores the available actions that the users can perform during the production process. These jobs are
small parts of the processes in production. An entry in this table is the main definition of the job.

> Table name: jobs

| Field name                             |  Key  | Description                           | Type    | Default value | Required |
| -------------------------------------- | :---: | ------------------------------------- | ------- | :-----------: | :------: |
| id                                     |  PK   | Unique ID                             | Integer |   sequence    |    N     |
| name                                   |   -   | Name of the job (Unique)              | Varchar |       -       |    Y     |
| description                            |   -   | Short description of the job          | Varchar |       -       |    N     |
| active                                 |   -   | Determine the availability of the job | Bool    |     true      |    N     |
| [flow_item_id](#production-flow-items) |  FK   | Flow item made by this job            | Integer |       -       |    Y     |

Querying the table is going to be made through the **id** field in most cases. Sometimes the quiery will look for **flow_item_id**
so indexing of this field should be helpful.

<!-- tabs:start -->
#### **MsSQL**

``` sql
CREATE TABLE jobs (
    id INT PRIMARY KEY,
    name NVARCHAR(MAX) UNIQUE NOT NULL,
    description NVARCHAR(MAX),
    active BIT DEFAULT 1,
    flow_item_id INT REFERENCES flow_items(id) NOT NULL
);
CREATE INDEX idx_code_name on jobs(code_name);
```

#### **PostgreSQL**

``` sql
CREATE TABLE jobs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description VARCHAR(255),
    active BOOLEAN DEFAULT true,
    flow_item_id INT REFERENCES flow_items(id) NOT NULL
);
CREATE INDEX idx_code_name on jobs(code_name);
```
<!-- tabs:end -->


## Job Items
A single representation of a job. When the user take any action in the production that is represented by a [job](#jobs) item. This table
stores details of the taken action not just the metadata of the job.

> Table name: job_items

| Field name                                 |  Key  | Description                  | Type      | Default value | Required |
| ------------------------------------------ | :---: | ---------------------------- | --------- | :-----------: | :------: |
| id                                         |  PK   | Unique ID                    | Integer   |   sequence    |    -     |
| [job_id](#jobs)                            |  FK   | Job item id                  | Integer   |       -       |    Y     |
| description                                |   -   | Short description of the job | Varchar   |       -       |    N     |
| created_at                                 |   -   | Time of creation             | Timestamp |      now      |    N     |

Indexing should be created on the **job_id** field. Most queries are going to look for **id** or **job_id**.

<!-- tabs:start -->
### **MsSQL**

``` sql
CREATE TABLE job_items (
    id INT PRIMARY KEY,
    job_id INT REFERENCES jobs(id) NOT NULL,
    description NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE()
);
CREATE INDEX idx_job_items_job_id ON job_items(job_id);
```

### **PostgreSQL**

``` sql
CREATE TABLE job_items (
    id SERIAL PRIMARY KEY,
    job_id INT REFERENCES jobs(id) NOT NULL,
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_job_items_job_id ON job_items(job_id);
```
<!-- tabs:end -->

## Workstations
A single workstation item in the database is a single place in the production area where workers can do
their jobs. A workstation can perform multiple type of [jobs](#jobs), that assigend to the workstation.

Workstation and job connections are going to be defined in the [job_workstation_jobs](#job-and-workstation-links)

> Table name: workstations

| Field name |  Key  | Description                      | Type    | Default value | Required |
| ---------- | :---: | -------------------------------- | ------- | :-----------: | :------: |
| id         |  PK   | Unique ID                        | Integer |   sequence    |    N     |
| name       |   -   | Name of the workstation (Unique) | Varchar |       -       |    Y     |
| active     |   -   | Allow to use the workstation     | Bool    |     true      |    N     |

<!-- tabs:start -->
### **MsSQL**

``` sql
CREATE TABLE workstations (
    id INT PRIMARY KEY,
    name NVARCHAR(MAX),
    active BIT DEFAULT 1,
);
```

### **PostgreSQL**

``` sql
CREATE TABLE workstations(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    active BOOLEAN DEFAULT true
);
```
<!-- tabs:end -->


## Job and Workstation links
A single workstation can perform multiple jobs. This table is ment to create the connection between
jobs an workstations.

> Table name: job_workstation_links

| Field name                      |  Key   | Description                | Type    | Default value | Required |
| ------------------------------- | :----: | -------------------------- | ------- | :-----------: | :------: |
| [workstation_id](#workstations) | PK, FK | Id of the workstation      | Integer |       -       |    Y     |
| [job_id](#jobs)                 | PK, FK | Id of the job that allowed | Integer |       -       |    Y     |

<!-- tabs:start -->

### **MsSQL**

``` sql
CREATE TABLE job_workstation_links (
    workstation_id INT REFERENCES work_stations(id),
    job_id INT REFERENCES jobs(id),
    PRIMARY KEY (workstation_id, job_id)
);
```

### **PostgreSQL**
``` sql
CREATE TABLE job_workstation_links (
    workstation_id INT REFERENCES work_stations(id),
    job_id INT REFERENCES jobs(id),
    PRIMARY KEY (workstation_id, job_id)
);
```
<!-- tabs:end -->

## Permissions
Content of permissions table define the level of access when the user tries to perform actions.

> Table name: permissions

| Field name |  Key  | Description                           | Type    | Default value | Required |
| ---------- | :---: | ------------------------------------- | ------- | :-----------: | :------: |
| id         |  PK   | Unique ID                             | Integer |   sequence    |    N     |
| code_name  |   -   | Short name of the permission (Unique) | Varchar |       -       |    Y     |
| name       |   -   | Detailed name of the permission       | Varchar |       -       |    N     |

<!-- tabs:start -->

### **MsSQL**

``` sql
CREATE TABLE permissions (
    id INT PRIMARY KEY,
    code_name NVARCHAR(MAX) UNIQUE NOT NULL,
    name NVARCHAR(MAX) NOT NULL
);

```

### **PostgreSQL**

``` sql
CREATE TABLE permissions (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL
);
```

<!-- tabs:end -->

Recommended values:
1. can_view
2. can_create
3. can_update
4. can_delete

Values above and their combination can define any access level.

## Groups
Instance of the table represents multiple permissions grouped in one. This allowes to customize differen
access levels for different areas in the LMS system.

> Table name: groups

| Field name |  Key  | Description                      | Type    | Default value | Required |
| ---------- | :---: | -------------------------------- | ------- | :-----------: | :------: |
| id         |  PK   | Unique ID                        | Integer |   sequence    |    N     |
| code_name  |   -   | Short name of the group (Unique) | Varchar |       -       |    Y     |
| name       |   -   | Detailed name of the group       | Varchar |       -       |    N     |

Indexing on **code_name** field is highly recommended.

<!-- tabs:start -->

### **MsSQL**

``` sql
CREATE TABLE groups (
    id INT PRIMARY KEY,
    code_name NVARCHAR(MAX) UNIQUE NOT NULL,
    name NVARCHAR(MAX) NOT NULL
);
CREATE INDEX idx_groups_code_name ON groups(code_name);
```

### **PostgreSQL**

``` sql
CREATE TABLE groups (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL
);
CREATE INDEX idx_groups_code_name ON groups(code_name);
```

<!-- tabs:end -->


## Group and Permission links
Define the connections between [groups](#groups) and [permissions](#permissions) tables. With these links
any access, role can be defined.

> Table name: group_permission_links

| Field name                    |  Key   | Description                       | Type    | Default value | Required |
| ----------------------------- | :----: | --------------------------------- | ------- | :-----------: | :------: |
| [group_id](#groups)           | PK, FK | Id of the group                   | Integer |       -       |    Y     |
| [permission_id](#permissions) | PK, FK | Id of the permission that allowed | Integer |       -       |    Y     |


## User and Job links
Jobs need to be assigned to users.

> Table name: user_job_links

| Field name          |  Key   | Description         | Type    | Default value | Required |
| ------------------- | :----: | ------------------- | ------- | :-----------: | :------: |
| [user_id](#users)   | PK, FK | User id             | Integer |       -       |    Y     |
| [job_id](#jobs)     | PK, FK | Job id              | Integer |       -       |    Y     |
| [group_id](#groups) | PK, FK | Permission group id | Integer |       -       |    Y     |

## Quality reasons
This table stores the available quality reason codes.

> Table name: qa_reasons

| Field name                                         |  Key  | Description                        | Type    | Default value | Required |
| -------------------------------------------------- | :---: | ---------------------------------- | ------- | :-----------: | :------: |
| id                                                 |  PK   | Unique ID                          | Integer |   sequence    |    N     |
| code_name                                          |   -   | Short name of the reason (Unique)  | Varchar |       -       |    Y     |
| name                                               |   -   | Descriptive name of the reason     | Varchar |       -       |    N     |
| active                                             |   -   | Allows to deactivate reason        | Bool    |     true      |    N     |
| [severity_level_id](#severity-level-of-qa-reasons) |   -   | Define the seriocity of the reason | Integer |       Y       |    Y     |


## Severity Level of QA reasons
Set a level to a qa reason item.

> Table name: severity_levels

| Field name          |  Key  | Description                                   | Type    | Default value | Required |
| ------------------- | :---: | --------------------------------------------- | ------- | :-----------: | :------: |
| id                  |  PK   | Unique ID                                     | Integer |   sequence    |    N     |
| value               |   -   | Integer value where the 1 is the most serious | Integer |       -       |    Y     |
| allow_product_usage |   -   | Allow to use the product production           | Bool    |       -       |    Y     |

## QA items
Represent a quality check by the user.

> Table name: qa_items

| Field name                       |  Key  | Description                           | Type      | Default value | Required |
| -------------------------------- | :---: | ------------------------------------- | --------- | :-----------: | :------: |
| id                               |  PK   | Unique ID                             | Integer   |   sequence    |    N     |
| description                      |   -   | User description of the qa inspection | Varchar   |       -       |    Y     |
| created_at                       |   -   | Time of creation                      | Timestamp |      now      |    N     |
| created_by                       |   -   | User id                               | Integer   |       -       |    Y     |
| [qa_reason_id](#quality-reasons) |  FK   | Quality reason item                   | Integer   |       -       |    Y     |

## SAP Production Order
Placeholder table for future development

> Table name: sap_production_orders

| Field name |  Key  | Description                      | Type    | Default value | Required |
| ---------- | :---: | -------------------------------- | ------- | :-----------: | :------: |
| id         |  PK   | Unique ID                        | Integer |   sequence    |    N     |
| po_number  |   -   | Production Order number (Unique) | Varchar |       -       |    Y     |


## Products
Product base information

| Field name                                       |  Key  | Description                          | Type       | Default value | Required |
| ------------------------------------------------ | :---: | ------------------------------------ | ---------- | :-----------: | :------: |
| id                                               |  PK   | Unique ID                            | Integer    |   sequence    |    N     |
| data_matrix                                      |   -   | Data matix value (Unique)            | BigInteger |       -       |    Y     |
| po_number                                        |   -   | PO number                            | Varchar    |       -       |    Y     |
| active                                           |   -   | Is the item active                   | Bool       |       Y       |    N     |
| [sap_productino_order_id](#sap-production-order) |  FK   | Item from the SAP table              | Integer    |       -       |    N     |
| [virtual_assembly_id](#virtual-assemblies)       |  FK   | Item from the Virtual Assembly table | Integer    |       -       |    N     |
| [qa_reason_id](#quality-reasons)                 |   -   | Quality status                       | Integer    |       -       |    N     |

## Product Histories
History item of a product

| Field name  |  Key  | Description              | Type      | Default value | Required |
| ----------- | :---: | ------------------------ | --------- | :-----------: | :------: |
| id          |  PK   | Unique ID                | Integer   |   sequence    |    N     |
| created_at  |   -   | Time the item created    | Timestamp |      now      |    N     |
| created_by  |   -   | User who create the item | Integer   |       -       |    Y     |
| qa_item_id  |   -   | QA item                  | Integer   |       -       |    N     |
| job_item_id |   -   | Job that made by user    | Integer   |       -       |    Y     |



## Virtual Assemblies
Collection of assembled products.

| Field name |  Key  | Description | Type    | Default value | Required |
| ---------- | :---: | ----------- | ------- | :-----------: | :------: |
| id         |  PK   | Unique ID   | Integer |   sequence    |    -     |
