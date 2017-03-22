## 二進数リテラル

二進数リテラルは整数リテラルを二進数で記述する機能だ。整数リテラルのプレフィクスに0Bもしくは0bを書くと、二進数リテラルになる。整数を表現する文字は0と1しか使えない

~~~cpp
int main()
{
    int x1 = 0b0 ; // 0
    int x2 = 0b1 ; // 1
    int x3 = 0b10 ; // 2
    int x4 = 0b11001100 ; // 204
}
~~~

二進数リテラルは浮動小数点数リテラルには使えない。

機能テストマクロは__cpp_binary_literals。値は201304
