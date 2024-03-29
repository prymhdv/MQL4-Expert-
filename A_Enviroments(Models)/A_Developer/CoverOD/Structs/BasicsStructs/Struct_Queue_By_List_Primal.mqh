//+------------------------------------------------------------------+
//||   ||||||||||       Sd_DATA_FILES_FOLDERS_DISK.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Queue_By_List_Node.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
template<typename t>///'*' - unexpected token     Advanced_Queue_List.mqh       18        20 both side not accept
struct CDSQueue_By_List_Primal
{         CDSQueue_By_List_Node<t>* ptr_front;
          CDSQueue_By_List_Node<t>* ptr_rear;
          CDSQueue_By_List_Node<t>* ptr_temp;

          //!!---t* ptr_data;//'*' - pointer cannot be used        Advanced_Queue_List.mqh       23        12

          CDSQueue_By_List_Primal()
          {         //          CDSQueue_By_List_Node<t>* _ptr_front = NULL; ptr_front = _ptr_front;
                    //          CDSQueue_By_List_Node<t>* _ptr_rear = NULL;  ptr_rear  = _ptr_rear;
                    //--  CDSQueue_By_List_Node<t>* _ptr_temp;         ptr_temp  = _ptr_temp ; //--possible use of uninitialized variable '_ptr_temp'         Data_Struct.mqh     187       54
                    //
          }
          //C_Advanced_C_Queue_List(/*t _data*/)
          //{         //--insert handeler data = _data;
          //          //--  CDSQueue_By_List_Node<t>* _ptr_temp;         ptr_temp  = _ptr_temp ; //--possible use of uninitialized variable '_ptr_temp'         Data_Struct.mqh     187       54
          //          //
          //}
          void Insert(int val)
          {         if (ptr_rear == NULL)
                    {         ptr_rear = new CDSQueue_By_List_Node<t>;
                              ptr_rear.ptr_next = NULL;
                              ptr_rear.data = val;
                              ptr_front = ptr_rear; //
                    }
                    else
                    {         ptr_temp = new CDSQueue_By_List_Node<t>;
                              ptr_rear.ptr_next = ptr_temp;
                              ptr_temp.data = val;
                              ptr_temp.ptr_next = NULL;
                              ptr_rear = ptr_temp; //
                    } //
          }

          void Delete()
          {         ptr_temp = ptr_front;
                    if (ptr_front == NULL)   {      /*   cout << "Queue is empty!!" << endl;*/ }
                    else if (ptr_temp.ptr_next != NULL)
                    {         ptr_temp = ptr_temp.ptr_next;
                              /* cout << "Element deleted from queue is : " << ptr_front->data << endl;*/
                              //free(ptr_front);
                              ptr_front = ptr_temp; //
                    }
                    else
                    {         /*  cout << "Element deleted from queue is : " << ptr_front->data << endl;*/
                              //free(ptr_front);
                              ptr_front = NULL;  ptr_rear = NULL; //
                    } //
          }
//----------------------------------

          void Display()
          {         ptr_temp = ptr_front;
                    if ((ptr_front == NULL) && (ptr_rear == NULL))   { /* cout << "Queue is empty" << endl;*/ return; }
                    while (ptr_temp != NULL)                     { /*   cout << ptr_temp->data << " "; */     ptr_temp = ptr_temp.ptr_next; }
                    /* cout << endl;//*/
          }
          bool empty()
          {         if (ptr_rear == NULL) return true;
                    else return false;//
          }
          CDSQueue_By_List_Node<t>*  front()
          {         //t* ptr_Node_temp = ptr_front;
                    //          return ptr_Node_temp;//
                    return ptr_front;//
          }
          int main()
          {         /*  cout << "Queue Created:" << endl;*/
                    Insert(10);
                    Insert(20);
                    Insert(30);
                    Insert(40);
                    Insert(50);
                    Display();
                    Delete();
                    /*   cout << "Queue after one deletion: " << endl;*/
                    Display();
                    return 0; //
          } //
};
CDSQueue_By_List_Primal<int> C_Queue_List_Int;
//+------------------------------------------------------------------+
