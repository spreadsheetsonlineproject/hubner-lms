# Feature list

The Lifecycle Management System capabilities are improved continuously.

## Detailed history of production processes

The save events of the applications create a history item in the database. 
These history items store the timestamp of the action with the user and 
workstation information.

As the save events can represent multiple actions through the production 
process, the changes on the production order, the quality status are stored 
on other level of the history. The details of changes are linked to a product.

<code-block lang="mermaid">
mindmap
  root((Save event))
    Session History
        Product 1 history
          QA Status change
            From Status
            To Status
          Production Order change
            From PO number
            To PO number
        Product 2 history
          QA Status change
            From Status
            To Status
          Production Order change
            From PO number
            To PO number
</code-block>

## Admin application

![home](admin_home_screen.png ':size=50% :align=center')

The admin application allows the superusers to maintain the Lifecycle 
Management System and the behaviour of the production applications.

### User management

![users](admin_user_screen.png ':size=50% :align=center')

Creating new user and deactivate existing one is available in the user 
management section of the admin application.
The users can be assigned to different user roles. These user roles define 
the user capabilities.

### Role management

User roles or user groups are the different levels of user capabilities in 
the system.

### Workstation management

### Job management

### QA Reason management

### Metadata management

The metadata data table stores key values about the behaviour of certain 
parts of the applications

The administrator is able to turn on and off the attachment capabilities, 
change the product documentation SharePoint folder, the number of 
attachments, and other key features.

## Attach file to saved actions

Application allows the user to add images, PDF documents and other digital 
content to any saved event.

This feature can be very helpful with the quality issues to identify and 
investigate the problem.

## Log in with unique ID

Users are able to log in the system by scanning a single 2D bar code on 
their badge.