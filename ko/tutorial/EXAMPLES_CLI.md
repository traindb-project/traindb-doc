# CLI 사용 예

## 모델 생성
- CREATE MODEL 모델이름 TYPE [SYNOPSIS] [LOCAL] AS '클래스이름' IN '모델 생성하는 프로그램 파일';

   ### 사용예
  - CREATE MODEL tablegan TYPE SYNOPSIS LOCAL AS 'TableGAN' IN 'models/TableGAN.py';

   ### 확인
  - SHOW MODELS;
```console
+----------+----------+----------+----------+--------------------+
| model    | type     | location | class    | uri                |
+----------+----------+----------+----------+--------------------+
| tablegan | SYNOPSIS | LOCAL    | TableGAN | models/TableGAN.py |
+----------+----------+----------+----------+--------------------+
```

## 모델 인스턴스 생성
- TRAIN MODEL 모델명 INSTANCE 모델인스턴스 ON 스키마.테이블(칼럼1, ... ,칼럼n);

   ### 사용예
   - TRAIN MODEL tablegan INSTANCE tgan ON instacart.order_products(product_id, add_to_cart_order);

   ### 확인
   - SHOW MODEL tablegan INSTANCES;
```console
+----------+----------------+-----------+----------------+---------------------------------+
| model    | model_instance | schema    | table          | columns                         |
+----------+----------------+-----------+----------------+---------------------------------+
| tablegan | tgan           | instacart | order_products | [product_id, add_to_cart_order] |
+----------+----------------+-----------+----------------+---------------------------------+
```

## 시놉시스 생성

- CREATE SYNOPSIS 시놉시스 이름 FROM MODEL INSTANCE 모델인스턴스 LIMIT 개수;

   ### 사용예
   - CREATE SYNOPSIS order_products_syn FROM MODEL INSTANCE tgan LIMIT 1000;

   ### 확인
   - SHOW SYNOPSES;
```console
+--------------------+----------------+-----------+----------------+---------------------------------+
| synopsis           | model_instance | schema    | table          | columns                         |
+--------------------+----------------+-----------+----------------+---------------------------------+
| order_products_syn | tgan           | instacart | order_products | [product_id, add_to_cart_order] |
+--------------------+----------------+-----------+----------------+---------------------------------+
```

   - SELECT count(*) FROM instacart.order_products_syn;
```console
+------+
| c2   |
+------+
| 1000 |
+------+
```
