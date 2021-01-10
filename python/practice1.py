'''
1. 첫번째와 세번째 문자를 출력하세요.
letters = 'python'
'''
letters = 'python'
print(letters[0]+letters[2])

'''
2.뒤에 4자리만 출력하세요.
 cn="24가 2210"
'''
cn="24가 2210"
print(cn[-4:])

'''
3. 문자열에서 '파' 만 출력하세요.
s = "파이썬파이썬파이썬"
'''
s = "파이썬파이썬파이썬"
print(s[0]+s[3]+s[6])
print(s[::3])
# offset : 몇 칸을 건너뛸것인지 양수(좌->우), 음수(우->좌)
'''
4.문자열 '720'를 정수형으로 변환해보세요.
num_str = "720"
'''
num_str = "720"
num_int = int(num_str)
print(type(num_int))

'''
5. 문자열 "15.79"를 실수(float) 타입으로 변환해보세요.
data = "15.79"
'''
data = "15.79"
data_float = float(data)
print(type(data_float))

'''
6. 에어컨이 월 48,584원에 무이자 36개월의 조건으로 홈쇼핑에서 
판매되고 있습니다. 총 금액은 계산한 후 이를 화면에 출력해보세요.

'''
air_month = 48584
# print(type(air_month))
air_total = air_month*36
print(air_total)
print("에어컨이 월 %d원에 무이자 36개월의 조건으로 홈쇼핑에서 판매되고 있습니다. 총 금액은 %d원 입니다." % (air_month, air_total))