EXPORT MODEL
============

Purpose
-------

Use the ``EXPORT MODEL`` statement to export a trained model.
This statement compresses the trained model files and the metadata file from the catalog store together in zip format and returns it in binary format.
Using the ``EXPORT MODEL`` statement, you can use a model in another TrainDB instance by saving its result data as a zip file in your application.

Syntax
------

Diagram
~~~~~~~

**exportModel**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/exportModel.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/exportModel.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**modelName**

This is an identifier that specifies the name of the model to be exported.


Examples
--------

Exporting a Model
~~~~~~~~~~~~~~~~~

The following statement exports the trained model ``tgan``.

.. code-block:: console

  EXPORT MODEL tgan;

