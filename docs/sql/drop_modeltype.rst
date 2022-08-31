DROP MODELTYPE
==============

Purpose
-------

Use the ``DROP MODELTYPE`` statement to remove the modeltype.
This statement removes only the modeltype metadata in the catalog store, and actual modeltype files will be remained.

Syntax
------

Diagram
~~~~~~~

**dropModeltype**

.. only:: html

  .. raw:: html

    <embed type="image/svg+xml" src="../_static/rrd/dropModeltype.rrd.svg"/>

.. only:: latex

  .. image:: ../_static/rrd/dropModeltype.rrd.*


Keywords and Parameters
~~~~~~~~~~~~~~~~~~~~~~~

**modeltypeName**

This is an identifier that specifies the name of the modeltype to be dropped.


Examples
--------

Dropping a Modeltype
~~~~~~~~~~~~~~~~~~~~

The following statement drops the modeltype ``tablegan``.

.. code-block:: console

 DROP MODELTYPE tablegan;
