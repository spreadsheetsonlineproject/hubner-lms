# Relations Between Tables

The definition of tables in the
[Schemas of the tables in the database](TableSchemas.md) article describes the
relations via the foreign key definitions. This page will give you a better
understanding about the connections between different tables.

``` mermaid 
erDiagram

users
jobs ||--|{ flow_items : related
jobs }|--|| permissions : allowed
jobs ||--|{ job_items : created
users ||--|{ job_items : created
jobs ||--|{ job_workstation_links : assigned
worstations ||--|{ job_workstation_links : assigned
groups ||--|{ group_permission_links : has
permissions ||--|{ group_permission_links : has
groups ||--|{ group_job_links : allowed
jobs ||--|{ group_job_links : allowed
users ||--|{ user_group_links : member
groups ||--|{ user_group_links : member
qa_reasons }|--|| severity_levels : defined
users ||--|{ qa_items : created
qa_reasons ||--|{ qa_items : marked
products }|--|| sap_production_orders : master
products }|--|| virtual_assemblys : assembled
products }|--|| qa_reasons : marked
products ||--|{ product_histories : created
users ||--|{ product_histories : created
qa_items ||--|{ product_histories : marked
job_items ||--|{ product_histories : made
virtual_assemblies }|--|{ qa_reasons : marked
products ||--|{ product_virtal_assembly_links : part
virtual_assemblies ||--|{ product_virtal_assembly_links : part
```
