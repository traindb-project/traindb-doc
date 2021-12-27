## CREATE SYNOPSIS

### 목적

CREATE SYNOPSIS 문은 학습되어 있는 데이터 시놉시스 생성형 모델 인스턴스를 이용해 시놉시스 테이블을 생성하는 데 사용한다. 시놉시스란 원본 데이터와 유사한 형태를 갖는 합성 데이터로, 원본 데이터로부터 샘플링한 것과는 다르다.


### 구문

#### createSynopsis
![](diagram/createSynopsis.png)


### 키워드 및 파라미터

#### synopsisName

생성할 시놉시스명을 나타내는 식별자다.

#### modelInstanceName

시놉시스 생성에 사용할 모델 인스턴스명을 나타내는 식별자다. 데이터 시놉시스 생성형 모델의 인스턴스만 지정 가능하다.

#### LIMIT limitNumber

생성할 시놉시스 테이블의 로우 개수를 지정한다.


### 예시

#### 시놉시스 생성

다음은 데이터 시놉시스 생성형 모델을 학습시킨 tgan이라는 모델 인스턴스를 이용해 10,000개 로우를 갖는 시놉시스 테이블 order\_products\_syn을 생성하는 문장이다.
```console
CREATE SYNOPSIS order_products_syn FROM MODEL INSTANCE tgan LIMIT 10000;
```
