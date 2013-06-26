//refer: http://wenku.baidu.com/view/0dddf7dead51f01dc281f1c6.html
#include<stdio.h>
#define N 16
int a[100][100];
int t=1;

void Tromino(int (*a)[N],int dr,int dc,int tr,int tc,int size){
   int s;
   if(size==1) return;
      s = size/2;
      
      if (dr<=(tr+s-1)&&dc<=(tc+s-1)) {
         /* 特殊方格在左上角 */
         a[tr+s-1][tc+s] = t;
         a[tr+s][tc+s]=t;
         a[tr+s][tc+s-1]=t;
         t++;

         //递归，减少一个层级
         //顺时针
         Tromino(a,dr,dc,tr,tc,s);
         Tromino(a,tr+s-1,tc+s,tr,tc+s,s);
         Tromino(a,tr+s,tc+s,tr+s,tc+s,s);
         Tromino(a,tr+s,tc+s-1,tr+s,tc,s);
      }

      if (dr<=(tr+s-1)&&dc>(tc+s-1)) {
         /* 右上角 */
         a[tr+s-1][tc+s-1]=t;
         a[tr+s][tc+s]=t;
         a[tr+s][tc+s-1]=t;
         t++;

         //递归，减少一个层级
         Tromino(a,tr+s-1,tc+s-1,tr,tc,s);
         Tromino(a,dr,dc,tr,tc+s,s);
         Tromino(a,tr+s,tc+s,tr+s,tc+s,s);
         Tromino(a,tr+s,tc+s-1,tr+s,tc,s);
      }

      if (dr>(tr+s-1)&&dc>(tc+s-1)) {
         /*右下角*/
         a[tr+s-1][tc+s-1]=t;
         a[tr+s-1][tc+s]=t;
         a[tr+s][tc+s-1]=t;
         t++;

         //
         Tromino(a,tr+s-1,tc+s-1,tr,tc,s);
         Tromino(a,tr+s-1,tc+s,tr,tc+s,s);
         Tromino(a,dr,dc,tr+s,tc+s,s);
         Tromino(a,tr+s,tc+s-1,tr+s,tc,s);
      }

      if (dr>(tr+s-1)&&dc<=(tc+s-1)) {
         /* 左下角 */
         a[tr+s-1][tc+s-1]=t;
         a[tr+s-1][tc+s]=t;
         a[tr+s][tc+s]=t;
         t++;

         //
         Tromino(a,tr+s-1,tc+s-1,tr,tc,s);
         Tromino(a,tr+s-1,tc+s,tr,tc+s,s);
         Tromino(a,tr+s,tc+s,tr+s,tc+s,s);
         Tromino(a,dr,dc,tr+s,tc,s);
      }
}

int main(){
   int i,j,dr,dc,a[N][N];
   printf("please input dr(0<dr<%d):",N);
   scanf("%d",&dr);
   printf("please input dc(0<dc<%d):",N);
   scanf("%d",&dc);
   a[dr][dc]=0;
   Tromino(a,dr,dc,0,0,N);
   for (i = 0; i < N; i++) {
      for (j = 0; j < N; j++) {
         printf("%-4d",a[i][j]);
      }
      printf("\n");
   }
   system("pause");
}

/*void ChessBoard(tr,tc,dr,dc,s){*/
/*t++;*/
/*s = s/2;*/
/*if(s==1) return;*/
/*//缺点在左上限*/
/*if(dr<=tr+s-1&&dc<=tc+s-1){*/
/*ChessBoard(tr,tc,dr,dc,s);*/
/*}else{*/
/*board[tr+s-1][tc+s-1]=t;*/
/*ChessBoard(tr,tc,tr+s-1,tc+s-1,s);*/
/*}*/
/*//缺点在右上限*/
/*if(dr<=tr+s-1&&dc>tc+s-1){*/
/*ChessBoard(tr,tc+s,dr,dc,s);*/
/*}else{*/
/*board[tr][tc+s-1] = t;*/
/*ChessBoard(tr,tc+s,tr,tc+s-1,s);*/
/*}*/
/*//缺点在右下限*/
/*if (dr>tr+s-1&&dc>tc+s-1) {*/
/*ChessBoard(tr+s,tc+s,dr,dc,s);*/
/*}else{*/
/*board[tr+s][tc+s] = t;*/
/*ChessBoard(tr+s,tc+s,tr+s,tc+s,s);*/
/*}*/
/*//缺点在左下限*/
/*if (dr>=tr+s&&dc<=tc+s-1) {*/
/*ChessBoard(tr+s,tc,dr,dc,s);*/
/*}else{*/
/*board[tr+s][tc+s-1] = t;*/
/*ChessBoard(tr+s,tc,tr+s,tc+s-1,s);*/
/*}*/
/*}*/
