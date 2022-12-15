Getting Started
===============

Environment Setup
-----------------

To run TrainDB, the following environment is required. If you have insufficient permission to install, please ask your system administrator.

TrainDB
~~~~~~~

* Java 11+
* Maven 3.x
* SQLite3

TrainDB ML Model Library
~~~~~~~~~~~~~~~~~~~~~~~~

* Python 3.x
* `SDGym <https://github.com/sdv-dev/SDGym>`_

  * Using ``pip``: pip install pomegranate==0.14.6 sdgym==0.5.0
  * Using ``conda``: conda install -c sdv-dev -c conda-forge sdgym

* `SPFlow <https://github.com/SPFlow/SPFlow>`_


Installation
------------

Download
~~~~~~~~

The public repository of TrainDB is `https://github.com/traindb-project/traindb <https://github.com/traindb-project/traindb>`_. You can download the released file from the address, or you can clone using git as shown below.

.. code-block:: console

  $ git clone https://github.com/traindb-project/traindb.git

Build
~~~~~

You can build TrainDB using Maven as shown below.

.. code-block:: console

  $ cd traindb
  $ mvn package

Then, the file ``traindb-1.0.tar.gz`` is created in the ``traindb-assembly/target`` directory. You can unzip it as shown below.

.. code-block:: console

  $ tar xvfz traindb-assembly/target/traindb-1.0.tar.gz

To use ML models in TrainDB, you need to add model libraries.
You can download our model library with the following command.

.. code-block:: console

  $ cd traindb-assembly/target/traindb-1.0
  $ svn co https://github.com/traindb-project/traindb-model/trunk/models
