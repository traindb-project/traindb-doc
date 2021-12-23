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