DROP MODEL
==========

Purpose
-------

Use the ``DROP MODEL`` statement to remove the model.
This statement removes only the model metadata in the catalog store, and actual model files will be remained.

Syntax
------

Diagram
~~~~~~~

**dropModel**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/dropModel.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/dropModel.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**modelName**

This is an identifier that specifies the name of the model to be dropped.


Examples
--------

Dropping a Model
~~~~~~~~~~~~~~~~

The following statement drops the model ``tgan``.

.. code-block:: console

  DROP MODEL tgan;
