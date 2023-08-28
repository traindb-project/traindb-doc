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
    <embed type="image/svg+xml" src="../_static/rrd/showFilterCondition.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/show.rrd.*
  .. image:: ../_static/rrd/showFilterCondition.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**MODELTYPES**

Specify ``MODELTYPES`` to list the modeltypes.

**MODELS**

Specify ``MODELS`` to list the trained models.

**HYPERPARAMETERS**

Specify ``HYPERPARAMETERS`` to list the hyperparameters used in modeltypes.

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

**TRAININGS**

Specify ``TRAININGS`` to list the model training status.

**showFilterCondition**

Specifies filter conditions to retrieve only the rows which satisfy the conditions.


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

Listing Hyperparameters
~~~~~~~~~~~~~~~~~~~~~~~

The following statement lists the hyperparameters of the modeltype ``ctgan``. 

.. code-block:: console

  SHOW HYPERPARAMETERS WHERE modeltype_name = 'ctgan';

The following statement lists the hyperparameters of the modeltypes whose names contain ``gan``. 

.. code-block:: console

  SHOW HYPERPARAMETERS WHERE modeltype_name LIKE '%gan%';

Listing Synopses
~~~~~~~~~~~~~~~~

The following statement lists the generated synopses.

.. code-block:: console

  SHOW SYNOPSES;

