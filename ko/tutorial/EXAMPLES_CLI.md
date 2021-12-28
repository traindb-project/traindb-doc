# CLI 사용 예

## CLI 도구 실행

TrainDB에서는 CLI를 통해 SQL 문을 실행할 수 있는 trsql을 제공한다. 이는 오픈 소스 CLI 도구인 [sqlline](https://github.com/julianhyde/sqlline)을 TrainDB에 통합한 것이다.

trsql 실행 파일은 bin 디렉토리에 존재하며, 다음과 같이 실행하면 프롬프트가 표시된다.
```console
% cd $TRAINDB_HOME/bin
% ./trsql
sqlline version 1.11.0
sqlline>
```

## 데이터 소스 접속
SQL 문을 실행하려면 먼저 데이터 소스에 접속해야 한다. 접속하려는 JDBC 드라이버가 필요하므로 CLASSPATH 내에 포함되어 있어야 한다. 다음은 trsql을 실행하여 localhost의 MySQL 데이터 소스에 접속하는 예이다.
```console
sqlline> !connect jdbc:traindb:mysql://localhost
Enter username for jdbc:traindb:mysql://localhost: <username>
Enter password for jdbc:traindb:mysql://localhost: <password>
0: jdbc:traindb:mysql//localhost> 
```

## SQL 실행
성공적으로 접속이 이루어지고 나면, 다음과 같이 TrainDB에서 지원하는 다양한 SQL 문을 실행할 수 있다.
```console
0: jdbc:traindb:mysql//localhost> CREATE MODEL tablegan TYPE SYNOPSIS LOCAL AS 'TableGAN' IN 'models/TableGAN.py';
No rows affected (0.231 seconds)
0: jdbc:traindb:mysql//localhost> SHOW MODELS;
+----------+----------+----------+----------+--------------------+
| model    | type     | location | class    | uri                |
+----------+----------+----------+----------+--------------------+
| tablegan | SYNOPSIS | LOCAL    | TableGAN | models/TableGAN.py |
+----------+----------+----------+----------+--------------------+
0: jdbc:traindb:mysql//localhost> TRAIN MODEL tablegan INSTANCE tgan ON instacart.order_products(product_id, add_to_cart_order);
epoch 1 step 50 tensor(1.1035, grad_fn=<SubBackward0>) tensor(0.7770, grad_fn=<NegBackward>) None
epoch 1 step 100 tensor(0.8791, grad_fn=<SubBackward0>) tensor(0.9682, grad_fn=<NegBackward>) None
...
No rows affected (###.## seconds)
0: jdbc:traindb:mysql//localhost> SHOW MODEL INSTANCES;
+----------+----------------+-----------+----------------+---------------------------------+
| model    | model_instance | schema    | table          | columns                         |
+----------+----------------+-----------+----------------+---------------------------------+
| tablegan | tgan           | instacart | order_products | [product_id, add_to_cart_order] |
+----------+----------------+-----------+----------------+---------------------------------+
0: jdbc:traindb:mysql//localhost> CREATE SYNOPSIS order_products_syn FROM MODEL INSTANCE tgan LIMIT 1000;
No rows affected (#.## seconds)
0: jdbc:traindb:mysql//localhost> SHOW SYNOPSES;
+--------------------+----------------+-----------+----------------+---------------------------------+
| synopsis           | model_instance | schema    | table          | columns                         |
+--------------------+----------------+-----------+----------------+---------------------------------+
| order_products_syn | tgan           | instacart | order_products | [product_id, add_to_cart_order] |
+--------------------+----------------+-----------+----------------+---------------------------------+
0: jdbc:traindb:mysql//localhost> SELECT count(*) as c2 FROM instacart.order_products_syn;
+------+
| c2   |
+------+
| 1000 |
+------+
```
