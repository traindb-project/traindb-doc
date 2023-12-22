SELECT
======

Purpose
-------

Use the ``SELECT`` statement to retrieve data from tables.

Since TrainDB is implemented based on Apache Calcite, please refer to the `SQL Reference of Apache Calcite <https://calcite.apache.org/docs/reference.html>`_ for exact SELECT queries.

This document focuses on the ``SELECT APPROXIMATE`` statement for approximate queries in TrainDB.

Syntax
------

Diagram
~~~~~~~

**select**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/select1.rrd.svg"/>
    <embed type="image/svg+xml" src="../_static/rrd/select2.rrd.svg"/>
    <embed type="image/svg+xml" src="../_static/rrd/select3.rrd.svg"/>
    <embed type="image/svg+xml" src="../_static/rrd/select4.rrd.svg"/>
    <embed type="image/svg+xml" src="../_static/rrd/select5.rrd.svg"/>
    <embed type="image/svg+xml" src="../_static/rrd/select6.rrd.svg"/>
    <embed type="image/svg+xml" src="../_static/rrd/select7.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/select1.rrd.*
  .. image:: ../_static/rrd/select2.rrd.*
  .. image:: ../_static/rrd/select3.rrd.*
  .. image:: ../_static/rrd/select4.rrd.*
  .. image:: ../_static/rrd/select5.rrd.*
  .. image:: ../_static/rrd/select6.rrd.*
  .. image:: ../_static/rrd/select7.rrd.*

**selectItemList**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/selectItemList.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/selectItemList.rrd.*

**selectItem**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/selectItem.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/selectItem.rrd.*

**tableExpression**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/tableExpression.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/tableExpression.rrd.*

**tableReference**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/tableReference.rrd.svg" width="100%" height="100%"/>

.. only:: latex

  .. image:: ../_static/rrd/tableReference.rrd.*

**tablePrimary**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/tablePrimary.rrd.svg" width="100%" height="100%"/>

.. only:: latex

  .. image:: ../_static/rrd/tablePrimary.rrd.*

**groupItemList**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/groupItemList.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/groupItemList.rrd.*

**groupItem**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/groupItem.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/groupItem.rrd.*

**orderItemList**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/orderItemList.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/orderItemList.rrd.*

**orderItem**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/orderItem.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/orderItem.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**APPROXIMATE**

Specify ``APPROXIMATE`` to indicate the query is an approximate query.
If the following conditions are satisfied, the query is processed as an approximate query.
Otherwise, this keyword is ignored and the query is processed as an exact query.
* ``selectItemList`` includes aggregate functions that support approximation queries. 
* There is a model or a synopsis that learned the columns specified in ``selectItemList``.

Currently, ``avg``, ``sum``, ``count``, ``stddev``, ``variance``, ``covar``, and ``corr`` aggregate functions are supported for approximate queries.

The ``GROUP BY``, ``HAVING``, and ``ORDER BY`` clauses can be used together in an approximate query.

**selectItemList**

Specify the list of columns or expressions to be retrieved.

**FROM tableExpression**

Specify the tables from which data is selected.
Additionally, aliases and column lists can be specified.

**WHERE booleanExpression**

Specify search or filter conditions to retrieve only the rows which satisfy the conditions.
If the ``WHERE`` clause is omitted, all rows are retrieved.

**GROUP BY groupItemList**

The ``GROUP BY`` clause groups retrieved rows based on the expressions in ``groupItemList``.
The column specified in the GROUP BY clause must be included in the selectItemList.

**HAVING booleanExpression**

The ``HAVING`` clause can be used to retrieved the grouped results that satisfy the specified conditions.
If the ``HAVING`` clause is omitted, all grouped results are retrieved.

**ORDER BY orderItemList**

The ``ORDER BY`` clause sorts retrieved rows by the specified order of the expressions in ``orderItemList``.
If the ``ORDER BY`` clause is omitted, the retrieved rows are retuned in an arbitrary order.

**WITHIN numeric_literal SECONDS**

The ``WITHIN ~ SECONDS`` clause specifies an execution time limit of the input approximate query.
The query processing time is not guaranteed, but the specified time limit serves as an optimization hint for selecting synopses or models to be used. Currently, a simple policy that selects a synopsis according to the number of rows has been implemented, and the number of rows per second can be adjusted with a configuration parameter.

**WITHIN numeric_literal PERCENT ERROR**

The ``WITHIN ~ PERCENT ERROR`` clause specifies an error rate limit of the input approximate query.
The accuracy is not guaranteed, but the specified error rate serves as an optimization hint for selecting synopses or models to be used.
For this clause to work, the data distribution of the synopsis must be analyzed through the ``ANALYZE SYNOPSIS`` statement so that the accuracy of the synopsis can be considered when processing queries.

**SYNOPSIS hint**

A synopsis to be used for approximate query processing can be specified as a hint, such as ``SELECT /*+ SYNOPSIS(synopsis_name) */ APPROXIMATE``. If the specified synopsis exists and can be used to process the input query, the query will be processed using the synopsis.


Examples
--------

Approximate Query
~~~~~~~~~~~~~~~~~

The following statement approximately retrieves the sum of the ``reordered`` columns of the ``order_products`` table in the ``instacart`` schema.

.. code-block:: console

  SELECT APPROXIMATE sum(reordered) FROM instacart.order_products;

The ``WHERE``, ``GROUP BY``, or ``ORDER BY`` clauses can also be specified according to the user intent.

.. code-block:: console

  SELECT APPROXIMATE sum(reordered) FROM instacart.order_products
  WHERE add_to_cart_order < 5;

.. code-block:: console

  SELECT APPROXIMATE sum(reordered) FROM instacart.order_products
  GROUP BY add_to_cart_order
  ORDER BY add_to_cart_order ASC;
