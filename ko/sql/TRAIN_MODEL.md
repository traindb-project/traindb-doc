## TRAIN MODEL

### 목적

TRAIN MODEL 문은 정의한 모델 타입을 대상 테이블의 컬럼 집합에 대해 학습시켜 모델을 구축하는 데 사용한다.


### 구문

#### trainModel
<object type="image/svg+xml" data="./diagram/trainModel1.rrd.svg" class="object"></object>
<object type="image/svg+xml" data="./diagram/trainModel2.rrd.svg" class="object"></object>

#### trainTargetClause
<object type="image/svg+xml" data="./diagram/trainTargetClause.rrd.svg" class="object" width="100%" height="100%"></object>

#### columnNameList
<object type="image/svg+xml" data="./diagram/columnNameList.rrd.svg" class="object"></object>

#### trainModelOptionsClause
<object type="image/svg+xml" data="./diagram/trainModelOptionsClause.rrd.svg" class="object" width="100%" height="100%"></object>

#### optionKeyValue
<object type="image/svg+xml" data="./diagram/optionKeyValue.rrd.svg" class="object"></object>


### 키워드 및 파라미터

#### modelName

학습 과정을 거쳐 얻을 모델명을 나타내는 식별자다.

#### modeltypeName

모델을 얻기 위해 학습시킬 모델 타입을 나타내는 식별자다.

#### trainTargetClause

학습시킬 대상 데이터를 지정하는 절이다.

#### schemaName

학습 대상 테이블이 포함된 스키마명을 나타내는 식별자다. 지정하지 않으면 현재 사용 중인 스키마로 지정된다.

#### tableName

학습 대상으로 지정할 테이블명을 나타내는 식별자다.

#### columnNameList

학습 대상 데이터로 지정할 컬럼 리스트를 지정한다. 컴마(,)로 구분하여 여러 컬럼을 지정할 수 있다.

#### trainModelOptionsClause

모델 학습 시 사용할 옵션(하이퍼파라미터 등)을 지정하는 절이다.

#### 'optionKey'

옵션의 키를 나타내는 문자열 리터럴이다.

#### optionValue

지정할 옵션의 값을 나타내는 문자열 리터럴 또는 수치 값(따옴표 없음)이다.
지정 가능한 옵션은 모델 타입에 따라 다를 수 있다.


### 예시

#### 모델 학습

다음은 tgan이라는 모델을 기존에 정의되어 있는 tablegan이라는 모델 타입으로 instacart 스키마에 속한 order\_products 테이블의 product\_id, add\_to\_cart\_order 컬럼을 대상으로 학습시키는 문장이다.
```console
TRAIN MODEL tgan MODELTYPE tablegan
ON instacart.order_products(product_id, add_to_cart_order);
```

뒤에 OPTIONS 절을 추가해 epochs 하이퍼파라미터를 지정할 수도 있다.
```console
TRAIN MODEL tgan MODELTYPE tablegan
ON instacart.order_products(product_id, add_to_cart_order)
OPTIONS ( 'epochs' = 100 );
```

