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

## TrainDB SQL 실행
성공적으로 접속이 이루어지고 나면, 다음과 같이 TrainDB에서 지원하는 다양한 SQL 문을 실행할 수 있다.
실행 예에서는 instacart 데이터셋의 일부로 본 프로젝트에서 회귀 테스트 시 사용하는 [instacart\_small](https://github.com/traindb-project/traindb/tree/main/traindb-core/src/test/resources/datasets/instacart_small) 데이터셋을 사용한다.

### 모델 타입 등록, 조회
다음은 모델 타입을 등록한 후 조회하는 예이다.
```console
0: jdbc:traindb:mysql//localhost> CREATE MODELTYPE tablegan FOR SYNOPSIS AS LOCAL CLASS 'TableGAN' IN 'models/TableGAN.py'; 
No rows affected (0.231 seconds)
0: jdbc:traindb:mysql//localhost> SHOW MODELTYPES;
+-----------+----------+----------+----------+--------------------+
| modeltype | category | location | class    | uri                |
+-----------+----------+----------+----------+--------------------+
| tablegan  | SYNOPSIS | LOCAL    | TableGAN | models/TableGAN.py |
+-----------+----------+----------+----------+--------------------+
```

### 모델 학습, 조회
다음은 등록한 모델 타입을 데이터에 학습해 모델을 구축하고 조회하는 예이다.

```console
0: jdbc:traindb:mysql//localhost> TRAIN MODEL tgan MODELTYPE tablegan ON instacart_small.order_products(reordered, add_to_cart_order);
epoch 1 step 50 tensor(1.1035, grad_fn=<SubBackward0>) tensor(0.7770, grad_fn=<NegBackward>) None
epoch 1 step 100 tensor(0.8791, grad_fn=<SubBackward0>) tensor(0.9682, grad_fn=<NegBackward>) None
...
No rows affected (###.## seconds)
0: jdbc:traindb:mysql//localhost> SHOW MODELS;
+-------+-----------+-----------------+----------------+--------------------------------+-----------------+--------------+---------+
| model | modeltype | schema          | table          | columns                        | base_table_rows | trained_rows | options |
+-------+-----------+-----------------+----------------+--------------------------------+-----------------+--------------+---------+
| tgan  | tablegan  | instacart_small | order_products | [reordered, add_to_cart_order] | 1384617         | 1384617      | {}      |
+-------+-----------+-----------------+----------------+--------------------------------+-----------------+--------------+---------+
```

### 시놉시스 생성, 조회
다음은 학습한 모델로부터 시놉시스를 생성한 후 조회하는 예이다.

```console
0: jdbc:traindb:mysql//localhost> CREATE SYNOPSIS order_products_syn FROM MODEL tgan LIMIT 100000;
No rows affected (#.## seconds)
0: jdbc:traindb:mysql//localhost> SHOW SYNOPSES;
+--------------------+-------+-----------+----------------+--------------------------------+------+------------+
| synopsis           | model | schema    | table          | columns                        | rows | ratio      |
+--------------------+-------+-----------+----------------+--------------------------------+------+------------+
| order_products_syn | tgan  | instacart | order_products | [reordered, add_to_cart_order] | 1000 | 0.00072222 |
+--------------------+-------+-----------+----------------+--------------------------------+------+------------+
```

### 근사 질의 수행
다음은 근사 질의를 수행하는 예이다.
집계 질의에 대해 SELECT 뒤에 APPROXIMATE 키워드를 붙여 근사 질의를 수행할 수 있다.
그러면 원본 테이블이 아닌 시놉시스를 이용해 질의 결과를 근사하게 되며, 근사 결과는 생성된 시놉시스에 따라 다를 것이다.

```console
0: jdbc:traindb:mysql//localhost> SELECT APPROXIMATE sum(reordered) FROM instacart_small.order_products;
```

아래의 정확 질의와 결과를 비교해 보기 바란다.

```console
0: jdbc:traindb:mysql//localhost> SELECT sum(reordered) FROM instacart_small.order_products;
```
