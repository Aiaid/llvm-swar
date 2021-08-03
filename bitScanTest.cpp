// #include <stdio.h>
// #include <stdlib.h>
// #include <time.h>

// typedef long long U64; // long long

// class CGenBitScan
// {
// public:
//    //==========================================
//    // constructor immediately starts the search
//    //==========================================
//    CGenBitScan(int match4nth) {
//       clock_t start, stop;
//       m_dBCount = 0;
//       m_Match4nth  = match4nth;
//       initPow2();
//       start = clock();
//       m_Lock = pow2[32]; // optimization to exclude 32, see remarks 
//       try {findDeBruijn(0, 64-6, 0, 6);} catch(int){}
//       stop = clock();
//       printf("\n%.3f Seconds for %d De Bruijn Sequences found\n", (float)(stop - start) / CLOCKS_PER_SEC, m_dBCount);
//    }

// private:
//    U64 pow2[64];    // single bits
//    U64 m_Lock;      // locks each bit used
//    int m_dBCount;   // counter
//    int m_Match4nth; // to match

//    //==========================================
//    // on the fly initialization of pow2
//    //==========================================
//    void initPow2()  {
//       pow2[0] = 1;
//       for (int i=1; i < 64; i++)
//          pow2[i] = 2*pow2[i-1];
//    }

//    //==========================================
//    // print the bitscan routine and throw
//    //==========================================
//    void bitScanRoutineFound(U64 deBruijn) {
//       int index[64], i;
//       for (i=0; i<64; i++) // init magic array
//          index[ (deBruijn<<i) >> (64-6) ] = i;
//       printf("\nconst U64 magic = 0x%08x%08x; // the %d.\n\n",
//               (int)(deBruijn>>32), (int)(deBruijn), m_dBCount);
//       printf("const unsigned int magictable[64] =\n{\n");
//       for (i=0; i<64; i++) {
//          if ( (i & 7) == 0 ) printf("\n  ");
//          printf(" %2d,", index[i]);
//       }
//       printf("\n};\n\nunsigned int bitScanForward (U64 b) {\n");
//       printf("    return magictable[((b&-b)*magic) >> 58];\n}\n");
//       // throw 0; // unwind the stack until catched
//    }

//    //============================================
//    // recursive search
//    //============================================
//    void findDeBruijn(U64 seq, int depth, int vtx, int nz) {
//       if ( (m_Lock & pow2[vtx]) == 0 && nz <= 32 ) { // only if vertex is not locked
//          if ( depth == 0 ) { // depth zero, De Bruijn Sequence found, see remarks
//             if ( ++m_dBCount == m_Match4nth )
//                bitScanRoutineFound(seq);
//          } else {
//             m_Lock ^= pow2[vtx]; // set bit, lock the vertex to don't appear multiple
//             if ( vtx == 31 && depth > 2 ) { // optimization, see remarks
//                 findDeBruijn( seq | pow2[depth-1], depth-2, 62, nz+1);
//             } else {
//                 findDeBruijn( seq, depth-1, (2*vtx)&63, nz+1); // even successor
//                 findDeBruijn( seq | pow2[depth-1], depth-1, (2*vtx+1)&63, nz); // odd successor
//             }
//             m_Lock ^= pow2[vtx]; // reset bit, unlock
//          }
//       }
//    }
// };

// int main(int argc, char* argv[])
// {
//    if (argc < 2)
//       printf("usage: genBitScan 1 .. %d\n", 1<<26);
//    else
//       CGenBitScan(atoi(argv[1]));
//    return 0;
// }

// C++ code for counting trailing zeros
// in binary representation of a number
#include<bits/stdc++.h>
#include <bitset>
using namespace std;
 
int countTrailingZero(int x)
{
     // Map a bit value mod 37 to its position
     static const int lookup[] = {
      64,  0,  1, 39,  2, 15, 40, 23,
       3, 12, 16, 59, 41, 19, 24, 54,
       4, -1, 13, 10, 17, 62, 60, 28,
      42, 30, 20, 51, 25, 44, 55, 47,
       5, 32, -1, 38, 14, 22, 11, 58,
      18, 53, 63,  9, 61, 27, 29, 50,
      43, 46, 31, 37, 21, 57, 52,  8,
      26, 49, 45, 36, 56,  7, 48, 35,
       6, 34, 33, -1 };
 
     // Only difference between (x and -x) is
     // the value of signed magnitude(leftmostbit)
     // negative numbers signed bit is 1
     return lookup[(-x & x) % 67];
}

int countLeadingZeros(int x){
   std::bitset<32> y(x);
   std::cout << y << '\n';
   x = x | (x >> 1);
   std::bitset<32> b(x);
   std::cout << b << '\n';
   x = x | (x >> 2);
   std::bitset<32> c(x);
   std::cout << c << '\n';
   x = x | (x >> 4);
   std::bitset<32> d(x);
   std::cout << d << '\n';
   x = x | (x >> 8);
   std::bitset<32> e(x);
   std::cout << e << '\n';
   x = x | (x >>16);
   return x;
}
 
// Driver Code
int main()
{
   //  cout << countTrailingZero(56) << endl;
    cout << countLeadingZeros(59523040) << endl;
    return 0;
}