Using TrainDB Server
====================

TrainDB can be used without a server process, but it can also be used by running the server process and connecting remotely.
When connecting to the TrainDB server, you need to use the `TrainDB JDBC driver for server <https://github.com/traindb-project/traindb-jdbc>_`.

Starting TrainDB Server
-----------------------

To start your TrainDB server, run ``start-traindb.sh`` in the ``bin`` directory.
The default server address is ``localhost``, and the default server port is ``58000``.
They can be changed in the ``traindb.properties`` configuration file.

.. code-block:: console

  $ cd $TRAINDB_HOME/bin
  $ ./start-traindb.sh

Connecting to TrainDB Server
----------------------------

When connecting to the TrainDB server, the JDBC connection string should be modified as follows:

* Connecting with a source DBMS: specify the TrainDB server address by adding the ``server.host`` and ``server.port`` parameters at the end of the connection string.

.. code-block:: console

  jdbc:traindb:<dbms>://<dbms url>?server.host=<TrainDB server host>&server.port=<TrainDB server port>

* Connecting to TrainDB in standalone: specify the TrainDB server address without DBMS url as follows.

.. code-block:: console

  jdbc:traindb://<TrainDB server host>:<TrainDB server port>

Connecting to TrainDB Server (Python)
-------------------------------------

The following is an example of connecting to the MySQL data source at localhost through a TrainDB server running on localhost in Python.
It is assumed that the TrainDB JDBC driver for server is located in the current directory in this example.
Please change the directory path, DBMS user and password appropriately.

.. code-block:: python

  import jaydebeapi

  db_url = "jdbc:traindb:mysql://localhost:3306?server.host=localhost&server.port=58000"
  db_user = "root"
  db_password = "root"
  jars = "traindb-jdbc-x.y.jar"
  conn = jaydebeapi.connect("traindb.jdbc.Driver", db_url, [db_user, db_password], jars=jars)


After making a connection, the process of executing SQL statements is the same as described in the JDBC examples.
You can also make a connection to the TrainDB server in the standalone mode as follows.

.. code-block:: python

  import jaydebeapi

  db_url = "jdbc:traindb://localhost:58000"
  db_user = ""
  db_password = ""
  jars = "traindb-jdbc-x.y.jar"
  conn = jaydebeapi.connect("traindb.jdbc.Driver", db_url, [db_user, db_password], jars=jars)

Stopping TrainDB Server
-----------------------

To stop your TrainDB server, run ``stop-traindb.sh`` in the ``bin`` directory.

.. code-block:: console

  $ cd $TRAINDB_HOME/bin
  $ ./stop-traindb.sh

Preparing TrainDB JDBC Driver for Server
----------------------------------------

Download
~~~~~~~~

The public repository of TrainDB JDBC Driver for Server is `https://github.com/traindb-project/traindb-jdbc <https://github.com/traindb-project/traindb-jdbc>`_.
You can download the released file from the address, or you can clone using git as shown below.

.. code-block:: console

  $ git clone https://github.com/traindb-project/traindb-jdbc.git

Build
~~~~~

You can build TrainDB using Maven as shown below.

.. code-block:: console

  $ cd traindb-jdbc
  $ mvn package

Then, the file ``traindb-jdbc-x.y.jar`` is created in the ``target`` directory.

