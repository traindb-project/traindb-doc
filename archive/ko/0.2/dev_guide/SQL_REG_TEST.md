# SQL 회귀 테스트 실행 방법

## 테스트 데이터베이스 준비

SQL 회귀 테스트를 실행하려면 먼저 사용 중인 DBMS에 테스트용 데이터셋을 로딩해야 한다.
본 프로젝트에서 테스트에 활용 중인 데이터셋이 traindb-core/src/test/resources/datasets 디렉토리에 들어 있으므로 이를 로딩하면 된다.
현재 SQL 회귀 테스트에서는 다음과 같은 테스트 데이터셋을 활용하고 있다.

* ```instacart_small```: [instacart 데이터셋](https://www.kaggle.com/c/instacart-market-basket-analysis/)을 테스트용으로 축소시킨 데이터셋

데이터베이스를 로딩하는 스크립트가 함께 포함되어 있으므로, 이를 실행하면 데이터베이스를 생성하고 데이터를 로딩할 수 있다.
예를 들면, 다음과 같이 ```instacart_small``` 데이터셋을 MySQL에 로딩할 수 있다.

```console
$ mysql -u [user id] -p < load_mysql.sql
```

## 테스트 데이터베이스 설정

traindb-core/src/test/resources 디렉토리에 traindb-test-config.json.template 파일이 들어 있다. 이 파일의 이름을 traindb-test-config.json으로 변경한 후, 파일을 열어 테스트 데이터베이스 접속 정보를 입력한다.

```console
[
  {
    "name": "instacart_small",
    "url": "jdbc:traindb:mysql://localhost:3306",
    "user": "user id",
    "password": "password"
  }
]
```

### SQL 회귀 테스트 실행

본 프로젝트에서는 Apache Calcite를 따라 [Quidem](https://github.com/julianhyde/quidem) 프레임워크를 이용해 SQL 회귀 테스트를 수행한다. SQL 테스트 스크립트 파일은 확장자가 ```.iq```이며 traindb-core/src/test/resources/sql 디렉토리에 위치하고 있다. 

실행은 다음과 같이 maven 테스트를 실행하면 된다.

```console
$ mvn test -DskipTests=false
```

Quidem은 테스트 스크립트를 실행한 출력 결과가 그대로 다시 실행할 수 있는 입력 스크립트가 된다는 점이 특징이다. 이러한 특징을 이용해 테스트 스크립트를 쉽게 추가할 수 있다.
