# map(함수,자료)

# def twoTimes(n):
#     return [2*i for i in n]
# res= list(map(lambda x:x*2,[1,2,3]))
# print(res)

# def twoTimes(n):
#     alist=[]
#     for i in n:
#         i*=2
#         alist.append(i)
#     return alist


# def twoTimes(n):
#     return n*2
# res = list(map(twoTimes,[1,2,3]))
# print(res) # [2,4,6]



# # pow(a,b) : a**b
# print(pow(3,2))
# print(3**2)  # 같은 의미



# # round(수, 반올림 자릿수)
# print(round(3.141592,4)) #3.1416

# # zip  : 동일한 위치의 자료를 객체로 만들어줌
# print(list(zip([1,2],[3,4],[5,6],[7,8]))) #[(1, 3, 5, 7), (2, 4, 6, 8)]


# # filter : 특정 조건으로 걸러진 요소들을 묶어서 리턴,
# # map과의 차이점이라면, 함수의 결과가 참/거짓 인지에 따라 요소를 포함할지를 결정함
#
# t=list(range(1,11))
# # print(t) #[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# # 짝수 리스트만 출력해보자
#
# def isEven(n):
#     return True if n%2==0 else False
# # 1. for문
# for v in t:
#     print(isEven(v)) # [2, 4, 6, 8, 10]
#
# # 2. filter
# print(list(filter(isEven,t))) #[2, 4, 6, 8, 10]
#
# # 3. lambda
# print(list(filter(lambda x : x%2 ==0 ,t))) #[2, 4, 6, 8, 10]



# # os 모듈 : 디렉토리, 파일의 경로 등을 확인/제어
# import os
# print(os.environ) # 환경변수
# print(os.getcwd()) # 현재 작업 경로 working derectory
# # os.mkdir("sample") # 현재 작업 위치에 폴더를 생성
# # os.rmdir("sample") # 폴더를 삭제
# # os.rename("sample","test") # 폴더명 변경
# # os.renames("hello.txt", "hi.txt")

# import shutil
# # shutil.copy("hi.txt","hicopy.txt") # 파일을 복사하는 함수

# # glob 모듈 : 특정 폴더 내에 있는 폴더 또는 파일 목록 등을 조사
# import glob
# # day로 시작하는 모든 파일을 출력
# print(glob.glob("C:/Users/82105/PycharmProjects/pythonBasic/day*"))
# # 확장자가 ,py인 파일들을 출력
# print(glob.glob("C:/Users/82105/PycharmProjects/pythonBasic/*.py"))






















