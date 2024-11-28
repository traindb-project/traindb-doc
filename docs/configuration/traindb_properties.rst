traindb.properties
==================

Server Parameters
-----------------
.. list-table:: traindb.server.*
   :widths: 25 25 50
   :header-rows: 1

   * - Name
     - Value
     - Description
   * - traindb.server.address
     - **localhost:58000**
     - The address of the TrainDB server
   * - traindb.server.session.max
     - **100**
     - The maximumn number of sessions
   * - traindb.server.querylog
     - true, **false**
     - Whether or not the query logs are recorded
   * - traindb.server.tasktrace
     - true, **false**
     - Whether or not the task information of the queries is recorded
   * - traindb.server.modelrunner
     - **file**, py4j
     - Which model runner to use when running local modeltypes
   * - traindb.server.default.charset
     - **UTF-8**
     - Default character set
   * - traindb.server.default.nationalcharset
     - **UTF-8**
     - Default national character set


Catalog Store Parameters
------------------------
.. list-table:: catalog.store.*
   :widths: 25 25 50
   :header-rows: 1

   * - Name
     - Value
     - Description
   * - catalog.store.driver
     - **org.sqlite.JDBC**
     - The JDBC driver class of the catalog store DBMS
   * - catalog.store.uri
     - **jdbc:sqlite://${TRAINDB_PREFIX}/traindb_catalog_store.db**
     - The URI of the catalog store
   * - catalog.store.username
     - 
     - The username to access the catalog store
   * - catalog.store.passowrd
     - 
     - The password to access the catalog store


Approximate Query Processing Parameters
---------------------------------------
.. list-table:: traindb.aqp.*
   :widths: 25 25 50
   :header-rows: 1

   * - Name
     - Value
     - Description
   * - traindb.aqp.exec.time.policy
     - **row**
     - The policy to use when processing an approximate query with a time limit
   * - traindb.aqp.exec.time.unit-amount
     - **10000000**
     - amount per unit time (second) for the policy

