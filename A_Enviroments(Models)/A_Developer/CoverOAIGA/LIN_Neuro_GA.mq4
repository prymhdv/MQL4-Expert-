//+------------------------------------------------------------------+
//|                                           LIN_Neuro_GA.mq4 |
//+------------------------------------------------------------------+
#property copyright "Copyright � 2006, klot."
#property link      "klot@mail.ru + from Andrey Rybin: me@adeka.name ;)"
//------
#define MAXPOP	   200     // ������������ ���������� ������ � ���������
#define MAXWEIGHTS	13   // ���������� �������������� ����������, �.�. �����
#define BARN 50           // ����� ����� ��� ����������� �� �� �������
//-------
double      threshold = 0.7;    // ����� ��� �������� �������

double signal[BARN];
//-------------
bool Optimize = false; //Optimise - �������� ����� ����������. (��� ����������� ���� ����������� � ���� �� ����, ����� ���������, Optimise ����� ����������� � false. ���� ����� �������� �� �����).

static datetime New_Time = 0;
//-------------
double ww[MAXWEIGHTS]; //���� ����
//-----
double fitness[MAXPOP];
//-----
double population[MAXPOP][MAXWEIGHTS];  // Population

int maxOrders = 3;
double lots = 0.1;
extern double       sl = 10;
extern double       tp = 10;

static int          prevtime = 0;

//+------------------------------------------------------------------+
//|   ������� ���������� ��������� (gene[])  ����� (int p)           |
//+------------------------------------------------------------------+
void GetGene(int p, double &gene[MAXWEIGHTS]) 
 {
   for(int j=0; j<MAXWEIGHTS; j++) gene[j]=population[p][j]; //�������� ������, ���� ��� ���? ���������� ����� Nosob
   return;
 }
//+------------------------------------------------------------------+
//|  �������� ������� �����������   ���������� ������ ��������       |
//|     ���������������, �.� ���������� �����                                        |
//+------------------------------------------------------------------+
int Solve() 
{
	int osob = -1;
	double fit=-1;
	// Generate initial population.
	MathSrand(TimeLocal());
   //--- ������������ ��������� ��������� -------------
	for(int i=0; i<MAXPOP; i++) 
	   {			
		  for (int j=0; j<MAXWEIGHTS; j++) 
		    {		
			  population[i][j]=(MathRand() % 200)/100.0-1.0;
		    }
	   }
   //---
	int iterations = 0;	 // Keep record of the iterations.
	int TotalIterations = 0;
	double Oldfit=-1;
	int Oldosob=-1;
	//+-- ���� �������� ------------------------------------+
	//| ���� � ������� 50 ��������� ��������� �� ���������� +
	//| ����������� �����������                             +
	//+-----------------------------------------------------+			
	while ( (iterations<50) ) 
	    {
	       //---
          osob=CreateFitnesses(fit);
	       //--- ���������� ������� ������ ��� ���� ���������� ��������� ----
	       if( (osob!=Oldosob) || (fit>Oldfit) ) 
	         {
	           //---
	  	        iterations=0;
	            Oldfit=fit;
	            Oldosob=osob;
		       }
	       //---
	       CreateNewPopulation(osob);
	       //---
		    iterations++;
		    TotalIterations++;
	     }
   //---
   Print("TotalIterations = ",TotalIterations, " ������ ����� � ",osob," fit = ",fit);
	return (osob);
}
//+------------------------------------------------------------------+
//|   ������� ���������� ������ ����� �����                          |
//|   � ������� ������� �� ���� ���������   (double &avgfit)         |
//+------------------------------------------------------------------+
int CreateFitnesses(double &avgfit) 
{
   //---
   double gen[];
	double max=0;
	int maxFitnessIndex=-1;
   ArrayResize(gen,MAXWEIGHTS);
	//---
	avgfit=0;
	for(int i=0;i<MAXPOP;i++) 
	    {
	       //---
	       GetGene(i,gen);
		    fitness[i]=TStrategy1(gen,true); //�������� �������
		    //Print("FITNESS: ",fitness[i]);
		    //---
		    if (fitness[i]>max ) 
		        {  
		         max=fitness[i];
			      maxFitnessIndex=i;
		        }
		        
		    avgfit += fitness[i];
				    //Print ("AVGFIT ",avgfit);
	      }
	avgfit=avgfit/MAXPOP;
	//---
	return(maxFitnessIndex);
}
//+------------------------------------------------------------------+
//|   ������� ������� ����� ��������� ����� ��������� ������ � ����������, � �������� �����                     |
//+------------------------------------------------------------------+
void CreateNewPopulation(int osob) 
{
   //---
	int i=0,j=0;
	int crossover=0;
	int mutate=0;
	double xromosoma[];
	ArrayResize(xromosoma,MAXWEIGHTS);
	//---
	GetGene(osob,xromosoma);
	//---
	MathSrand(MathRand());
	//---
	for( i=0; i<MAXPOP; i++ ) 
	   {
	       //---
		    if ( i==osob ) 
		        {	 // ��������� ����������� ���� � �����
		          continue; 
		        }
		     //---- ����������� ����� ���� ����� �������� ������ ����� -----
		    crossover = (MathRand() % (MAXWEIGHTS-2));
		    
		    if ( crossover==0 ) crossover=crossover+1;
		    //---- �������������� -----
		    for( j=crossover; j<MAXWEIGHTS; j++ ) 
		       {
			      population[i][j]=xromosoma[j];
		       }
		    //---- ����� (10%) ������ � ��������� ������������ �������� -----
		    mutate=(MathRand() % 100);
		    //----
		    if( mutate <= 10 ) 
		      {
		        for( j=0; j<MAXWEIGHTS; j++ ) 
		           {
			          population[i][j]=(MathRand() % 200)/100.0-1.0;
		           }
		      }
	  }
	  //---
	return;
}
//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
{
  int i;
  int handle;
  double value;
  //---
  if( !Optimize ) 
    {
       handle=FileOpen("weightsN.dat",FILE_BIN);
       if(handle>0)  
       {
        for(i=0; i<MAXWEIGHTS; i++) 
           {
            ww[i]=FileReadDouble(handle,DOUBLE_VALUE);
           }
        FileClose(handle);
       } 
       else 
       {
        //-----
        MathSrand(TimeLocal());
        for(i=0; i<MAXWEIGHTS; i++) ww[i]=(MathRand() % 200)/100.0-1.0;
        //-----
    }
 }
   return(0);
}
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
  {
      //------
     static int Nosob=-1;
     int nbar=iBarShift(Symbol(),PERIOD_D1,Time[0]);
     if( Optimize==true && New_Time!=iTime(Symbol(),PERIOD_D1,nbar) )  
        {
           //----
           Nosob=Solve(); //Nosob - ������ �����?
           //----
           if( Nosob!=-1 )GetGene(Nosob,ww);
           //----
           writeweights();
           //----
           New_Time=iTime(Symbol(),PERIOD_D1,nbar);
        }
    //---
    if(Optimize==false) {CheckForOpen(ww);}
    if(Optimize==true) {double profit=TStrategy1(ww,false);}
    //Print("����� �������= ",profit," ������ ����� � ",Nosob);
    //-----
 return(0);
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double TStrategy1(double wa[],int fOpt=false) //������� ������� � ��
{
   int shift,k=0;
   string name="Signal";
   double in[4];
   int lastbuy=0,lastsell=0,trend=0;
   double profit,profit0;
   double spread=MarketInfo(Symbol(),MODE_SPREAD)*Point;
   double Buy[],Sell[];
   ArrayResize(Buy,BARN); //������������� ������ ������� ������ ������� �����, ���������������� �� �������
   ArrayResize(Sell,BARN);
   ArrayInitialize(Buy,0.0); //����� ��� ������
   ArrayInitialize(Sell,0.0);
   //--------------T3 �����������---------------------------------+
   double e1, e2, e3, e4, e5, e6, c1, c2, c3, c4, w1, w2, b2, b3;
   double n,b,t3;
   //----
      n=5;
      b=0.7;
      //-----
      b2=b*b;
      b3=b2*b;
      c1=-b3;
      c2=(3.0*(b2+b3));
      c3=-3.0*(2.0*b2+b+b3);
      c4=(1.0+3.0*b+b3+3*b2);
      //------
      if (n<1) n=1;
      n = 1.0+0.5*(n-1);
      w1 = 2.0/(n+1);
      w2 = 1.0-w1;
   //-------------------------------------------------------------+*/
   //-------------------------------------------------------------
   if(!fOpt) for(shift=BARN; shift>=0; shift--) //�������� �������� � ����������� � ����������� �����
   profit=0;
   profit0=0;
   for(shift=BARN; shift>=0; shift--) 
     {
         //-----����� ���� ---- //�� ���� �������� ���� �������
         in[0]=LinRegresSlope2(3,shift+1);
         in[1]=LinRegresSlope2(7,shift+1);
         in[2]=LinRegresSlope2(14,shift+1);
         in[3]=LinRegresSlope2(21,shift+1);
         //Print(in[0],in[1]);
         //----- ����� ���� -------------
         //Print("NET: ",neuronet1(wa,in));
         signal[shift] = neuronet1(wa,in); //�� ����� ���� ���� � �����
         //Print("SHIFT: ",shift," WA ",wa[shift]," SIGNAL: ",signal[shift]);

         //----- T3 ����������� --------
         e1 = w1*signal[shift] + w2*e1;
         e2 = w1*e1 + w2*e2;
         e3 = w1*e2 + w2*e3;
         e4 = w1*e3 + w2*e4;
         e5 = w1*e4 + w2*e5;
         e6 = w1*e5 + w2*e6;
         //-----
         t3=c1*e6+c2*e5+c3*e4+c4*e3;
         //Print("T3: ",t3);
         signal[shift]=t3;//�������� � �������� ������

  
         //-------------------------------------------------------------+
         //| �������                                                    |
         //-------------------------------------------------------------+
         if( signal[shift]>signal[shift+1] && signal[shift+2]>signal[shift+1]
             && signal[shift+1]<-threshold && trend!=1 ) 
               {
                 Buy[shift]=Close[shift]+spread;
                 trend=1;
                 lastbuy=shift;
                 k++;
                 //OrderSend(Symbol(), OP_BUY, 0.1, Ask, 3, Bid - 90 * Point, Bid + 90 * Point, WindowExpertName(), 999, 0, Blue); 
               }
         //------
         if( signal[shift]<signal[shift+1] && signal[shift+2]<signal[shift+1]
             && signal[shift+1]>threshold && trend!=-1 ) 
              { 
                Sell[shift]=Close[shift]-spread;
                trend=-1;
                lastsell=shift;
                k++;
              }
      
     
         //------������� �������-------------
         if( k>1 && ((Buy[shift]!=0 && Sell[lastsell]!=0) 
             || (Buy[lastbuy]!=0 && Sell[shift]!=0)) )    
             {
                //-------
                profit+=(Sell[lastsell]-Buy[lastbuy])/Point;
             }
       //------
     }
   //------������� ������� ������� ������ -------------
   profit0=0;
   if( lastbuy<lastsell &&  lastbuy>0 ) profit0=(Close[0]-Buy[lastbuy])/Point;
   if( lastsell<lastbuy && lastsell>0 ) profit0=(Sell[lastsell]-Close[0])/Point;
   //-----------------------+
   return(profit+profit0);
}
//+------------------------------------------------------------------+
//| 2-� ������� ��������� �� 3-� ��������                            |
//| ������ ���� - ��� �������                                        |
//| ������ ���� - ���� ������                                        |
//| ���� W[0], W[N+1], W[2*N+2] - ������ �������� ��������           |
//| N - ����� ������                                                 |
//| ����� �������������� ����� ������������� ��� N*2+2+3             |
//+------------------------------------------------------------------+
double neuronet1(double W[],double x[]) 
{
   int i;
   int N=ArraySize(x);
   //Print("N: ",N);
   if(ArraySize(W)!=N*2+5) 
      {
         Print("������! ������ ������� ����� ������ ���� = ",N*2+5);
         return(0);
      }
   double sum=0.0;
   double Out1=0.0, Out2=0.0;
   //---Neuron 1 ----------------+
   sum=W[0];
   //---
   for(i=1; i<=N; i++) 
      { 
        sum+=W[i]*x[i-1];
      }
   Out1=th(sum);
   //---Neuron 2 ----------------+
   sum=W[N+1];
   //---
   for(i=N+2; i<=2*N+1; i++) 
      { 
        sum+=W[i]*x[i-N-2];
      }
   Out2=th(sum);
   //---Neuron 3 ----------------+
   //Print("NN: ",th(Out1*W[2*N+3]+Out2*W[2*N+4]+W[2*N+2]));
   return(th(Out1*W[2*N+3]+Out2*W[2*N+4]+W[2*N+2]));
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double LinRegresSlope2(int length, int shift)
{
   int m_pos[2];
   m_pos[0]=shift;
   m_pos[1]=shift+length;
   int n=m_pos[1]-m_pos[0]+1;
//---- calculate price values
   double value=Close[m_pos[0]];
   double a,b,c;
   double sumy=value;
   double sumx=0.0;
   double sumxy=0.0;
   double sumx2=0.0;
   for(int i=1; i<n; i++)
       {
        value=Close[m_pos[0]+i];
        sumy+=value;
        sumxy+=value*i;
        sumx+=i;
        sumx2+=i*i;
       }
   c=sumx2*n-sumx*sumx;
   if(c==0.0) c=0.000001;
   b=(sumxy*n-sumx*sumy)/c;
   a=(sumy-sumx*b)/n;
   //m_value[0]=a;
   //m_value[Extlength]=a+b*n;
   return(th(3000*(a -(a+b*n))/n));
}
//+-----------------------------------------------------------------+
//| ��������������� �������                                         |
//+-----------------------------------------------------------------+
double th(double x)
{
   double x_=MathExp(x);
   double _x=MathExp(-x);
   //-----
   double a=(x_+_x);
   double b=(x_-_x);
   if( a==0) a=0.00000001;
   return(b/a);
}
//+-----------------------------------------------------------------+
//| writeweights                                                    |
//+-----------------------------------------------------------------+
void writeweights()
{
   int i, handle;
   handle=FileOpen("weightsN.dat", FILE_BIN|FILE_WRITE);
   if(handle>0) 
     {
      //---
        for(i=0; i<MAXWEIGHTS; i++) 
           {
              FileWriteDouble(handle, ww[i], DOUBLE_VALUE);
           }
        FileClose(handle);
        return;
     }
     //---
   Print("error open file -",GetLastError());
   return ;
}

void CheckForOpen(double wa[])
{
   /*if (Time[0] == prevtime) return(0);
   prevtime = Time[0];
   */
   double in[4];
   //--------------T3 �����������---------------------------------+
   double e1, e2, e3, e4, e5, e6, c1, c2, c3, c4, w1, w2, b2, b3;
   double n,b,t3;
   //----
      n=5;
      b=0.7;
      //-----
      b2=b*b;
      b3=b2*b;
      c1=-b3;
      c2=(3.0*(b2+b3));
      c3=-3.0*(2.0*b2+b+b3);
      c4=(1.0+3.0*b+b3+3*b2);
      //------
      if (n<1) n=1;
      n = 1.0+0.5*(n-1);
      w1 = 2.0/(n+1);
      w2 = 1.0-w1;
   //-------------------------------------------------------------+*/
   //-------------------------------------------------------------
   int trend=0,shift=0;
   for(shift=0; shift<=2; shift++) 
      {
         //-----����� ���� ---- //�� ���� �������� ���� �������
         in[0]=LinRegresSlope2(3,shift+1);
         in[1]=LinRegresSlope2(7,shift+1);
         in[2]=LinRegresSlope2(14,shift+1);
         in[3]=LinRegresSlope2(21,shift+1);
         //Print(in[0],in[1]);
         //----- ����� ���� -------------
         //Print("NET: ",neuronet1(wa,in));
         signal[shift] = neuronet1(wa,in); //�� ����� ���� ���� � �����
         //Print("SHIFT: ",shift," WA ",wa[shift]," SIGNAL: ",signal[shift]);

         //----- T3 ����������� --------
         e1 = w1*signal[shift] + w2*e1;
         e2 = w1*e1 + w2*e2;
         e3 = w1*e2 + w2*e3;
         e4 = w1*e3 + w2*e4;
         e5 = w1*e4 + w2*e5;
         e6 = w1*e5 + w2*e6;
         //-----
         t3=c1*e6+c2*e5+c3*e4+c4*e3;
         signal[shift]=t3;//�������� � �������� ������
      }
      //-------------------------------------------------------------+
      //| �������                                                    |
      //-------------------------------------------------------------+
      if( signal[0]>signal[1] && signal[2]>signal[1]
          && signal[1]<-threshold && trend!=1 ) 
          {
            trend=1;
            OrderSend(Symbol(), OP_BUY, lots, Ask, 3, Bid - sl * Point, Bid + tp * Point, WindowExpertName(), 999, 0, Blue); 
          }
          //------
      if( signal[0]<signal[1] && signal[2]<signal[1]
          && signal[1]>threshold && trend!=-1 ) 
          { 
            trend=-1;
            OrderSend(Symbol(), OP_SELL, lots, Bid, 3, Ask + sl * Point, Ask - tp * Point, WindowExpertName(), 999, 0, Red); 

          }

   // �������� �������
   int total = OrdersTotal();
   
   for(int cnt = 0; cnt < total; cnt++) 
     {
       // ��-�� ������
       OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
       int tick = OrderTicket();
       double openprice = OrderOpenPrice();
       double closeprice = Bid;
       double comission = OrderCommission();
       double swap = OrderSwap();
       double profit = OrderProfit();
       // ��������, ��� �� ��� ����������?
       if(OrderSymbol() == Symbol()) 
         { // ���! �� �����
           // ����� �� ��������, � ������ �� �������
           if(OrderType() == OP_BUY && trend==-1) 
             {
              // ��� ���� �� ������, ������� �� �����
              if(OrderClose(OrderTicket(), OrderLots(), closeprice, 3, Blue)) 
                {
                 // �������� �������� ���������
                 SendMail("Close buy position " + Symbol(), "Order #" + 
                    tick + ", close at price " + closeprice + " with profit $" + 
                    profit + ".\nOpen price " + openprice + "\nComission " + 
                    comission + "\nSwap " + swap + ".\n___\nBalance $" + 
                    AccountBalance() + "\nEquity $" + AccountEquity() + "\nTotalProfit $" + 
                    AccountProfit() + "\nFreeMargin $" + AccountFreeMargin());
                }
              return(0);
             }  
           // ����� �� ���������, � ������ �� �������
           if(OrderType() == OP_SELL && trend==1) 
             {
              closeprice = Ask;
              // ������� ���� ������� ��� ��, ��� �� ��� ��������
              if(OrderClose(OrderTicket(), OrderLots(), closeprice, 3, Red)) 
                {
                 // �������� �������� ���������
                 SendMail("Close Sell position " + Symbol(), "Order #" + 
                 tick + ", close at price " + closeprice + " with profit $" + 
                 profit + ".\nOpen price " + openprice + "\nComission " + 
                 comission + "\nSwap " + swap + ".\n___\nBalance $" + 
                 AccountBalance() + "\nEquity $" + AccountEquity() + "\nTotalProfit $" + 
                 AccountProfit() + "\nFreeMargin $" + AccountFreeMargin());
                }
              return(0);
             }
           // �������� ������� �� ���� ����������� ��� ����, ������ ��������� �� �����, 
           // � ����� �������� ������ ��������
           //return(0);
         }
         
     }

}

//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
   //----
   return(0);
  }