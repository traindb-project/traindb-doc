Examples: Using JDBC in Python
==============================

In Python, TrainDB can also be used with a JDBC support package such as JayDeBeApi.
You can refer a `tutorial <https://colab.research.google.com/github/traindb-project/traindb/blob/main/examples/traindb_tutorial.ipynb>`_  available in Google Colab.

Connecting a Data Source
------------------------

First, you must connect to a data source to execute an SQL statement.
The following is an example of connecting to the MySQL data source at localhost.
Please change the directory path, DBMS user and password appropriately.

.. code-block:: python

  import os
  import glob
  import jaydebeapi
  import sys

  ###################
  # required setting
  ###################
  os.environ['TRAINDB_PREFIX'] = "/content/traindb/traindb-root"
  db_url = "jdbc:traindb:mysql://localhost:3306"
  db_user = "root"
  db_password = "root"

  jars = glob.glob(os.environ['TRAINDB_PREFIX'] + "/share/**/*.jar", recursive=True)
  conn = jaydebeapi.connect("traindb.jdbc.Driver", db_url, [db_user, db_password], jars=jars)

Executing TrainDB SQL statements
--------------------------------

After successful connection, you can execute the SQL statements supported by TrainDB.
Our examples will use the `instacart_small <https://github.com/traindb-project/traindb/tree/main/traindb-core/src/test/resources/datasets/instacart_small>`_ dataset, which is a part of the instacart dataset and is used in the regression test in our project.

Creating a Modeltype
~~~~~~~~~~~~~~~~~~~~

The following is an example of creating a modeltype.

.. code-block:: python

  ...
  stmt = conn.jconn.createStatement()
  stmt.execute("CREATE MODELTYPE tablegan FOR SYNOPSIS AS CLASS 'TableGAN' IN 'models/TableGAN.py'")

Training a Model
~~~~~~~~~~~~~~~~

The following is an example of training a model using the modeltype created above.

.. code-block:: python

  ...
  stmt = conn.jconn.createStatement()
  stmt.execute("TRAIN MODEL tgan MODELTYPE tablegan ON instacart_small.order_products(reordered, add_to_cart_order)")

Creating a Synopsis
~~~~~~~~~~~~~~~~~~~

The following is an example of creating a synopsis using the model trained above.

.. code-block:: python

  ...
  stmt = conn.jconn.createStatement()
  stmt.execute("CREATE SYNOPSIS order_products_syn FROM MODEL tgan LIMIT 1000")

Running an Approximate Query
~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following is an example of running an approximate query.
For aggregate queries, you can execute approximate queries using ``SELECT APPROXIMATE`` keywords.
Then, the query result is approximated using a synopsis instead of the original table.
The approximated result will be different depending on the generated synopsis.

.. code-block:: python

  ...
  curs = conn.cursor()
  curs.execute("SELECT APPROXIMATE sum(reordered) FROM instacart_small.order_products")
  rs = curs.fetchall()
  ...

Please compare the results with the exact query below.

.. code-block:: python

  ...
  curs = conn.cursor()
  curs.execute("SELECT sum(add_to_cart_order) FROM instacart_small.order_products")
  rs = curs.fetchall()
  ...
