# Power Automate API backend
The purpose of the API backend is centralize the interacitons between the user
interface and the database. This layer of the software separates tasks like
visualizin data and changing them in the database. API allow to control read
write opearations in a single separated place, which is individual from other
parts of the application.

## Flow Structure
The API endpoint is the callable function in this system, which is responsible
for a single action to execute in the database.

That means every single action have a single PowerAutomate flow. These flows are
called from PowerApps canvas applications and other PowerAutomate flows.
