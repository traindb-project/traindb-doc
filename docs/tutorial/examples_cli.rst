Examples: Using CLI
===================

Running CLI Tool
----------------

TrainDB provides ``trsql`` that can execute SQL statements through CLI. ``trsql`` is originally from `sqlline <https://github.com/julianhyde/sqlline>`_, an open source CLI tool.

``trsql`` is in the ``bin`` directory, and you will get a prompt if you run it as follows.

.. code-block:: console

  $ cd $TRAINDB_HOME/bin
  $ ./trsql

  sqlline version 1.11.0
  sqlline>

Connecting a Data Source
------------------------

First, you must connect to a data source to execute an SQL statement. Since the JDBC driver of the source DBMS is required, it must be included in the ``CLASSPATH``. The following is an example of connecting to the MySQL data source at localhost via ``trsql``.

.. code-block:: console

  sqlline> !connect jdbc:traindb:mysql://localhost
  Enter username for jdbc:traindb:mysql://localhost: <username>
  Enter password for jdbc:traindb:mysql://localhost: <password>
  0: jdbc:traindb:mysql//localhost> 

Executing TrainDB SQL statements
--------------------------------

After successful connection, you can execute the SQL statements supported by TrainDB.
Our examples will use the `instacart_small <https://github.com/traindb-project/traindb/tree/main/traindb-core/src/test/resources/datasets/instacart_small>`_ dataset, which is a part of the instacart dataset and is used in the regression test in our project.

Creating a Modeltype
~~~~~~~~~~~~~~~~~~~~

The following is an example of creating and querying a modeltype.

.. code-block:: console

  0: jdbc:traindb:mysql//localhost> CREATE MODELTYPE tablegan FOR SYNOPSIS AS CLASS 'TableGAN' IN 'models/TableGAN.py';
  No rows affected (#.## seconds)
  0: jdbc:traindb:mysql//localhost> SHOW MODELTYPES;
  +-----------+----------+----------+----------+--------------------+
  | modeltype | category | location | class    | uri                |
  +-----------+----------+----------+----------+--------------------+
  | tablegan  | SYNOPSIS | LOCAL    | TableGAN | models/TableGAN.py |
  +-----------+----------+----------+----------+--------------------+

Training a Model
~~~~~~~~~~~~~~~~

The following is an example of training and querying a model using the modeltype created above.

.. code-block:: console

  0: jdbc:traindb:mysql//localhost> TRAIN MODEL tgan MODELTYPE tablegan ON instacart_small.order_products(reordered, add_to_cart_order);
  epoch 1 step 50 tensor(1.1035, grad_fn=<SubBackward0>) tensor(0.7770, grad_fn=<NegBackward>) None
  epoch 1 step 100 tensor(0.8791, grad_fn=<SubBackward0>) tensor(0.9682, grad_fn=<NegBackward>) None
  ...
  No rows affected (###.## seconds)
  0: jdbc:traindb:mysql//localhost> SHOW MODELS;
  +-------+-----------+-----------------+----------------+--------------------------------+-----------------+--------------+---------+
  | model | modeltype | schema          | table          | columns                        | base_table_rows | trained_rows | options |
  +-------+-----------+-----------------+----------------+--------------------------------+-----------------+--------------+---------+
  | tgan  | tablegan  | instacart_small | order_products | [reordered, add_to_cart_order] | 1384617         | 1384617      | {}      |
  +-------+-----------+-----------------+----------------+--------------------------------+-----------------+--------------+---------+

Creating a Synopsis
~~~~~~~~~~~~~~~~~~~

The following is an example of creating and querying a synopsis using the model trained above.

.. code-block:: console

  0: jdbc:traindb:mysql//localhost> CREATE SYNOPSIS order_products_syn FROM MODEL tgan LIMIT 1000;
  No rows affected (#.## seconds)
  0: jdbc:traindb:mysql//localhost> SHOW SYNOPSES;
  +--------------------+-------+-----------+----------------+--------------------------------+------+------------+
  | synopsis           | model | schema    | table          | columns                        | rows | ratio      |
  +--------------------+-------+-----------+----------------+--------------------------------+------+------------+
  | order_products_syn | tgan  | instacart | order_products | [reordered, add_to_cart_order] | 1000 | 0.00072222 |
  +--------------------+-------+-----------+----------------+--------------------------------+------+------------+

Running an Approximate Query
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following is an example of running an approximate query.
For aggregate queries, you can execute approximate queries using ``SELECT APPROXIMATE`` keywords.
Then, the query result is approximated using a synopsis instead of the original table.
The approximated result will be different depending on the generated synopsis.

.. code-block:: console

  0: jdbc:traindb:mysql//localhost> SELECT APPROXIMATE sum(reordered) FROM instacart_small.order_products;

Please compare the results with the exact query below.

.. code-block:: console

  0: jdbc:traindb:mysql//localhost> SELECT sum(reordered) FROM instacart_small.order_products;
