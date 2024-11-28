ALTER MODEL
===========

Purpose
-------

Use the ``ALTER MODEL`` statement to alter the definition of an existing model.

Syntax
------

Diagram
~~~~~~~

**alterModel**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/alterModel.rrd.svg" width="100%" height="100%"/>

.. only:: latex

  .. image:: ../_static/rrd/alterModel.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**modelName**

This is an identifier that specifies the name of the model to be altered.

**RENAME TO**

Use the RENAME TO clause to rename modelName to newModelName.

**newModelName**

This is an identifier that specifies a new model name.

**ENABLE**

Use the ENABLE clause to changes the specified model to ``ENABLED`` status so that it can be used for synopsis generation or approximate query processing.

**DISABLE**

Use the DISABLE clause to changes the specified model to ``DISABLED`` status so that it cannot be used for synopsis generation or approximate query processing.
It can be re-enabled by executing the ``ALTER MODEL`` statement with the ``ENABLE`` option.


Examples
--------

Altering a Model
~~~~~~~~~~~~~~~~

The following statement renames an existing model ``tgan`` to ``tgan_old``.

.. code-block:: console

  ALTER MODEL tgan RENAME TO tgan_old;


The following statement disables the model ``tgan_old``.

.. code-block:: console

  ALTER MODEL tgan_old DISABLE;


