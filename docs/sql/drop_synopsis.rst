DROP SYNOPSIS
=============

Purpose
-------

Use the ``DROP SYNOPSIS`` statement to remove the synopsis table from the database.

Syntax
------

Diagram
~~~~~~~

**dropSynopsis**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/dropSynopsis.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/dropSynopsis.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**synopsisName**

This is an identifier that specifies the name of the synopsis to be dropped.


Examples
--------

Dropping a Synopsis
~~~~~~~~~~~~~~~~~~~

The following statement drops the synopsis ```order_products_syn```.

.. code-block:: console

  DROP SYNOPSIS order_products_syn;
