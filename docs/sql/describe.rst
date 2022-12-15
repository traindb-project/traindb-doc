DESCRIBE
========

Purpose
-------

Use the ``DESCRIBE`` statement to display information about columns in a given table.

Syntax
------

Diagram
~~~~~~~

**describe**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/describe.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/describe.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**schemaName**

This is an identifier that specifies the name of the schema that contains the table to be displayed.
If not specified, the default (current) schema is used.

**tableName**

This is an identifier that specifies the name of the table to be displayed.


Examples
--------

Displaying Columns in a Table
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following is an example of displaying information about columns in the table ``order_products``.

.. code-block:: console

  DESCRIBE instacart.order_products;
