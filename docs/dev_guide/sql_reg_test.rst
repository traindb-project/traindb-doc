How to Run SQL Regression Tests
===============================

Loading Test Database
---------------------

To run the SQL regression test, you must first load the test dataset into your source DBMS.
It is necessary to load our test dataset in the `traindb-core/src/test/resources/datasets <https://github.com/traindb-project/traindb/tree/main/traindb-core/src/test/resources/datasets>`_ directory.
The following test datasets are used in our SQL regression tests.

* ``instacart_small``: a small part of `instacart dataset <https://www.kaggle.com/c/instacart-market-basket-analysis/>`_

Since the loading script is included, you can create the test database and load data by running the script.
For example, the ``instacart_small`` dataset can be loaded into MySQL as follows.

.. code-block:: console

  $ mysql -u [user id] -p < load_mysql.sql

Configuring Test Database
-------------------------

You can find the ``traindb-test-config.json.template`` file in the `traindb-core/src/test/resources <https://github.com/traindb-project/traindb/tree/main/traindb-core/src/test/resources>`_ directory.
Rename this file to ``traindb-test-config.json``, and fill in your test database information.

.. code-block:: console
  [
    {
      "name": "instacart_small",
      "url": "jdbc:traindb:mysql://localhost:3306",
      "user": "user id",
      "password": "password"
    }
  ]

Running SQL Regression Tests
----------------------------

Our project runs SQL regression tests using the `Quidem <https://github.com/julianhyde/quidem>`_ framework along with Apache Calcite.
The SQL test scripts have an extension of ``.iq`` and are located in the `traindb-core/src/test/resources/sql <https://github.com/traindb-project/traindb/tree/main/traindb-core/src/test/resources/sql>`_ directory.

You can run SQL regression tests using maven as follows.

.. code-block:: console

  $ mvn test -DskipTests=false

Quidem has the unique feature that its output is identical to its input if a script succeeds.
You can easily add test scripts using this feature.
