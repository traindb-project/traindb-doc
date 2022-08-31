USE
===

Purpose
-------

The ``USE`` statement sets the named schema as the default (current) schema.

Syntax
------

Diagram
~~~~~~~

**use**

.. only:: html

  .. raw:: html

    <embed src="../_static/rrd/use.rrd.svg" type="image/svg+xml"/>

.. only:: latex

  .. image:: ../_static/rrd/use.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**schemaName**

This is an identifier that specifies the name of the schema to be used as the default schema.


Examples
--------

Changing the Default Schema
~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following statement sets the ``instacart`` schema as the default schema.

.. code-block:: console

  USE instacart;
