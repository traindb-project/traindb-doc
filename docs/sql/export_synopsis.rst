EXPORT SYNOPSIS
===============

Purpose
-------

Use the ``EXPORT SYNOPSIS`` statement to export a generated synopsis.
This statement compresses the synopsis data files and the metadata file from the catalog store together in zip format and returns it in binary format.
Using the ``IMPORT SYNOPSIS`` statement, you can use the synopsis in another TrainDB instance by saving its result data as a zip file in your application.

Syntax
------

Diagram
~~~~~~~

**exportSynopsis**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/exportSynopsis.rrd.svg" width="100%"/>

.. only:: latex

  .. image:: ../_static/rrd/exportSynopsis.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**synopsisName**

This is an identifier that specifies the name of the synopsis to be exported.

**TO FILE**

If TrainDB is running on the same machine, the file path to export the synopsis can be specified using the TO FILE clause.
The file path to export is specified as a string literal.
If not specified, the exported synopsis file is returned in binary format.


Examples
--------

Exporting a Synopsis
~~~~~~~~~~~~~~~~~~~~

The following statement exports the generated synopsis ``order_products_syn``.

.. code-block:: console

  EXPORT SYNOPSIS order_products_syn;
