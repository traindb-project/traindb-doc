# JDBC 사용 예

## 데이터 소스 접속
SQL 문을 실행하려면 먼저 데이터 소스에 접속해야 한다. TrainDB의 JDBC 드라이버, 접속하려는 DBMS의 JDBC 드라이버가 필요하므로 CLASSPATH 내에 포함되어 있어야 한다. 다음은 자바 코드에서 JDBC를 사용하여 localhost의 MySQL 데이터 소스에 접속하는 예이다.
```java
Class.forName("traindb.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:traindb:mysql://localhost", user, password);
```

## TrainDB SQL 실행
성공적으로 접속이 이루어지고 나면, 다음과 같이 TrainDB에서 지원하는 다양한 SQL 문을 실행할 수 있다.
실행 예에서는 instacart 데이터셋의 일부로 본 프로젝트에서 회귀 테스트 시 사용하는 [instacart\_small](https://github.com/traindb-project/traindb/tree/main/traindb-core/src/test/resources/datasets/instacart_small) 데이터셋을 사용한다.

### 모델 타입 등록
다음은 모델 타입을 등록하는 예이다.

```java
...
Statement stmt = conn.createStatement();
stmt.execute("CREATE MODELTYPE tablegan FOR SYNOPSIS AS LOCAL CLASS 'TableGAN' IN 'models/TableGAN.py'");
```

### 모델 학습
다음은 등록한 모델 타입을 데이터에 학습해 모델을 구축하는 예이다.

```java
...
Statement stmt = conn.createStatement();
stmt.execute("TRAIN MODEL tgan MODELTYPE tablegan ON instacart_small.order_products(reordered, add_to_cart_order)";
```

### 시놉시스 생성
다음은 학습한 모델로부터 시놉시스를 생성하는 예이다.

```java
...
Statement stmt = conn.createStatement();
stmt.execute("CREATE SYNOPSIS order_products_syn FROM MODEL tgan LIMIT 1000");
```

### 근사 질의 수행
다음은 근사 질의를 수행하는 예이다.
집계 질의에 대해 SELECT 뒤에 APPROXIMATE 키워드를 붙여 근사 질의를 수행할 수 있다.
그러면 원본 테이블이 아닌 시놉시스를 이용해 질의 결과를 근사하게 되며, 근사 결과는 생성된 시놉시스에 따라 다를 것이다.

```java
...
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT APPROXIMATE sum(reordered) FROM instacart_small.order_products");
...
```

아래의 정확 질의와 결과를 비교해 보기 바란다.

```java
...
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT sum(reordered) FROM instacart_small.order_products");
...
```
