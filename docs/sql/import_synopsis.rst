IMPORT SYNOPSIS
===============

Purpose
-------

Use the ``IMPORT SYNOPSIS`` statement to import an exported synopsis.
TrainDB provides the feature to export the synopsis files and the metadata file from the catalog store in a zip format using the ``EXPORT SYNOPSIS`` statement.
The ``IMPORT SYNOPSIS`` statement is for importing an exported synopsis, sending the zip synopsis file as a binary string.
This statement can be executed by binding the synopsis file to a binary string, for example, using the setBytes method of PreparedStatement.

Syntax
------

Diagram
~~~~~~~

**importSynopsis**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/importSynopsis.rrd.svg" width="100%"/>
    <embed type="image/svg+xml" src="../_static/rrd/importSynopsis2.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/importSynopsis.rrd.*
  .. image:: ../_static/rrd/importSynopsis2.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**synopsisName**

This is an identifier that specifies the name of the synopsis to be imported.

**FROM**

Specifies the synopsis file to be imported.
The synopsis file can be passed in binary format after the FROM keyword.
If TrainDB is running on the same machine, the file path to import the synopsis can be specified using the FILE clause.
The file path to import is specified as a string literal.


Examples
--------

Importing a Synopsis
~~~~~~~~~~~~~~~~~~~~

The following statement imports the exported synopsis ``order_products_syn``.

.. code-block:: console

  IMPORT SYNOPSIS order_products_syn FROM x'...';

This can be executed by setting the synopsis binary string to ``?`` and binding it.

