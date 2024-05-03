EXPORT MODEL
============

Purpose
-------

Use the ``EXPORT MODEL`` statement to export a trained model.
This statement compresses the trained model files and the metadata file from the catalog store together in zip format and returns it in binary format.
Using the ``IMPORT MODEL`` statement, you can use a model in another TrainDB instance by saving its result data as a zip file in your application.

Syntax
------

Diagram
~~~~~~~

**exportModel**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/exportModel.rrd.svg" width="100%"/>

.. only:: latex

  .. image:: ../_static/rrd/exportModel.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**modelName**

This is an identifier that specifies the name of the model to be exported.

**TO FILE**

If TrainDB is running on the same machine, the file path to export the model can be specified using the TO FILE clause.
The file path to export is specified as a string literal.
If not specified, the exported model file is returned in binary format.


Examples
--------

Exporting a Model
~~~~~~~~~~~~~~~~~

The following statement exports the trained model ``tgan``.

.. code-block:: console

  EXPORT MODEL tgan;

