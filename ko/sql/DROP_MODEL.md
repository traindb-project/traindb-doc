## DROP MODEL

### 목적

DROP MODEL 문은 학습되어 있는 모델을 삭제하는 데 사용한다.


### 구문

#### dropModel
<embed type="image/svg+xml" src="./diagram/dropModel.rrd.svg"/>


### 키워드 및 파라미터

#### modelName

삭제할 모델명을 나타내는 식별자다.


### 예시

#### 모델 삭제

다음은 기존에 학습되어 있는 tgan이라는 모델을 삭제하는 문장이다.
```console
DROP MODEL tgan;
```
