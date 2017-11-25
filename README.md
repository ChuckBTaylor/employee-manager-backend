So far there are two slightly fleshed-out models

1. Employee
  * Name: string
  * schedule\_color: string
  * id: integer
  * is\_admin: boolean
  * company\_id: integer
2. Schedule
  * employee\_id: integer
  * scheduled\_start: datetime
  * scheduled\_end: datetime
  * actual\_start: datetime
  * actual\_end: datetime
  * is\_holiday: boolean
  * break\_took: float
3. Service
  * name: string
  * company\_id: integer


Eventually there'll have to be a few join tables once I get the connection between other companies and contracts and what work needs to be done on any given service.

[Frontend Repo](https://github.com/ChuckBTaylor/employee-manager-frontend)
