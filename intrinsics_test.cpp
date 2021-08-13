#include <immintrin.h>
#include <iostream>

void pdepTest() {
    u_int64_t a = 39; // 100111
    u_int64_t mask = 219; // 011011011
    u_int64_t res = _pdep_u64 (a, mask);
    std::cout << res << std::endl;
}

void pextTest() {
    u_int64_t a = 139; // 10001011
    u_int64_t mask = 219; // 011011011
    u_int64_t res = _pext_u64 (a, mask);
    std::cout << res << std::endl;
}

int main() {
    pextTest();
    return 0;
}

