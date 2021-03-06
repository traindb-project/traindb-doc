# 개요

## TrainDB란?
빅데이터 대상의 빠른 질의 처리가 가능한 탐사 데이터 분석 지원 근사질의 DBMS 시스템을 말한다. 2000년대 이후 빅데이터를 분석하여 확실한 근거를 확인한 다음에 비즈니스 의사 결정을 내리는 데이터 기반 의사 결정이 중요해졌다. 그런데 데이터가 생성, 수집되는 속도가 데이터 분석 속도를 압도적으로 추월하다 보니 원하는 데이터를 적시에 분석하기가 어려워지고 있다. 일례로 제조 현장에서는 하루에 수십 TB의 데이터가 생성되고 있고, 모 공단에서는 월별로 진료비를 심사하기 위한 데이터가 10 TB에 이르러 분석 질의를 수행하는 데 수십 시간까지 걸리고 있다. 이런 분석 시간을 줄이기 위해 인메모리 컴퓨팅이나 병렬 처리 등 HW를 활용한 고성능 기술을 적용하려는 시도들도 있지만, 컴퓨팅 자원 사용량이 많아져 비용이 증가하는 문제가 발생하게 된다. 그렇다 보니 비즈니스 의사 결정의 적시성을 확보하는 새로운 방안이 필요하게 되었고, 그 해결 방안으로 데이터 분석의 정확도를 조금 낮추는 대신 결과를 빠르게 얻을 수 있는 근사 질의 분야의 연구를 생각해 볼 수 있다. 기존의 요약 기반 근사 질의 처리 방식은 어떤 정해진 유형의 질의를 효율적으로 응답할 수 있도록 요약 정보를 생성하거나, 샘플 데이터를 다양하게 만들어 놓고 일반적인 근사 질의를 지원하는 형태이어서, 미리 유형이 정해져 있는 분석에는 잘 맞는 반면에, 동적으로 데이터를 탐색하는 스타일의 분석을 지원하는 데는 한계가 있다. 그래서 규모가 큰 데이터에 대해서도 일정 수준의 질의 응답 시간과 정확도를 확보하면서 동적인 탐사 데이터 분석을 지원하려는 것이 바로 머신 러닝 기반 DBMS 근사 질의 처리 엔진 기술, TrainDB이다.

## TrainDB 주요 개발 목표
TrainDB의 주요 개발 목표는 다음과 같다.

* 기존 근사 질의 처리 기술의 한계 극복
  * 기존 샘플링, 히스토그램, 웨이블릿, 스케치 등 전통적인 요약 정보 기반 근사 질의 처리 기술과 같이 질의 커버리지가 낮고 데이터 변경 시 반영이 어려운 기술적 한계 극복
* 데이터 적시 분석 지원
  * 분석 시간이 데이터 크기에 비례하는 기존 분석 기술로 해결하기 어려운 문제 해결 기술 제공
  * 전체 데이터에 대한 정확한 분석 결과를 적시에 획득할 수 있는 탐사데이터 분석 기술 지원
* 머신 러닝 기반 근사 질의 처리 기술 지원
  * 데이터 규모의 증가에도 일정 수준의 질의 처리 응답 시간을 유지할 수 있도록 머신 러닝(ML)을 활용하여 질의 처리 결과의 부정확성 해결
*  활용성 증대
  * 클라우드/포터블 호스팅 환경에서 데이터 비접근 질의 처리 제공
  * 다양한 DBMS 데이터 소스로부터 머신 러닝(ML) 모델을 학습해서 근사 질의를 제공하는 데이터 소스 확장형 근사 질의 처리 지원

## TrainDB 아키텍처
TrainDB 시스템은 4개의 SW, 즉 데이터 비접근 질의 처리를 위한 머신 러닝 모델 구축 및 관리 블록, ML 모델 기반 DBMS 근사 질의 변환 및 최적화 블록, 데이터 소스 확장형 근사 질의 처리 블록, 근사 질의 처리 엔진 연동 탐사 데이터 분석 지원 블록으로 구성된다.
1. 데이터 비접근 질의 처리를 위한 머신 러닝 모델 구축 및 관리 블록
  * 다양한 분석/집계 연산을 지원하기 위해, 원시 데이터로부터 머신 러닝(ML) 모델을 구축하여 질의 처리 시 원시 데이터에 접근하지 않고, ML 모델만을 이용해서 데이터 시놉시스 생성 또는 질의 결과를 추론 기능을 제공하는 블록
2. 머신 러닝 모델 기반 DBMS 근사 질의 변환 및 최적화 블록
  * 사용자가 근사 질의를 표현할 수 있도록 질의 언어를 확장하고, 근사 질의문을 분석해서 효율적으로 처리하는 실행 계획을 수립하는 블록
3. 데이터 소스 확장형 근사 질의 처리 블록
  * 국내외 상용 DBMS 및 클라우드 DBMS와 연동해서 사용할 수 있도록 데이터 소스를 확장형으로 연동하고, 원시 DBMS 질의와 근사 질의를 통합하여 실행하는 블록
4. 근사 질의 처리 시스템 연동 탐사 데이터 분석 지원 블록
  * 분석 응용에서 시각적으로 탐사 데이터 분석을 수행할 수 있는 지원 도구와 ML 모델 자동 학습 및 마이그레이션 등 근사 질의 처리를 관리할 수 있는 워크벤치를 제공해주는 블록
