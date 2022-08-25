## DROP MODEL

### Purpose

Use the DROP MODEL statement to remove the model.
This statement removes only the model metadata in the catalog store, and actual model files will be remained.


### Syntax

#### dropModel
<embed type="image/svg+xml" src="./diagram/dropModel.rrd.svg"/>


### Keywords and Parameters

#### modelName

This is an identifier that specifies the name of the model to be dropped.


### Examples

#### Dropping a Model

The following statement drops the model ```tgan```.

```console
DROP MODEL tgan;
```
