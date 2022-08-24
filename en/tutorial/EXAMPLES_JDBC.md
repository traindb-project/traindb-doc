# Examples: Using JDBC

## Connecting a Data Source
First, you must connect to a data source to execute an SQL statement. Since the JDBC drivers of TrainDB and the source DBMS are required, it must be included in the ```CLASSPATH```. The following is an example of connecting to the MySQL data source at localhost.
```java
Class.forName("traindb.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:traindb:mysql://localhost", user, password);
```

## Executing TrainDB SQL statements
After successful connection, you can execute the SQL statements supported by TrainDB.
Our examples will use the [instacart\_small](https://github.com/traindb-project/traindb/tree/main/traindb-core/src/test/resources/datasets/instacart_small) dataset, which is a part of the instacart dataset and is used in the regression test in our project.

### Creating a Modeltype
The following is an example of creating a modeltype.

```java
...
Statement stmt = conn.createStatement();
stmt.execute("CREATE MODELTYPE tablegan FOR SYNOPSIS AS LOCAL CLASS 'TableGAN' IN 'models/TableGAN.py'");
```

### Training a Model
The following is an example of training a model using the modeltype created above.

```java
...
Statement stmt = conn.createStatement();
stmt.execute("TRAIN MODEL tgan MODELTYPE tablegan ON instacart_small.order_products(reordered, add_to_cart_order)";
```

### Creating a synopsis
The following is an example of creating a synopsis using the model trained above.

```java
...
Statement stmt = conn.createStatement();
stmt.execute("CREATE SYNOPSIS order_products_syn FROM MODEL tgan LIMIT 1000");
```

### Running an approximate query
The following is an example of running an approximate query.
For aggregate queries, you can execute approximate queries using ```SELECT APPROXIMATE``` keywords.
Then, the query result is approximated using a synopsis instead of the original table.
The approximated result will be different depending on the generated synopsis.

```java
...
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT APPROXIMATE sum(reordered) FROM instacart_small.order_products");
...
```

Please compare the results with the exact query below.

```java
...
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT sum(reordered) FROM instacart_small.order_products");
...
```
