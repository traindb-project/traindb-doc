SHOW
====

Purpose
-------

Use the ``SHOW`` statement to list the objects including modeltypes, models, and synopses.

Syntax
------

Diagram
~~~~~~~

**show**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/show.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/show.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**MODELTYPES**

Specify ``MODELTYPES`` to list the modeltypes.

**MODELS**

Specify ``MODELS`` to list the trained models.

**SYNOPSES**

Specify ``SYNOPSES`` to list the generated synopses.

**SCHEMAS**

Specify ``SCHEMAS`` to list the schemas in the connected data source.

**TABLES**

Specify ``SCHEMAS`` to list the tables in the current schema.

**QUERYLOGS**

Specify ``QUERYLOGS`` to list the queries that have been executed. It works only if it is set to record the query logs in the configuration.

**TASKS**

Specify ``TASKS`` to list the tasks of the queries that have been executed. It works only if it is set to record the task traces in the configuration.


Examples
--------

Listing Modeltypes
~~~~~~~~~~~~~~~~~~

The following statement lists the modeltypes.

.. code-block:: console

  SHOW MODELTYPES;

Listing Models
~~~~~~~~~~~~~~

The following statement lists the trained models.

.. code-block:: console

  SHOW MODELS;

Listing Synopses
~~~~~~~~~~~~~~~~

The following statement lists the generated synopses.

.. code-block:: console

  SHOW SYNOPSES;
