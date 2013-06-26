#include<stdio.h>

int main(int argc, const char *argv[])
{
   int c,i,nwhite,nother;
   int ndigit[10];

   nwhite = nother = 0;
   for (i = 0; i < 10; i++) {
      ndigit[i] = 0;
   }

   while((c=getchar())!=EOF){
      if (c >= '0' && c <= '9') {
         ++ndigit[c-'0'];
      }else if ( c==" " || c=="\n" || c == "\t"){
         ++nwhite;
      }else{
         ++nother;
      }
   }
   printf("digits = ");
   for (i = 0; i < 10; i++) {
      printf("%4d",ndigit[i]);
   }
   printf(", whitespace = %d, other= %d\n",
         nwhite, nother);
   return 0;
}
