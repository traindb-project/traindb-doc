ANALYZE SYNOPSIS
================

Purpose
-------

Use the ``ANALYZE SYNOPSIS`` statement to analyze the quality of the synopsis by comparing the distribution of the synopsis data with that of the original data.
When a user requests an approximation query with an error constraint using the ``WITHIN ~ PERCENT ERROR`` clause, the synopsis for query processing is chosen by considering the quality information of analyzed synopses.

Syntax
------

Diagram
~~~~~~~

**analyzeSynopsis**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/analyzeSynopsis.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/analyzeSynopsis.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**synopsisName**

This is an identifier that specifies the name of the synopsis to be analyzed.


Examples
--------

Analyzing a Synopsis
~~~~~~~~~~~~~~~~~~~

The following statement analyzes the data distribution of a synopsis ``order_products_syn``.

.. code-block:: console

  ANALYZE SYNOPSIS order_products_syn;
