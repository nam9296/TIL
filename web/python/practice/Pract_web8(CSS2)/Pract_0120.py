'''
1. 아마존 면접문제

A사무실에는 특정일자의 출퇴근 시간이 기록된 거대한 로그파일이 있다고 한다.

파일의 형식은 다음과 같다. (한 라인에서 앞부분은 출근시간(HH:MM:SS), 뒷부분은 퇴근시간이다)

09:12:23 11:14:35
10:34:01 13:23:40
10:34:31 11:20:10
특정시간을 입력(예:11:05:20)으로 주었을 때 그 시간에 총 몇 명이 사무실에 있었는지 알려주는 함수를 작성하시오.

'''
check = '''09:12:23 11:14:35
10:34:01 13:23:40
10:34:31 11:20:10'''

def Remain_Member(time):
    at_Time = '11:05:20'
    count = 0
    Time_log = time.split('\n')

    for i in Time_log:
        i = i.split(' ')
        if at_Time > i[0] and at_Time< i[1]:
            count += 1
        else:
            break

    print("{0}에 사무실에는 {1}명 남아있었습니다.".format(at_Time,count))

Remain_Member(check)