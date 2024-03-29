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
struct CDSQueue_By_List
{         /*no need/// object in quene is type of list
          t   ptr_front;
          t   ptr_rear;
          t   ptr_temp;
          */
          CDSQueue_By_List_Node<t>* ptr_front;
          CDSQueue_By_List_Node<t>* ptr_rear;
          CDSQueue_By_List_Node<t>* ptr_temp;
          //!!---t* ptr_data;//'*' - pointer cannot be used        Advanced_Queue_List.mqh       23        12
          string sName;
          CDSQueue_By_List()
          {         //          CDSQueue_By_List_Node<t>* _ptr_front = NULL; ptr_front = _ptr_front;
                    //          CDSQueue_By_List_Node<t>* _ptr_rear = NULL;  ptr_rear  = _ptr_rear;
                    //--  CDSQueue_By_List_Node<t>* _ptr_temp;         ptr_temp  = _ptr_temp ; //--possible use of uninitialized variable '_ptr_temp'         Data_Struct.mqh     187       54
                    //
          }

          CDSQueue_By_List(string sn): sName(sn)
          {}
          ~CDSQueue_By_List() {};
          //CDSQueue_By_List(/*t _data*/)
          //{         //--insert handeler data = _data;
          //          //--  CDSQueue_By_List_Node<t>* _ptr_temp;         ptr_temp  = _ptr_temp ; //--possible use of uninitialized variable '_ptr_temp'         Data_Struct.mqh     187       54
          //          //
          //}

//----------------------------------
          void push(t &val)
          {         // if (!CheckPointer(&ptr_rear))//!!& know memory//  if (!CheckPointer(&ptr_rear))//!!& know memory
                    //if(){Print("QueueCash.push(notempty pointer)");}//dynamic_cast<t *>(&val); dynamic_cast<t *>(&val)
                    //--cant know the obj is null or not...out cheking
                    if (ptr_rear == NULL)//--start and end  of Queue
                    {         //Print("Queue.push(empty rare)");
                              ptr_rear                  = new CDSQueue_By_List_Node<t>();
                              ptr_rear.ptr_next         = NULL;
                              ptr_rear.dataobj          = val;
                              ptr_front                 = ptr_rear; //
                    }
                    else  //---end  of Queue
                    {         // ptr_temp = new t;  t is injected pointer obj
                              //Print("Queue.push(full rare)");
                              ptr_temp                  = new CDSQueue_By_List_Node<t>();
                              ptr_rear.ptr_next         = ptr_temp;
                              ptr_temp.dataobj          = val;
                              ptr_temp.ptr_next         = NULL;
                              ptr_rear                  = ptr_temp; //
                    } //
          }

          void pop()
          {         ptr_temp = ptr_front;
                    if (!CheckPointer(ptr_front))   { return; /*NULL;*/     /*   cout << "Queue is empty!!" << endl;*/ }
                    else if (ptr_temp.ptr_next != NULL) //--- delete fornt if fornt next existed
                    {         ptr_temp = ptr_temp.ptr_next;
                              /* cout << "Element deleted from queue is : " << ptr_front->data << endl;*/
                              //free(ptr_front);
                              delete ptr_front;
                              ptr_front = ptr_temp; // //--- replace fornt next by fornt
                    }
                    else //--- delete fornt if not any existed
                    {         /*  cout << "Element deleted from queue is : " << ptr_front->data << endl;*/
                              //free(ptr_front);
                              delete ptr_front;
                              ptr_front = NULL;  ptr_rear = NULL; //
                    } //
          }
          t popObj()
          {         Print("QueueCash.popObj(start)");
                    ptr_temp = ptr_front;
                    if (!ptr_front)   { Print("Queue is empty!! (!ptr_front)"); return NULL;     /*   cout << "Queue is empty!!" << endl;*/ }         // (!CheckPointer(ptr_front)) || (!ptr_front)
                    else if (ptr_temp.ptr_next) //--- delete fornt if fornt next existed  //'||' - illegal operation use          Advanced_Queue_List.mqh       85        58      (ptr_temp.ptr_next != NULL) || (ptr_temp.ptr_next)
                    {         ptr_temp = ptr_temp.ptr_next;
                              CDSQueue_By_List_Node<t>* ptr_tempout =  new CDSQueue_By_List_Node<t>;
                              ptr_tempout =  ptr_front;
                              /* cout << "Element deleted from queue is : " << ptr_front->data << endl;*/
                              Print("Element deleted from queue is : ", "ptr_front->data", "error when deleting    (ptr_temp.ptr_next)");
                              //free(ptr_front);
                              delete ptr_front;///!!! error when deleting
                              ptr_front = ptr_temp; // //--- replace fornt next by fornt
                              return ptr_tempout.dataobj;////--return obj
                    }
                    else //--- delete fornt if not any existed      !!!! fornt exist , fornt.next not exist,
                    {         /*  cout << "Element deleted from queue is : " << ptr_front->data << endl;*/
                              Print("Element deleted from queue is : ", "ptr_front->data", ">> queue empty:(fornt exist,fornt.next not exist)");
                              ptr_temp = ptr_temp.ptr_next;
                              CDSQueue_By_List_Node<t>* ptr_tempout =  new CDSQueue_By_List_Node<t>;
                              ptr_tempout =  ptr_front;
                              //free(ptr_front);
                              ///~! delete ptr_front;///!!! error when deleting
                              ptr_front = NULL;  ptr_rear = NULL; // when deleting its come null no need
                              return ptr_tempout.dataobj;; //
                    } //
          }
          void popLoad()
          {         ptr_temp = ptr_front;
                    if (!CheckPointer(ptr_front))   {      /*   cout << "Queue is empty!!" << endl;*/ }
                    else if (ptr_temp.ptr_next != NULL)
                    {         ptr_temp = ptr_temp.ptr_next;
                              /* cout << "Element deleted from queue is : " << ptr_front->data << endl;*/
                              //free(ptr_front);
                              ptr_front = ptr_temp; //
                    }
                    else
                    {         /*  cout << "Element deleted from queue is : " << ptr_front->data << endl;*/
                              //free(ptr_front);
                              ptr_front = NULL;  ptr_rear = NULL; // delete address
                    } //
          }
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
          bool emptyLoad()
          {         if (ptr_front == NULL) return true;
                    else return false;//
          }
          t front()  /*t is pointer injected*/
          {         //t* ptr_Node_temp = ptr_front;
                    //          return ptr_Node_temp;//
                    //
                    //t dataobjret;
                    //dataobjret = ptr_front.dataobj;
                    //
                    if(!ptr_front) {Print(sName + " ptr_front empty"); return NULL;}
                    return ptr_front.dataobj;////object of 'C_TND' cannot be returned, copy constructor 'C_TND::C_TND(const C_TND &)' not found    Advanced_Queue_List.mqh       92        28
          }
          t rare()  /*t is pointer injected*///load
          {         //t* ptr_Node_temp = ptr_front;
                    //          return ptr_Node_temp;//
                    //
                    //t dataobjret;
                    //dataobjret = ptr_rear.dataobj;
                    if(!ptr_rear) {Print(" ptr_rear empty"); return NULL;}
                    return ptr_rear.dataobj;////object of 'C_TND' cannot be returned, copy constructor 'C_TND::C_TND(const C_TND &)' not found    Advanced_Queue_List.mqh       92        28
          }
          int main()
          {         /*  cout << "Queue Created:" << endl;*/
                    //Insert(10);
                    //Insert(20);
                    //Insert(30);
                    //Insert(40);
                    //Insert(50);
                    //Display();
                    //Delete();
                    ///*   cout << "Queue after one deletion: " << endl;*/
                    //Display();
                    return 0; //
          } //
};