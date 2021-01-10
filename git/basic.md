# Github 특강 - Basic

## git 이란?

### What

git은 SCM(source code manager), 혹은 VCSs(버전 컨트롤 시스템)

버전 관리가 가능한 폴더라고 생각하면 됨

github은 이러한 폴더들의 클라우드 개념

### why

github을 배우는 이유는 오픈소스 커뮤니티에 참여하기 위해서임

github은 개발자들의 sns, 클라우드, 채용사이트

## git 설치

1. git-scm.com 에서 다운로드
2. 계속 next 로 설치
3. 윈도우 탐색창에 git bash 클릭



## git 사용법

### 최초 설정

처음 컴퓨터에 git을 설치하면, 사용자의 이메일과 이름을 적어준다. 이는 앞으로 일어나는 커밋에 서명을 하기 위해서 필요하다.

```
$ git config --global user.name "<당신의 이름>"

$ git config --global user.email "<당신의>@<이메일>"
```

잘 설정되었나 확인하려면

```
$ git config user.name
이름 출력

$ git config user.email
이메일 출력
```



### 상태 점검

```$ git status```



### 초기화

초기화는 `git init` 을 통해 진행한다.

```
$ git init
기본 폴더에 버전관리 기능 추가 (master)

$ ls -a 로 확인해보면 .git이 추가된 것을 볼 수 있음
```





### add하기

| 명령어               | 설명                |
| -------------------- | ------------------- |
| `$ mkdir foldername` | 폴더를 생성한다.    |
| `$ touch filename`   | 파일을 생성한다.    |
| `$ git rm`           | 파일을 삭제한다.    |
| `$ git add filename` | filename을 add한다. |



### Commit 하기

| 명령어                       | 설명                       |
| ---------------------------- | -------------------------- |
| ` $ git commit -m "massage"` | massage를 남겨 commit한다. |



### Log 보기

| 명령어      | 설명                 |
| ----------- | -------------------- |
| `$ git log` | 작업목록을 확인한다. |

### 원격 저장소 등록하기

```
#git remote add origin https://github.com/seo1511kr/TIL.git(remote 등록)
>>local repo를 여러개의 remote repo와 연동할 수 있음
>>git remote add가 고정 명령어고 origin은 그냥 이름을 붙인 것
>>git remote add 추가리포(이름) hellow.world(주소) 도 가능
```

```
#git remote -v (상태확인)
origin  https://github.com/seo1511kr/TIL.git (fetch)
origin  https://github.com/seo1511kr/TIL.git (push)

#git remote rm 추가리포 (리모트 지우기)
```

### 명령어

| 명령어                       | 설명                       |
| ---------------------------- | -------------------------- |
|~	|홈폴더|
|cd -|	뒤로가기|
|cd ..	|위로가기|
|taptap	|이름 불러오기|
|esc >> :q!	|git commit 상태 빠져나오기|
|mv <1> <2>|	1번 파일 2번으로 이름변경|
|rm <1>	|1번 파일 삭제하기|
|git restore	|복구?|
|git restore --staged	modifed |상태 이전으로 회귀|




## Summary

| 명령어                             | 설명                                                |
| ---------------------------------- | --------------------------------------------------- |
| `$ git init`                       | 빈 디렉토리(폴더)를 git 저장소(repo)로 초기화 한다. |
| `$ git add <filename>`             | `<filename>`을 Stage 에 올린다.                     |
| `$ git status`                     | 상황을 알 수 있다.                                  |
| `$ git commit -m "commit message"` | Stage를 massage를 작성하여commit 한다               |
| `$ git log`                        | 작업들을 조회할 수 있다.                            |



