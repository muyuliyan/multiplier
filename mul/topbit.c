#include <stdio.h>

// 函数：判断最高位是1还是0
int checkHighestBit(int num) {
    // 如果num为0，直接返回0
    if (num == 0) {
        return 0;
    }

    // 从最高位开始逐位检查
    int bit = 31; // 假设32位整数
    while (bit >= 0) {
        // 使用位运算判断当前位是否为1
        if ((num & (1 << bit)) != 0) {
            return 1; // 找到最高位为1
        }
        bit--;
    }
    return 0; // 如果没有找到1，返回0
}

int main() {
    int num;
    printf("请输入一个整数：");
    scanf("%d", &num);

    int result = checkHighestBit(num);
    printf("最高位数字是：%d\n", result);

    return 0;
}