# 시작하기

## 실행 환경 준비

TrainDB를 실행하려면 다음과 같은 환경이 필요하다. 설치 권한이 없다면, 시스템 관리자에게 요청하기 바란다.

### TrainDB

* Java 11+
* Maven 3.x
* SQLite3

### TrainDB ML 모델 라이브러리

* Python 3.x
* [SDGym](https://github.com/sdv-dev/SDGym)
  * Using ```pip```: pip install pomegranate==0.14.6 sdgym==0.5.0
  * Using ```conda```: conda install -c sdv-dev -c conda-forge sdgym


## 설치

### 다운로드

TrainDB의 공개 저장소는 [https://github.com/traindb-project/traindb](https://github.com/traindb-project/traindb)이다. 해당 주소로부터 릴리스된 압축 파일을 다운로드하거나 아래와 같이 git을 사용해 내려받는다.

```console
git clone https://github.com/traindb-project/traindb.git
```

### 빌드

다음과 같이 Maven을 사용해 빌드할 수 있다.

```console
$ cd traindb
$ mvn package
```

빌드하고 나면 ```traindb-x.y.z-SNAPSHOT.tar.gz``` 파일이 traindb-assembly/target 디렉토리에 생성된다. 다음과 같이 압축을 해제해 사용하면 된다.

```console
$ tar xvfz traindb-assembly/target/traindb-0.1.0-SNAPSHOT.tar.gz
```

TrainDB 내에서 ML 모델을 사용하기 위해, 모델 라이브러리를 추가해야 한다.
다음의 명령을 통해 모델 라이브러리를 추가할 수 있다.
``` console
$ cd traindb-assembly/target/traindb-0.1.0-SNAPSHOT
$ svn co https://github.com/traindb-project/traindb-model/trunk/models
```
