ALTER SYNOPSIS
==============

Purpose
-------

Use the ``ALTER SYNOPSIS`` statement to alter the definition of an existing synopsis.

Syntax
------

Diagram
~~~~~~~

**alterSynopsis**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/alterSynopsis.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/alterSynopsis.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**synopsisName**

This is an identifier that specifies the name of the synopsis to be altered.

**RENAME TO**

Use the RENAME TO clause to rename synopsisName to newSynopsisName.

**newSynopsisName**

This is an identifier that specifies a new synopsis name.

**ENABLE**

Use the ENABLE clause to changes the specified synopsis to ``ENABLED`` status so that it can be used for approximate query processing.

**DISABLE**

Use the DISABLE clause to changes the specified synopsis to ``DISABLED`` status so that it cannot be used for approximate query processing.
It can be re-enabled by executing the ``ALTER SYNOPSIS`` statement with the ``ENABLE`` option.


Examples
--------

Altering a Synopsis
~~~~~~~~~~~~~~~~~~~

The following statement renames an existing synopsis ``order_products_syn`` to ``order_products_syn_old``.

.. code-block:: console

  ALTER SYNOPSIS order_products_syn RENAME TO order_products_syn_old;


The following statement disables the synopsis ``order_products_syn_old``.

.. code-block:: console

  ALTER SYNOPSIS order_products_syn_old DISABLE;


