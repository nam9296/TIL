"""
입출력 종류 : 표준, 파일, 네트워크
파일 입출력
open() : 파일 열기 -> 파일 입[read()]/출력[write()]
->파일 닫기[close()]

휴대폰 메모리(RAM) 2GB - 게임 (1GB),음악(500MB),인터넷(500MB) 인데
외부 전화가 걸려옴(전화앱 실행) 램이 가득차서 실행이 안됨
=> 결론 : 메모리 관리를 소홀히 하지 말자 !
"""
#
# # 파일에 문자열 출력(쓰기)
# f = open("hello.txt",'w') # 파일을 쓰기 용도로 열기
# # open("파일명",모드"r"or"w")
# # 프로그램 상에서는 쓰기 모드로 열려있는 hello.txt 파일이 f라는 이름으로 사용됨
#
# f.write('hello world')
# f.close()
#
# # 파일로부터 문자열 입력(읽기)
# f=open("hello.txt","r")
# s=f.read() # 읽은 내용을 저장 따로 해야함
# f.close()

# # with ~ as 구문은 파일을 사용한 뒤에 자동으로 파일을 닫아줌
# # with open(파일이름,모드) as 파일변수 :
# #   코드
#
# with open("hello.txt","r") as f:
#     s=f.read()
#     print(s)
# # close 작업이 자동으로 수행됨

# # 파일에 여러 줄 출력
# # w모드로 열게되면 기존에 작성되어 있던 내용은 사라짐
# with open("hello.txt","w") as f:
#     for i in range(10):
#         f.write("hello world {0}\n".format(i+1))

# # 리스트의 내용을 파일에 출력
# lines=['hello\n','niceto meetyou\n','good bye\n']
# with open("hello.txt","w") as f:
#     f.writelines(lines)

# # 인코딩 에러 발생시
# # file->setting->editor->file encodings->project encoding -> utf-8 변경
# with open("hello.txt",'r') as f:
#     s=f.read() # 전체를 읽어들임
#     print(s)

# readline 함수는 1줄씩 읽어들임(for 또는 while 문과 함께 사용)
# with open("hello.txt",'r') as f:
#     line=None
#     while line !="":
#         line=f.readline() 
#         #print(line) # 2줄이 바뀜
#         print(line.strip("\n")) # \n삭제

# # readlines 함수는 전체를 읽어드림(리스트의 형태로)
# with open("hello.txt",'r') as f:
#     line=f.readlines()
#     #for i in range(len(line)):
#     for i in line:
#         print(i.strip("\n"))

# # 피클(pickle) : 파이썬 객체를 파일로 저장하고자 하는 경우에 사용되는 모듈
# # 피클링 : 객체를 파일로 읽어들임
# # 언피클링 : 파일을 객체로 읽어들임
#
# # 문자열
# # hello
# # niceto meetyou
# # good bye
#
# # 문자열 객체 (구조가 있으면 객체)
# # kim
# # 서울시 강남구
# # 23
# # 컴퓨터
#
# # lee
# # 서울시 강북구
# # 33
# # 국어
#
# # 객체를 파일로 저장할때는 wb모드로 파일열기
#
# 내용물 = "단팥"
# 색상 = "파랑"
# 너비 = "20센치"
# 높이 = "10센치"
# 가족명단 = {"잉어":30,"꽃게":10,"상어":40}# 딕셔너리 구조로
# # 엑셀->객체로 저장됨(xls, binary)->
# import pickle
# with open("myfish.p","wb") as f:# write binary
#     pickle.dump(내용물,f)
#     pickle.dump(색상, f)
#     pickle.dump(너비, f)
#     pickle.dump(높이, f)
#     pickle.dump(가족명단, f)
#
# # 파일을 객체로
# import pickle
# with open("myfish.p","rb") as f:# read binary
#     내용물 = pickle.load(f)
#     색상 = pickle.load(f)
#     너비 = pickle.load(f)
#     높이 = pickle.load(f)
#     가족명단 = pickle.load(f)
#
#     print(내용물)
#     print(색상)
#     print(너비)
#     print(높이)
#     print(가족명단)
#
# f = open("hello.txt","a") # append
# for i in range(3):
#     f.write("%d번째줄 추가\n"%(i+1))
# f.close()


# class(클래스) :붕어빵 기계, 객체: 붕어빵, 메서드 : 굽는다.
# attribute(속성) : 내용물, 크기, 모양 등등

# res = 0
# def add(n):
#     # n에 전달된 값을 res에 저장하고싶다.
#     global res
#     res+=n
#
# add(3)
# print(res)
# add(4)
# print(res)

# res1 = 0 # 전역변수
# res2 = 0
#
# # 편의점-> 계산대 -> 계산기 2대
#
# # 첫번째 계산기
# def add1(n): # 지역변수
#     global res1
#     res1+=n
#     return res1
# print(add1(3000)) # 맥주
# print(add1(5000)) # 오징어
#
#
# # 두번째 계산기
# def add2(n): # 지역변수
#     global res2
#     res2+=n
#     return res2
# print(add2(1500)) # 막걸리
# print(add2(2000)) # 두부
#
# # 클래스 : 각각의 계산기를 객체로 간주하고, 계산기의 특성 또는 동작등을 일반화한 틀
#
# # 정/부정 관사
# # the car (객체)  / # 사람홍길동(객체)
# # a car (클래스) / 사람(클래스)
# # 자동차(클래스) : 실체가 없음
# # 내자동차(객체) : 실체가 있음
#
# class Calculator: # 통상적으로 클래스명은 대문자로 시작
#     def __init__(self):
#         self.res=0
#         print("init함수의 호출")
#     def add(self,n):
#         self.res+=n
#         # 10% 할인코드 여기에 작성 -> 모든 계산기에 공통적으로 적용
#         return self.res
# # Calculator() :
# # 붕어빵 기계에서 붕어빵을 제작 - > __init__자동호출-> res(내용물)=0
#
# # 클래스로 부터 객체를 생성 (init함수 자동 호출)
# cal1=Calculator() # 계산대(클래스)로부터 계산기 1(객체)을 생성
# cal2=Calculator()
#
# print(cal1.add(3000)) #붕어빵.붕어빵크기(20)
# print(cal1.add(5000)) #붕어빵.붕어빵너비(10)
#
# print(cal2.add(1500))
# print(cal2.add(2000))
#
# # 객체지향프로그래밍



# # 모듈 : 변수, 함수, 클래스 등을 모아 놓은 파이썬 파일.
# # 다른 프로그램에서 모듈을 불러올 수 있음
# import mod1

# print(mod1.m_add(1,2))

# import mod1 as m
# print(m.m_add(1,2))

# import pandas as pd
# import numpy as np
# import matplotlib.pyplot as plt

# import 모듈이름
# mod1 모듈에 정의되어 있는 m_sub 메서드만 가져와라
# from mod1 import m_sub
# print(m_sub(1,2))

# from mod1 import *
# print(m_sub(11,2)+m_add(1,2))




































































































