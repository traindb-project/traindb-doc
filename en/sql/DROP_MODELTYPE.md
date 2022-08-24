## DROP MODELTYPE

### Purpose

Use the DROP MODELTYPE statement to remove the modeltype.
This statement removes only the modeltype metadata in the catalog store, and actual modeltype files will be remained.


### Syntax

#### dropModeltype
<object type="image/svg+xml" data="./diagram/dropModeltype.rrd.svg" class="object"></object>


### Keywords and Parameters

#### modeltypeName

This is an identifier that specifies the name of the modeltype to be dropped.


### Examples

#### Dropping a Modeltype

The following statement drops the modeltype ```tablegan```.

```console
DROP MODELTYPE tablegan;
```
