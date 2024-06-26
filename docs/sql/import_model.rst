IMPORT MODEL
============

Purpose
-------

Use the ``IMPORT MODEL`` statement to import an exported model.
TrainDB provides the feature to export the model files and the metadata file from the catalog store in a zip format using the ``EXPORT MODEL`` statement.
The ``IMPORT MODEL`` statement is for importing an exported model, sending the zip model file as a binary string.
This statement can be executed by binding the model file to a binary string, for example, using the setBytes method of PreparedStatement.

Syntax
------

Diagram
~~~~~~~

**importModel**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/importModel.rrd.svg" width="100%"/>

.. only:: latex

  .. image:: ../_static/rrd/importModel.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**modelName**

This is an identifier that specifies the name of the model to be imported.

**FROM**

Specifies the model file to be imported.
The model file can be passed in binary format after the FROM keyword.
If TrainDB is running on the same machine, the file path to import the model can be specified using the FILE clause.
The file path to import is specified as a string literal.


Examples
--------

Importing a Model
~~~~~~~~~~~~~~~~~

The following statement imports the exported model ``tgan``.

.. code-block:: console

  IMPORT MODEL tgan FROM x'...';

This can be executed by setting the model binary string to ``?`` and binding it.

