//+------------------------------------------------------------------+
//||   ||||||||||       Sd_DATA_FILES_FOLDERS_DISK.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Queue_Double_By_List_Node.mqh>

//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
// A structure to represent a deque
template<typename t> //--auto set type of template and pointer type set is pointered
class CDSQueue_Double_By_List
{         CDSQueue_Double_By_List_Node<t>*      front;
          CDSQueue_Double_By_List_Node<t>*      rear;
          int        Size;

public:
          CDSQueue_Double_By_List() {   front = rear = NULL;   Size = 0;    }

          // Operations on CDSQueue_Double_By_List
          // Function to insert an element at the front end
          void insertFront(t&  data)// give pointer not ref& 'C_TND' - objects are passed by reference only	Advanced_DoubleQueue_List.mqh	39	28

          {         CDSQueue_Double_By_List_Node<t>* newNode = CDSQueue_Double_By_List_Node<t>::getNode(data);
                    // If true then new element cannot be added and it is an 'Overflow' condition
                    if(newNode == NULL)   return; //  cout << "OverFlow\n";
                    else
                    {         // If deque is empty
                              if(front == NULL)  rear = front = newNode;
                              // Inserts node at the front end
                              else
                              {         newNode.next = front;
                                        front.prev = newNode;
                                        front = newNode; //
                              } //
                              // Increments count of elements by 1
                              Size++;//
                    } //
          }
          // Function to insert an element at the rear end
          void insertRear(t &data)
          {         CDSQueue_Double_By_List_Node<t>* newNode = CDSQueue_Double_By_List_Node<t>::getNode(data);
                    // If true then new element cannot be added and it is an 'Overflow' condition
                    if(newNode == NULL)
                              return;// cout << "OverFlow\n";
                    else
                    {         // If deque is empty
                              if(rear == NULL)
                                        front = rear = newNode;
                              // Inserts node at the rear end
                              else
                              {         newNode.prev = rear;
                                        rear.next = newNode;
                                        rear = newNode; } //
                              Size++; } //
          }
          // Function to delete the element from the front end
          void deleteFront()
          {         // If deque is empty then 'Underflow' condition
                    if(isEmpty())
                              return; // cout << "UnderFlow\n";
                    // Deletes the node from the front end and makes  the adjustment in the links
                    else
                    {         CDSQueue_Double_By_List_Node<t>* temp = front;
                              front = front.next;
                              // If only one element was present
                              if(front == NULL)
                              {         rear = NULL; }
                              else
                              {         front.prev = NULL; }
                              delete  temp ; //free(temp);
                              // Decrements count of elements by 1
                              Size--;//
                    } //
          }
          // Function to delete the element  from the rear end
          void deleteRear()
          {         // If deque is empty then  'Underflow' condition
                    if(isEmpty())
                              return;//cout << "UnderFlow\n";
                    // Deletes the node from the rear end and makes  the adjustment in the links
                    else
                    {         CDSQueue_Double_By_List_Node<t>* temp = rear;
                              rear = rear.prev;
                              // If only one element was present
                              if(rear == NULL)
                                        front = NULL;
                              else
                                        rear.next = NULL;
                              delete temp;// free(temp);
                              // Decrements count of elements by 1
                              Size--;//
                    }//
          }
          // Function to return the element  at the front end
          t  getFront()
          {         // If deque is empty, then returns garbage value
                    if(isEmpty())   return NULL;
                    return front.data;//
          }
          // Function to return the element  at the rear end
          t getRear()
          {         // If deque is empty, then returns  garbage value
                    if(isEmpty())     return NULL;
                    return rear.data;//
          }
          // Function to return the number of  elements in the deque
          int size() { return Size; }
          // Function to check whether deque  is empty or not
          bool isEmpty() { return (front == NULL); }
          // Function to delete all the elements  from CDSQueue_Double_By_List
          void erase()
          {         rear = NULL;
                    while(front != NULL)
                    {         CDSQueue_Double_By_List_Node<t>* temp = front;
                              front = front.next;
                              delete temp;//free(temp);
                    }//
                    Size = 0;//
          }
          // Driver program to test above
          int        main()
          {         CDSQueue_Double_By_List dq;
                    //cout << "Insert element '5' at rear end\n";
                    //dq.insertRear(5);
                    //cout << "Insert element '10' at rear end\n";
                    //dq.insertRear(10);
                    //cout << "Rear end element: " << dq.getRear() << endl;
                    //dq.deleteRear();
                    //cout << "After deleting rear element new rear"  << " is: " << dq.getRear() << endl;
                    //cout << "Inserting element '15' at front end \n";
                    //dq.insertFront(15);
                    //cout << "Front end element: " << dq.getFront() << endl;
                    //cout << "Number of elements in CDSQueue_Double_By_List: " << dq.size()   << endl;
                    //dq.deleteFront();
                    //cout << "After deleting front element new " << "front is: " << dq.getFront() << endl;
                    return 0; //
          } //
};
//+------------------------------------------------------------------+
