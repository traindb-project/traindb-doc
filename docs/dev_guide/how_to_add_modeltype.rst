How to Add Your Own Modeltype
=============================

Modeltype Category
------------------

TrainDB uses two modeltypes for approximate query processing: synopsis generation modeltype and inference modeltype.
The synopsis generation modeltype generates synthetic data similar to the original data, and the inference modeltype predicts approximate results of aggregate functions.
You can add your own modeltype by referring to the following section, depending on the category of your modeltype.


Implementing a Modeltype
------------------------

You can add your own modeltype by inheriting and implementing the abstract base class.
You have to implement the following classes depending on the cateogy of your modeltype.

* Synopsis generation modeltype: `TrainDBSynopsisModel <https://github.com/traindb-project/traindb-model/blob/02bf2f1fd3d81df22a53c5f32ae04c87098bc887/models/TrainDBBaseModel.py#L58-L62>`_

.. code-block:: python

  class TrainDBSynopsisModel(TrainDBModel, abc.ABC):
    """Base class for all the ``TrainDB`` synopsis generation models."""

    def synopsis(self, row_count):
      pass


* Inference modeltype: `TrainDBInferenceModel <https://github.com/traindb-project/traindb-model/blob/02bf2f1fd3d81df22a53c5f32ae04c87098bc887/models/TrainDBBaseModel.py#L64-L68>`_

.. code-block:: python

  class TrainDBInferenceModel(TrainDBModel, abc.ABC):

    """Base class for all the ``TrainDB`` inference models."""

    def infer(self, agg_expr, group_by_column, where_condition):
      pass


Since the above two modeltypes inherit a common base class, the functions included the base class must also be implemented.

* Common base class: `TrainDBModel <https://github.com/traindb-project/traindb-model/blob/02bf2f1fd3d81df22a53c5f32ae04c87098bc887/models/TrainDBBaseModel.py#L46-L56>`_

.. code-block:: python

  class TrainDBModel(abc.ABC):
    """Base class for all the ``TrainDB`` models."""

    ...

    def train(self, real_data, table_metadata):
      pass
   
   
    def save(self, output_path):
      pass
   
   
    def load(self, input_path):
      pass
   
   
    def list_hyperparameters():
      return []
