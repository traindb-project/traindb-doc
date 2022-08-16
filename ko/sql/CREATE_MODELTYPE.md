## CREATE MODELTYPE

### 목적

CREATE MODELTYPE 문은 모델 타입을 정의하는 데 사용한다.
모델 타입이란 데이터를 학습시켜 구축할 머신 러닝 모델의 아키텍처를 정의하는 개체이다.
모델 타입을 각각의 데이터에 학습시킬 수 있으며 각 모델 학습 시 하이퍼파라미터를 다르게 지정할 수 있다.


### 구문

#### createModeltype
<object type="image/svg+xml" data="./diagram/createModeltype1.rrd.svg" class="object" width="100%" height="100%"></object>
<object type="image/svg+xml" data="./diagram/createModeltype2.rrd.svg" class="object"></object>

#### modeltypeSpecClause
<object type="image/svg+xml" data="./diagram/modeltypeSpecClause.rrd.svg" class="object"></object>


### 키워드 및 파라미터

#### modeltypeName

새로 정의할 모델 타입명을 나타내는 식별자다.

#### SYNOPSIS

데이터 시놉시스 생성형 모델 타입임을 지정하는 키워드다.

#### INFERENCE

근사 결과 추론형 모델 타입임을 지정하는 키워드다.

#### modeltypeSpecClause

모델 타입의 세부 사항을 지정하는 절이다.

#### LOCAL

로컬 머신에 위치한 모델 타입임을 지정하는 키워드다.

#### REMOTE

원격 머신에 위치한 모델 타입임을 지정하는 키워드다.

#### 'modeltypeClassName'

모델 타입의 클래스명을 지정하는 문자열 리터럴로, modelUri의 파일/서비스 안에서 어떤 클래스에 해당하는지를 나타낸다.

#### 'modelUri'

로컬 모델의 경우에는 모델이 저장되어 있는 디렉토리 경로, 원격 모델의 경우에는 접속 URL을 지정하는 문자열 리터럴이다. 


### 예시

#### 로컬 모델 타입 정의

다음은 tablegan이라는 데이터 시놉시스 생성형 모델 타입을 로컬 디렉토리 경로 'models/TableGAN.py' 파일의 TableGAN 클래스로 정의하는 문장이다.
```console
CREATE MODELTYPE tablegan FOR SYNOPSIS AS LOCAL CLASS 'TableGAN' IN 'models/TableGAN.py';
```
