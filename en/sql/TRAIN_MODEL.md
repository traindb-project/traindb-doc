## TRAIN MODEL

### Purpose

Use the TRAIN MODEL statement to build a model by training a modeltype on the columns in a given table.


### Syntax

#### trainModel
<embed type="image/svg+xml" src="./diagram/trainModel1.rrd.svg"/>
<embed type="image/svg+xml" src="./diagram/trainModel2.rrd.svg"/>

#### trainTargetClause
<embed type="image/svg+xml" src="./diagram/trainTargetClause.rrd.svg" width="100%" height="100%"/>

#### columnNameList
<embed type="image/svg+xml" src="./diagram/columnNameList.rrd.svg"/>

#### trainModelOptionsClause
<embed type="image/svg+xml" src="./diagram/trainModelOptionsClause.rrd.svg" width="100%" height="100%"/>

#### optionKeyValue
<embed type="image/svg+xml" src="./diagram/optionKeyValue.rrd.svg"/>


### Keywords and Parameters

#### modelName

This is an identifier that specifies the name of the model to be built.

#### modeltypeName

This is an identifier that specifies the name of the modeltype to be used for model training.

#### trainTargetClause

Specify the target data for model training.

#### schemaName

This is an identifier that specifies the name of the schema that contains the training target table.
If not specified, the default (current) schema is used.

#### tableName

This is an identifier that specifies the name of the training target table.

#### columnNameList

Specify the target columns for model training. Multiple columns can be specified as a comma-separated list.

#### trainModelOptionsClause

Specify the model training options, including hyperparameters like epochs.
The options that can be specified depend on the modeltype.

#### 'optionKey'

This is a string literal that specifies the key of the option.

#### optionValue

This is a string literal or a numeric value that specifies the value of the option.


### Examples

#### Training a Model

The following statement trains a model ```tgan``` of the ```tablegan``` modeltype on the columns ```reordered``` and ```add_to_cart_order``` of the ```order_products``` table in the ```instacart``` schema.

```console
TRAIN MODEL tgan MODELTYPE tablegan
ON instacart.order_products(reordered, add_to_cart_order);
```

By adding the ```OPTIONS``` clause, the ```epochs``` hyperparameter can also be specified.
```console
TRAIN MODEL tgan MODELTYPE tablegan
ON instacart.order_products(reordered, add_to_cart_order)
OPTIONS ( 'epochs' = 100 );
```

