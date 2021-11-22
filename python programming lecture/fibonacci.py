def fibo1(n): # n까지 피보나치 수열 출력
    a, b = 0, 1
    while b < n:
        print(b, end=' ')
        a, b = b, a+b
    print()

def fibo2(n): # n까지 피보나치 수열 반환
    result = []
    a, b = 0, 1
    while b < n:
        result.append(b)
        a, b = b, a+b
    return result

if __name__ == '__main__':
    import sys
    if(len(sys.argv) == 2):
        fibo1(int(sys.argv[1]))
    else:
        fibo1(200)