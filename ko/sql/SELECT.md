## SELECT

### 목적

SELECT 문은 테이블로부터 데이터를 조회하는 데 사용한다.

TrainDB는 Apache Calcite 기반으로 구현되어 있기 때문에 정확 질의를 표현하는 SELECT 문은 [Apache Calcite의 SQL 문법](https://calcite.apache.org/docs/reference.html)을 따르므로 이에 대해서는 연결된 문서를 참고하기 바란다.

본 문서에서는 TrainDB에서 지원하는 근사 질의 기능인 SELECT APPROXIMATE 문에 초점을 맞추어 설명한다.

### 구문

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

### 키워드 및 파라미터

#### APPROXIMATE

근사 질의임을 나타내는 키워드다. 다음의 조건을 만족하는 경우에 근사 질의로 처리되며, 근사 질의로 처리할 수 없는 경우에는 키워드를 무시한 채 정확 질의로 처리된다.
- selectItemList에 근사 질의를 지원하는 집계 함수가 포함되어 있다.
- selectItemList의 컬럼들을 학습한 모델이나 시놉시스가 존재한다.

현재 근사 질의가 지원되는 집계 함수로는 avg, sum, count, stddev, variance가 있다.
근사 질의 시 GROUP BY, HAVING, ORDER BY 절을 함께 사용할 수 있다.

#### selectItemList

조회하고자 하는 컬럼 또는 표현식 목록을 지정한다.

#### FROM tableExpression

조회할 대상 테이블을 나타내는 절이다. tableExpression에는 테이블명을 지정할 수 있으며, 추가적으로 별칭(alias)이나 컬럼명 리스트 등을 명시할 수 있다.

#### WHERE booleanExpression

WHERE 조건절은 지정한 조건을 충족하는 로우(row)들만 조회되도록 제한하는 데 사용한다.
WHERE 조건절을 생략하면 FROM 절의 모든 로우가 조회된다.

#### GROUP BY groupItemList

groupItemList에 포함된 표현식을 기준으로 조회된 로우들을 그룹화하는 데 사용하는 절이다. GROUP BY 절에 명시된 컬럼은 selectItemList에 포함되어야 한다.

#### HAVING booleanExpression

HAVING 절은 그룹화된 결과 중 지정된 조건이 TRUE인 로우만 조회되도록 제한하는 데 사용한다. HAVING 절을 생략하면 모든 그룹에 대한 로우가 조회된다.

#### ORDER BY orderItemList

ORDER BY 절은 지정한 orderItemList의 순서대로 결과를 정렬하는 데 사용한다. ORDER BY 절을 생략하면 결과 로우들의 조회 순서는 임의의 순서를 따른다.


### 예시

#### 근사 질의

다음은 instacart 스키마에 속한 order\_products 테이블로부터 reordered 컬럼의 합계를 근사적으로 조회하는 질의문이다.
```console
SELECT APPROXIMATE sum(reordered) FROM instacart.order_products;
```

다음과 같이 WHERE 조건절, GROUP BY 절, ORDER BY 절 등을 질의의 의도에 맞게 추가할 수 있다.
```console
SELECT APPROXIMATE sum(reordered) FROM instacart.order_products
WHERE add_to_cart_order < 5;
```

```console
SELECT APPROXIMATE sum(reordered) FROM instacart.order_products
GROUP BY add_to_cart_order
ORDER BY add_to_cart_order ASC;
```
