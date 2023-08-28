Getting Started
===============

Environment Setup
-----------------

To run TrainDB, the following environment is required.
If you have insufficient permission to install, please ask your system administrator.
TrainDB includes the TrainDB ML model library as a submodule.
The following requirements must be satisfied for operation.


TrainDB
~~~~~~~

* Java 11+
* Maven 3.x
* SQLite3 (or other DBMS for catalog store, supported by datanucleus)

TrainDB ML Model Library
~~~~~~~~~~~~~~~~~~~~~~~~

* Python 3.8+
* Python virtual environment manager, such as pyenv, conda (optional)
* Packages used by ML models, such as pytorch - install requirements.txt

  * Using ``pip``: pip install -r traindb-model/requirements.txt
  * Using ``conda``: conda install --file traindb-model/requirements.txt

Installation
------------

Download
~~~~~~~~

The public repository of TrainDB is `https://github.com/traindb-project/traindb <https://github.com/traindb-project/traindb>`_. You can download the released file from the address, or you can clone using git as shown below.

.. code-block:: console

  $ git clone --recurse-submodules https://github.com/traindb-project/traindb.git

Build
~~~~~

You can build TrainDB using Maven as shown below.

.. code-block:: console

  $ cd traindb
  $ mvn package

Then, the file ``traindb-1.5.tar.gz`` is created in the ``traindb-assembly/target`` directory. You can unzip it as shown below.

.. code-block:: console

  $ tar xvfz traindb-assembly/target/traindb-1.5.tar.gz

