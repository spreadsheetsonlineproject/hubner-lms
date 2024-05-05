# CRUD Operations

CRUD is stands for Create Read Update Delete. These are the basic database
operations. This is the place where the simple objects are retrieved from the
database. Cloud flows with the name that starts with CRUD are the members of the
database layer of the applications. Only these flows make interaction with the
database directly.

CRUD layer defines the schemas of the objects in the application. Any changes in
the database must be applied here and the rest of the system will work as
expected.

## Implementation

CRUD actions are managed by **Power Automate** flows. CRUD cloud flows are
always triggered by the ***"Manually Trigger a flow"***
trigger. This approach allows us to call these flows directly from other cloud
flows.

