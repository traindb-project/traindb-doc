CREATE SYNOPSIS
===============

Purpose
-------

Use the ``CREATE SYNOPSIS`` statement to create a synopsis data from a synopsis generative model that has been trained in advance. A synopsis is synthetic data which are similar to the original data, but not the data sampled from the original data.

The synopsis table consists of the columns that specified when training the generative model, and is stored in the catalog schema that the original table is contained.


Syntax
------

Diagram
~~~~~~~

**createSynopsis**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/createSynopsis1.rrd.svg"/>
    <embed type="image/svg+xml" src="../_static/rrd/createSynopsis2.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/createSynopsis1.rrd.*
  .. image:: ../_static/rrd/createSynopsis2.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**synopsisName**

This is an identifier that specifies the name of the synopsis to be created.

**AS**

Specifies the format of the synopsis to be generated.
By default, it is created as a table of the DBMS if the source DBMS is connected, otherwise it is created as an external file.
Use the TABLE and FILE keywords if you want to explicitly specify the format of the synopsis as a table or file, respectively.

**modelName**

This is an identifier that specifies the name of the synopsis generative model.

**LIMIT**

Specifies the number of rows to be generated as the number of rows, or as a percentage to the number of rows in the original table.


Examples
--------

Creating a Synopsis
~~~~~~~~~~~~~~~~~~~

The following statement creates a synopsis table ``order_products_syn`` with 10,000 rows from the generative model ``tgan``.

.. code-block:: console

  CREATE SYNOPSIS order_products_syn FROM MODEL tgan LIMIT 10000 ROWS;
