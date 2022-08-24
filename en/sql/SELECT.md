## SELECT

### Purpose

Use the SELECT statement to retrieve data from tables.

Since TrainDB is implemented based on Apache Calcite, please refer to the [SQL Reference of Apache Calcite](https://calcite.apache.org/docs/reference.html) for exact SELECT queries.

This document focuses on the SELECT APPROXIMATE statement for approximate queries in TrainDB.


### Syntax

#### select
<object type="image/svg+xml" data="./diagram/select1.rrd.svg" class="object"></object>
<object type="image/svg+xml" data="./diagram/select2.rrd.svg" class="object"></object>
<object type="image/svg+xml" data="./diagram/select3.rrd.svg" class="object"></object>
<object type="image/svg+xml" data="./diagram/select4.rrd.svg" class="object"></object>
<object type="image/svg+xml" data="./diagram/select5.rrd.svg" class="object"></object>
<object type="image/svg+xml" data="./diagram/select6.rrd.svg" class="object"></object>

#### selectItemList
<object type="image/svg+xml" data="./diagram/selectItemList.rrd.svg" class="object"></object>

#### selectItem
<object type="image/svg+xml" data="./diagram/selectItem.rrd.svg" class="object"></object>

#### tableExpression
<object type="image/svg+xml" data="./diagram/tableExpression.rrd.svg" class="object"></object>

#### tableReference
<object type="image/svg+xml" data="./diagram/tableReference.rrd.svg" class="object" width="100%" height="100%"></object>

#### tablePrimary
<object type="image/svg+xml" data="./diagram/tablePrimary.rrd.svg" class="object" width="100%" height="100%"></object>

#### groupItemList
<object type="image/svg+xml" data="./diagram/groupItemList.rrd.svg" class="object"></object>

#### groupItem
<object type="image/svg+xml" data="./diagram/groupItem.rrd.svg" class="object"></object>

#### orderItemList
<object type="image/svg+xml" data="./diagram/orderItemList.rrd.svg" class="object"></object>

#### orderItem
<object type="image/svg+xml" data="./diagram/orderItem.rrd.svg" class="object"></object>


### Keywords and Parameters

#### APPROXIMATE

Specify ```APPROXIMATE``` to indicate the query is an approximate query.
If the following conditions are satisfied, the query is processed as an approximate query.
Otherwise, this keyword is ignored and the query is processed as an exact query.
- ```selectItemList``` includes aggregate functions that support approximation queries. 
- There is a model or a synopsis that learned the columns specified in selectItemList.

Currently, ```avg```, ```sum```, ```count```, ```stddev```, and ```variance``` aggregate functions are supported for approximate queries.

Aggregation functions currently supported for approximation queries include The ```GROUP BY```, ```HAVING```, and ```ORDER BY``` clauses can be used together in an approximate query.

The ```GROUP BY```, ```HAVING```, and ```ORDER BY``` clauses can be used together in an approximate query.

#### selectItemList

Specify the list of columns or expressions to be retrieved.

#### FROM tableExpression

Specify the tables from which data is selected.
Additionally, aliases and column lists can be specified.

#### WHERE booleanExpression

Specifies search or filter conditions to retrieve only the rows which satisfy the conditions.
If the ```WHERE``` clause is omitted, all rows are retrieved.

#### GROUP BY groupItemList

The ```GROUP BY``` clause groups retrieved rows based on the expressions in ```groupItemList```.
The column specified in the GROUP BY clause must be included in the selectItemList.

#### HAVING booleanExpression

The ```HAVING``` clause can be used to retrieved the grouped results that satisfy the specified conditions.
If the ```HAVING``` clause is omitted, all grouped results are retrieved.

#### ORDER BY orderItemList

The ```ORDER BY``` clause sorts retrieved rows by the specified order of the expressions in ```orderItemList```.
If the ```ORDER BY``` clause is omitted, the retrieved rows are retuned in an arbitrary order.


### Examples

#### Approximate Query

The following statement approximately retrieves the sum of the ```reordered``` columns of the ```order_products``` table in the ```instacart``` schema.
```console
SELECT APPROXIMATE sum(reordered) FROM instacart.order_products;
```

The ```WHERE```, ```GROUP BY```, or ```ORDER BY``` clauses can also be specified according to the user intent.
```console
SELECT APPROXIMATE sum(reordered) FROM instacart.order_products
WHERE add_to_cart_order < 5;
```

```console
SELECT APPROXIMATE sum(reordered) FROM instacart.order_products
GROUP BY add_to_cart_order
ORDER BY add_to_cart_order ASC;
```
