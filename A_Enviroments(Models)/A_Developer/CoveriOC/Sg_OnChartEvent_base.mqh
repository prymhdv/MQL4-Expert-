//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_OnChartEvent_base.mqh          ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
struct Sg_OnChartEvent
{         int           id;             //EventID Parameter
          long          lparam;         //long    Parameter
          double        dparam;         //double  Parameter
          string        sparam;         //string  Parameter
          bool          initParam(const int id_, const long lparam_, const double dparam_, const string sparam_)
          {         id            = id_;
                    lparam        = lparam_;
                    dparam        = dparam_;
                    sparam        = sparam_; //
                    return true;//
          }; //
}; Sg_OnChartEvent Event;
//+------------------------------------------------------------------+
//|                                                                  | OnChartEvent
//+------------------------------------------------------------------+
class Sg_OnChartEvent_base
{
//
          /*
          OnChartEvent
          OnChartEvent() is the handler of a group of ChartEvent events:
          •CHARTEVENT_KEYDOWN — event of a keystroke, when the chart window is focused;
          •CHARTEVENT_MOUSE_MOVE — mouse move events and mouse click events (if CHART_EVENT_MOUSE_MOVE=true is set for the chart);
          •CHARTEVENT_OBJECT_CREATE — event of graphical object creation (if CHART_EVENT_OBJECT_CREATE=true is set for the chart);
          •CHARTEVENT_OBJECT_CHANGE — event of change of an object property via the properties dialog;
          •CHARTEVENT_OBJECT_DELETE — event of graphical object deletion (if CHART_EVENT_OBJECT_DELETE=true is set for the chart);
          •CHARTEVENT_CLICK — event of a mouse click on the chart;
          •CHARTEVENT_OBJECT_CLICK — event of a mouse click in a graphical object belonging to the chart;
          •CHARTEVENT_OBJECT_DRAG — event of a graphical object move using the mouse;
          •CHARTEVENT_OBJECT_ENDEDIT — event of the finished text editing in the entry box of the LabelEdit graphical object;
          •CHARTEVENT_CHART_CHANGE  — event of chart changes;
          •CHARTEVENT_CUSTOM+n — ID of the user event, where n is in the range from 0 to 65535.
          •CHARTEVENT_CUSTOM_LAST — the last acceptable ID of a custom event (CHARTEVENT_CUSTOM +65535).
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          The function can be called only in Expert Advisors and indicators. The function should be of void type with 4 parameters:
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          void OnChartEvent(const int id,         // Event ID
                            const long& lparam,   // Parameter of type long event
                            const double& dparam, // Parameter of type double event
                            const string& sparam  // Parameter of type string events
            );
            //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          For each type of event, the input parameters of the OnChartEvent() function have definite values that are required for
          the processing of this event. The events and values passed through these parameters are listed in the table below.
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Event                                 id                              lparam                                  dparam                                          sparam
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Event                                 Value of the id parameter       Value of the lparam parameter           Value of the dparam parameter                   Value of the sparam parameter
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Event of a keystroke                  CHARTEVENT_KEYDOWN              code of a pressed key                   Repeat count (the number of times               The string value of a bit mask describing
                                                                                                                        the keystroke is repeated as                    the status of keyboard buttons
                                                                                                                        a result of the user holding down the key)
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Mouse events                          CHARTEVENT_MOUSE_MOVE           the X coordinate                        the Y coordinate                                The string value of a bit mask describing
          (if property                                                                                                                                                  the status of mouse buttons
          CHART_EVENT_MOUSE_MOVE=true
          is set for the chart)
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Event of graphical                    CHARTEVENT_OBJECT_CREATE                —                                      —                                        Name of the created graphical object
          object creation  (if
          CHART_EVENT_OBJECT_CREATE=true
          is set for the chart)
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Event of change of an object          CHARTEVENT_OBJECT_CHANGE                —                                      —                                        Name of the modified graphical object
          property via the properties dialog
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Event of graphical object             CHARTEVENT_OBJECT_DELETE                —                                      —                                        Name of the deleted graphical object
          deletion (if
          CHART_EVENT_OBJECT_DELETE=true
          is set for the chart)
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Event of a mouse click on the chart   CHARTEVENT_CLICK                the X coordinate                       the Y coordinate                                         —
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Event of a mouse click in a           CHARTEVENT_OBJECT_CLICK         the X coordinate                       the Y coordinate                                 Name of the graphical object, on which the event occurred
          graphical object
          belonging to the chart
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Event of a graphical object           CHARTEVENT_OBJECT_DRAG                  —                                       —                                       Name of the moved graphical object
          dragging using the mouse
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Event of the finished text            CHARTEVENT_OBJECT_ENDEDIT               —                                       —                                       Name of the LabelEdit graphical object,
          editing in the entry box of                                                                                                                                    in which text editing has completed
          the LabelEdit graphical object
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Event of chart Changes                CHARTEVENT_CHART_CHANGE                 —                                       —                                               —
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          ID of the user event                  CHARTEVENT_CUSTOM+N     Value set by the EventChartCustom() function    Value set by the EventChartCustom() function    Value set by the EventChartCustom() function
          under the N number
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          */
          Sg_OnChartEvent  OnChartEventData;
          //--------------------------------------
          template<typename ClientEvent>
          void  Main(ClientEvent &clientEvent);
          //-----------------------------------
          virtual void  Event_KEYDOWN()         {return;};
          virtual void  Event_MOUSE_MOVE()      {return;};
          virtual void  Event_OBJECT_CREATE()   {return;};
          virtual void  Event_OBJECT_CHANGE()   {return;};
          virtual void  Event_OBJECT_DELETE()   {return;};
          virtual void  Event_CLICK()           {return;};
          virtual void  Event_OBJECT_CLICK()    {return;};
          virtual void  Event_OBJECT_DRAG()     {return;};
          virtual void  Event_OBJECT_ENDEDIT()  {return;};
          virtual void  Event_CHART_CHANGE()    {return;};
          virtual void  Event_CUSTOM()          {return;};
          virtual void  Event_CUSTOMn()         {return;};
          virtual void  Event_CUSTOM_LAST()     {return;};
          //-----------------------------------
          //

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename ClientEvent>
void Sg_OnChartEvent_base::Main(ClientEvent &clientEvent)
{         //
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          if(Event.id == CHARTEVENT_KEYDOWN)         { clientEvent.Event_KEYDOWN();           }      //--Keyboard
          if(Event.id == CHARTEVENT_MOUSE_MOVE)      { clientEvent.Event_MOUSE_MOVE();        }      //--Mouse
          if(Event.id == CHARTEVENT_CLICK)           { clientEvent.Event_CLICK();             }      //--Mouse Clicking on a chart return XY of pointer
          //---------------------------------------------------------
          if(Event.id == CHARTEVENT_OBJECT_CREATE)   { clientEvent.Event_OBJECT_CREATE();     }
          if(Event.id == CHARTEVENT_OBJECT_CHANGE)   { clientEvent.Event_OBJECT_CHANGE();     }
          if(Event.id == CHARTEVENT_OBJECT_DELETE)   { clientEvent.Event_OBJECT_DELETE();     }
          if(Event.id == CHARTEVENT_OBJECT_CLICK)    { clientEvent.Event_OBJECT_CLICK();      }///metaeditor137
          if(Event.id == CHARTEVENT_OBJECT_DRAG)     { clientEvent.Event_OBJECT_DRAG();       }
          if(Event.id == CHARTEVENT_OBJECT_ENDEDIT)  { clientEvent.Event_OBJECT_ENDEDIT();    }
          //---------------------------------------------------------
          if(Event.id == CHARTEVENT_CHART_CHANGE)    { clientEvent.Event_CHART_CHANGE();      }
          //---------------------------------------------------------
          if(Event.id == CHARTEVENT_CUSTOM)          { clientEvent.Event_CUSTOM();            }
          if(Event.id == CHARTEVENT_CUSTOM + 1)      { clientEvent.Event_CUSTOMn();           }      //--LDSparams are defined by EventChartCustom
          if(Event.id == CHARTEVENT_CUSTOM_LAST)     { clientEvent.Event_CUSTOM_LAST();       }
          //---------------------------------------------------------
          ///
}
//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_OnChartEvent_base.mqh          ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
