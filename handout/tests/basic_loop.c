#include <stdint.h>

int main(){
    volatile int z = 3;
    volatile int x = 7;
    for(int i = 0; i < 10; i++){
        z = 2 + 3;
        x += i;
    }
    return 0;
}