TRAIN MODEL
===========

Purpose
-------

Use the ``TRAIN MODEL`` statement to build a model by training a modeltype on the columns in a given table.

Syntax
------

Diagram
~~~~~~~

**trainModel**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/trainModel1.rrd.svg" width="100%" height="100%"/>
    <embed type="image/svg+xml" src="../_static/rrd/trainModel2.rrd.svg" width="100%" height="100%"/>

.. only:: latex

  .. image:: ../_static/rrd/trainModel1.rrd.*
  .. image:: ../_static/rrd/trainModel2.rrd.*

**trainDataClause**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/trainDataClause.rrd.svg" width="100%" height="100%"/>
    <embed type="image/svg+xml" src="../_static/rrd/trainDataClause2.rrd.svg" width="100%" height="100%"/>

**columnNameList**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/columnNameList.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/columnNameList.rrd.*

**trainDataConditionClause**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/trainDataConditionClause.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/trainDataConditionClause.rrd.*


**trainSampleClause**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/trainSampleClause.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/trainSampleClause.rrd.*


**trainModelOptionsClause**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/trainModelOptionsClause.rrd.svg" width="100%" height="100%"/>

.. only:: latex

  .. image:: ../_static/rrd/trainModelOptionsClause.rrd.*

**optionKeyValue**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/optionKeyValue.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/optionKeyValue.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**modelName**

This is an identifier that specifies the name of the model to be built.

**modeltypeName**

This is an identifier that specifies the name of the modeltype to be used for model training.

**UPDATE**

Use the UPDATE clause if you want to update the model by training additional data on an existing model.

**LIKE**

Use the LIKE clause if you want to train a model with the same columns as the existing model.

**exModelName**

This is an identifier that specifies the name of the existing model.

**trainDataClause**

Specify the target data for model training.
To train a model on columns from multiple tables, specify them using the JOIN clause.

**schemaName**

This is an identifier that specifies the name of the schema that contains the training target table.
If not specified, the default (current) schema is used.

**tableName**

This is an identifier that specifies the name of the training target table.

**columnNameList**

Specify the target columns for model training. Multiple columns can be specified as a comma-separated list.

**trainDataConditionClause**

Specify the conditions for retrieving target data for model training.
This clause is used to specify join conditions for training a model on multiple tables, or to filter target data for updating an existing model.

**trainSampleClause**

Use the SAMPLE caluse if you want to use only a part of the original table as training data.

**trainModelOptionsClause**

Specify the model training options, including hyperparameters like epochs.
The options that can be specified depend on the modeltype.

**'optionKey'**

This is a string literal that specifies the key of the option.

**optionValue**

This is a string literal or a numeric value that specifies the value of the option.


Examples
--------

Training a Model
~~~~~~~~~~~~~~~~

The following statement trains a model ``tgan`` of the ``tablegan`` modeltype on the columns ``reordered`` and ``add_to_cart_order`` of the ``order_products`` table in the ``instacart`` schema.

.. code-block:: console

  TRAIN MODEL tgan MODELTYPE tablegan
  ON instacart.order_products(reordered, add_to_cart_order);

By adding the ``OPTIONS`` clause, the ``epochs`` hyperparameter can also be specified.

.. code-block:: console

  TRAIN MODEL tgan MODELTYPE tablegan
  ON instacart.order_products(reordered, add_to_cart_order)
  OPTIONS ( 'epochs' = 100 );

It is possible to train a model with data from multiple tables, as shown below.

.. code-block:: console

  TRAIN MODEL tgan_multi_tables MODELTYPE tablegan
  FROM instacart.order_products(reordered, add_to_cart_order, order_id)
  JOIN instacart.orders(order_id, order_dow)
  ON orders.order_id = order_products.order_id;

Updating a Model
~~~~~~~~~~~~~~~~

The following statements train a model ``rspn_op`` of the ``rspn`` modeltype on the columns ``reordered`` and ``add_to_cart_order`` of the ``order_products`` table in the ``instacart`` schema, then train a new model ``rspn_op_update`` by updating the model with additional data.

.. code-block:: console

  TRAIN MODEL rspn_op MODELTYPE rspn
  FROM instacart.order_products(reordered, add_to_cart_order);

  TRAIN MODEL rspn_op_update UPDATE rspn_op
  ON order_products.order_id > 3000000;
