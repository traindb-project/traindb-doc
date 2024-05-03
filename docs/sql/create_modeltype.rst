CREATE MODELTYPE
================

Purpose
-------

Use the ``CREATE MODELTYPE`` statement to create a modeltype, which is an object that defines the architecture of ML model to be built by training data.
A modeltype can be separately trained on individual dataset, and hyperparameters can be specified for each model training.

Syntax
------

Diagram
~~~~~~~

**createModeltype**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/createModeltype1.rrd.svg"/>
    <embed type="image/svg+xml" src="../_static/rrd/createModeltype2.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/createModeltype1.rrd.*
  .. image:: ../_static/rrd/createModeltype2.rrd.*


**modeltypeSpecClause**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/modeltypeSpecClause.rrd.svg" width="100%"/>

.. only:: latex

  .. image:: ../_static/rrd/modeltypeSpecClause.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**modeltypeName**

This is an identifier that specifies the name of the modeltype to be created.

**SYNOPSIS**

Specify ``SYNOPSIS`` if the modeltype is a synopsis generative modeltype.

**INFERENCE**

Specify ``INFERENCE`` if the modeltype is a inferential modeltype.

**modeltypeSpecClause**

This clause specifies the details of the modeltype.

**LOCAL**

Specify ``LOCAL`` if the modeltype is on the same machine. It can be omitted.

**REMOTE**

Specify ``REMOTE`` if the modeltype is on a remote machine.

**'modeltypeClassName'**

This is a string literal that specifies the class of the model type in the file/service at ``modelUri``.

**'modelUri'**

This is a string literal that specifies the directory path for local modeltype or the connection URL for remote modeltype.


Examples
--------

Creating a Local Modeltype
~~~~~~~~~~~~~~~~~~~~~~~~~~

The following statement creates a local synopsis generative modeltype ``tablegan`` as the class ``TableGAN`` in the directory path 'models/TableGAN.py'.

.. code-block:: console

  CREATE MODELTYPE tablegan FOR SYNOPSIS AS CLASS 'TableGAN' IN 'models/TableGAN.py';

The following statement creates a local inferential modeltype ``rspn`` as the class ``RSPN`` in the directory path 'models/RSPN.py'.

.. code-block:: console

  CREATE MODELTYPE rspn FOR INFERENCE AS CLASS 'RSPN' IN 'models/RSPN.py';

Creating a Remote Modeltype
~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following statement creates a remote synopsis generative modeltype ``remote_tablegan`` as the class ``TableGAN`` in the directory path 'http://<host>:<port>'.
It is assumed that the TrainDB model server is running at the specified address.

.. code-block:: console

  CREATE MODELTYPE remote_tablegan FOR SYNOPSIS AS REMOTE CLASS 'TableGAN' IN 'http:/<host>:<port>/';
