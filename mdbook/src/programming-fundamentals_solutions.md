# Solutions

## Happy Numbers


```python
import sys

def is_happy(num: int = 19, timeout: int = 100) -> bool:
    for _ in range(timeout):
        nums = [int(i) for i in str(num)]
        print(sq_nums := [i**2 for i in nums], end=" ", file=sys.stderr)
        print(num := sum(sq_nums), file=sys.stderr)
        if num == 1:
            return True
    return False


[i for i in range(1, 1000) if is_happy(i)]
```


```python
def is_happy_max_iter(num: int = 19, debug: bool = True) -> list[int]:
    orig_num = num
    for i in range(100):
        nums = [int(i) for i in str(num)]
        print(sq_nums := [i**2 for i in nums], end=" ", file=sys.stderr)
        print(num := sum(sq_nums), file=sys.stderr)
        if num == 1:
            return (i, orig_num)
    return (0, 0)


max([is_happy_max_iter(i) for i in range(1, 1000)])
```

