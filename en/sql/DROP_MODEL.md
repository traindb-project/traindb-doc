## DROP MODEL

### Purpose

Use the DROP MODEL statement to remove the model.
This statement removes only the model metadata in the catalog store, and actual model files will be remained.


### Syntax

#### dropModel
<object type="image/svg+xml" data="./diagram/dropModel.rrd.svg" class="object"></object>


### Keywords and Parameters

#### modelName

This is an identifier that specifies the name of the model to be dropped.


### Examples

#### Dropping a Model

The following statement drops the model ```tgan```.

```console
DROP MODEL tgan;
```
