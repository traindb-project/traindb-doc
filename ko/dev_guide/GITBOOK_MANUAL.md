# GitBook 문서화 방법

지금 보고 있는 문서화 사이트는 GitBook을 사용해 구축되어 있다.
문서화에 필요한 패키지를 설치하고 문서를 업데이트하는 방법을 설명한다.

## 환경 준비

먼저 GitBook 패키지에서 사용하는 Node.js를 설치해야 한다.

```console
(Ubuntu) $ sudo apt-get install nodejs
(MacOS)  $ brew install nodejs
```

그 다음 npm으로 GitBook의 커맨드 라인 인터페이스를 다음과 같이 설치한다.

```console
$ npm install gitbook-cli@2.1.2 --global
$ gitbook --version
```

(선택) GitBook을 e-book으로 만들고 싶다면 추가로 calibre를 설치하면 다음과 같이 pdf 문서로 만들 수 있다.

```console
$ brew install calibre
$ gitbook pdf ./ ./mybook.pdf
```

마지막으로 본 문서화 사이트의 github 저장소를 복제한다.

```console
git clone https://github.com/traindb-project/traindb-doc.git
```

## 문서화

문서는 마크다운 형식을 이용해 작성하며, 문법은 아래 사이트를 참고한다.
* [Markdown syntax](https://docs.gitbook.com/editing-content/markdown)

새로운 문서 파일을 추가했을 경우, 전체 목차인 ```SUMMARY.md```와 해당 챕터의 목차 파일도 업데이트해야 한다는 점에 유의한다.

내용을 수정한 후에는 아래의 명령을 실행해 로컬에서 먼저 올바로 작성되었는지 확인해 본다. 실행 후 http://localhost:4000 으로 접속해 확인해 볼 수 있다.

```console
$ gitbook serve
```

## 커밋

문서 수정을 마쳤으면 아래의 스크립트 파일을 실행하여 문서화 사이트를 빌드한다.
이 스크립트는 버전별 문서화 사이트를 통합하여 빌드하는 스크립트이다.
```console
$ ./build-update.sh
```

이제 변경된 모든 파일들을 add해서 커밋하면 된다.
