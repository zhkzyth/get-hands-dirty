#include<iostream>  
#include<iomanip>   
#include "math.h"  
using namespace std;  

void tromino(int **,int ,int ,int ,int ,int );  
int flag=2;  
int main()  
{  
   int n;  
   cout<<"请输入一个值，棋盘的大小为2的n次方：";  
   cin>>n;  
   int i=(int)pow((double)2,(double)n);  
   int **chessboard=NULL;  
   chessboard=new int* [i];        //动态开辟二维数组，先开辟第一维指针数组   

   for(int j=0;j<i;j++)            //开辟第二维   
   {  
      chessboard[j]=new int[i];  
   }  

   for(int j=0;j<i;j++)            //初始化二维数组   
      for(int k=0;k<i;k++)  
         chessboard[j][k]=0;  
   cout<<"输入开始时缺少方块的两个下标（小于"<<i<<"）：";   
   int a,b;   //a为缺块的第一维下标，b为第二维下标  
   cin>>a>>b;  
   chessboard[a][b]=1;            //初始缺块标为1   
   cout<<"棋盘开始时缺块标为1，它在棋盘的第"<<a+1<<"行，第"<<b+1<<"列"<<endl;  
   tromino(chessboard,0,0,i,a,b);  
   cout<<"tromino解为："<<endl;   

   for(int j=0;j<i;j++)  
   {  
      for(int k=0;k<i;k++)  
         cout<<setw(4)<<left<<chessboard[j][k];  
      cout<<endl;  
   }  
   delete chessboard;  
   system("pause");  
   return 0;  
}  

//a为二维数组名，x1,y1为分块的左上角元素下标， length为分块的大小，x,y为缺块的下标   
void tromino(int **a,int x1,int y1,int length,int x,int y)   
{                                                            
   int i=length/2;              
   if(i-1==0)  
   {  
      if(x<=x1+i-1&&y>y1+i-1)    //缺块在第一象限  
      {
         cout<<"test"<<endl;
         a[x1+i-1][y1+i-1]=a[x1+i][y1+i-1]=a[x1+i][y1+i]=flag++;  //分别为2,3,4   
      }
      else if(x<=x1+i-1&&y<=y1+i-1)   //缺块在第二象限  
         a[x1+i-1][y1+i]=a[x1+i][y1+i]=a[x1+i][y1+i-1]=flag++;    //分别为1,4,3   
      else if(x>x1+i-1&&y<=y1+i-1)    //缺块在第三象限  
         a[x1+i-1][y1+i-1]=a[x1+i-1][y1+i]=a[x1+i][y1+i]=flag++;  //分别为2,1,4   
      else  
         a[x1+i-1][y1+i-1]=a[x1+i-1][y1+i]=a[x1+i][y1+i-1]=flag++;//分别为2,1,3   
   }  
   else  
   {  
      if(x<=x1+i-1&&y>y1+i-1)   
      {     
         a[x1+i-1][y1+i-1]=a[x1+i][y1+i-1]=a[x1+i][y1+i]=flag++;  
         tromino(a,x1,y1+i,i,x,y);             //解第一象限   
         tromino(a,x1,y1,i,x1+i-1,y1+i-1);       //解第二象限       
         tromino(a,x1+i,y1,i,x1+i,y1+i-1);         //解第三象限   
         tromino(a,x1+i,y1+i,i,x1+i,y1+i);           //解第四象限   
      }  
      else if(x<=x1+i-1&&y<=y1+i-1)  
      {  
         a[x1+i-1][y1+i]=a[x1+i][y1+i]=a[x1+i][y1+i-1]=flag++;  
         tromino(a,x1,y1+i,i,x1+i-1,y1+i);         //解第一象限   
         tromino(a,x1,y1,i,x,y);           //解第二象限   
         tromino(a,x1+i,y1,i,x1+i,y1+i-1);         //解第三象限   
         tromino(a,x1+i,y1+i,i,x1+i,y1+i);           //解第四象限   
      }  
      else if(x>x1+i-1&&y<=y1+i-1)  
      {  
         a[x1+i-1][y1+i-1]=a[x1+i-1][y1+i]=a[x1+i][y1+i]=flag++;  
         tromino(a,x1,y1+i,i,x1+i-1,y1+i);         //解第一象限   
         tromino(a,x1,y1,i,x1+i-1,y1+i-1);       //解第二象限   
         tromino(a,x1+i,y1,i,x,y);           //解第三象限   
         tromino(a,x1+i,y1+i,i,x1+i,y1+i);           //解第四象限   
      }  
      else  
      {  
         a[x1+i-1][y1+i-1]=a[x1+i-1][y1+i]=a[x1+i][y1+i-1]=flag++;//分别为2,1,3   
         tromino(a,x1,y1+i,i,x1+i-1,y1+i);         //解第一象限   
         tromino(a,x1,y1,i,x1+i-1,y1+i-1);       //解第二象限  
         tromino(a,x1+i,y1,i,x1+i,y1+i-1);         //解第三象限  
         tromino(a,x1+i,y1+i,i,x,y);           //解第四象限   
      }  
   }  
}  
