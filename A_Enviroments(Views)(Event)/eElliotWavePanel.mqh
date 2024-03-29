//+------------------------------------------------------------------+
//||   ||||||||||                 Ce_ElliotWavePanel.mqh            ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Method_View.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cgpe_ElliotWavePanel: public Sg_OnChartEvent_base
{
public:
          Sg_OnChartEvent       EventsData;     ////---Events.Main(this); Event_TradePanel.Main(Event_TradePanel); //---who work with Objparam methods.

          void                  OnChartEvents();//Sg_OnChartEvent &event //--Used solo Data
          void                  Event_OBJECT_CLICK();
          void                  Event_KeyDown()        {return;};;
          void                  Event_MOUSE_MOVE()     {return;};
          //--Events

          ///
          //
}; //--Ce_ElliotWavePanel FlowPanel_Event;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cgpe_ElliotWavePanel::Event_OBJECT_CLICK()
{         //-----------------------------------------------------------------------------------------------
          if (gElliotWave_Pad.BTN_ElliottWAVE.GAC.Name() ==  Event.sparam ) //
          {         if(gElliotWave_Pad.BTN_ElliottWAVE.GAC.State())
                    {         gElliotWave_Pad.BTN_ElliottWAVE.GAC.Color(Elliott_PAD.ElliotWavePAD_BTNColorB.DescColorPress);
                              gElliotWave_Pad.BTN_ElliottWAVE.GAC.BackColor(Elliott_PAD.ElliotWavePAD_BTNColorB.BackColorPress);
                              gElliotWave_Pad.BTN_ElliottWAVE.GAC.BorderColor(Elliott_PAD.ElliotWavePAD_BTNColorB.BorderColorPress);//
                              Elliott_PAD.__CALL(MODE_CREATE, true,Sg_Position2D_Def);
                              //-------------------------------------------------------------------------------------------
                    } //
                    else
                    {         gElliotWave_Pad.BTN_ElliottWAVE.GAC.Color(Elliott_PAD.ElliotWavePAD_BTNColorB.DescColor );
                              gElliotWave_Pad.BTN_ElliottWAVE.GAC.BackColor(Elliott_PAD.ElliotWavePAD_BTNColorB.BackColor  );
                              gElliotWave_Pad.BTN_ElliottWAVE.GAC.BorderColor(Elliott_PAD.ElliotWavePAD_BTNColorB.BorderColor );//
                              Elliott_PAD.__CALL(MODE_CREATE, false,Sg_Position2D_Def);//
                    } //
          }
          //-----------------------------------------------------------------------------------------------
          if(gElliotWave_Pad.BTN_ElliottWAVEUp.GAC.Name() == Event.sparam)
          {         if (gElliotWave_Pad.BTN_ElliottWAVEUp.GAC.State() ) //
                    {         if(Elliott_PAD.WAVECount > 29 )Elliott_PAD.WAVECount = 0;
                              if(Elliott_PAD.WAVECount < 30) gElliotWave_Pad.LBL_ElliottWAVECount.GAC.Description((string)++Elliott_PAD.WAVECount);//
                    } //
                    else
                    {         if(Elliott_PAD.WAVECount > 29 ) Elliott_PAD.WAVECount = 0;
                              if(Elliott_PAD.WAVECount < 30) gElliotWave_Pad.LBL_ElliottWAVECount.GAC.Description((string)++Elliott_PAD.WAVECount);//
                    }//
          }
          //-----------------------------------------------------------------------------------------------
          if(gElliotWave_Pad.BTN_ElliottWAVEDown.GAC.Name() == Event.sparam)
          {         if(gElliotWave_Pad.BTN_ElliottWAVEDown.GAC.State())
                    {         if(Elliott_PAD.WAVECount > 29 )Elliott_PAD.WAVECount = 1;
                              if(Elliott_PAD.WAVECount == 1 )Elliott_PAD.WAVECount = 31;
                              if(Elliott_PAD.WAVECount >= 0 || Elliott_PAD.WAVECount < 30)
                                        gElliotWave_Pad.LBL_ElliottWAVECount.GAC.Description((string)--Elliott_PAD.WAVECount);//
                              /// BTN_CandelBoxDown.GAC.State(false); //
                    }
                    else
                    {         if(Elliott_PAD.WAVECount > 29 )Elliott_PAD.WAVECount = 1;
                              if(Elliott_PAD.WAVECount == 1 )Elliott_PAD.WAVECount = 30;
                              if(Elliott_PAD.WAVECount == 0 || Elliott_PAD.WAVECount < 31)//&& (ArraySize(CandelBox.DescriptionBox) + 1) > 2)
                                        gElliotWave_Pad.LBL_ElliottWAVECount.GAC.Description((string)--Elliott_PAD.WAVECount);//
                              //
                    }//
          }
          //-----------------------------------------------------------------------------------------------
          if(gElliotWave_Pad.BTN_ElliottWAVEFillResetCount.GAC.State()  && gElliotWave_Pad.BTN_ElliottWAVEFillResetCount.GAC.Name() == Event.sparam  )
          {         gElliotWave_Pad.BTN_ElliottWAVEFillResetCount.GAC.State(false); ;
                    gElliotWave_Pad.LBL_ElliottWAVECount.GAC.Description((string)(Elliott_PAD.WAVECount = 5));// CounterValueBoxCount = 5;
                    //---------------------------------------------------------------------------
          }
          if( gElliotWave_Pad.BTN_ElliottWAVEKeyClear.GAC.Name() == Event.sparam  )
          {         Elliott_PAD.Is_Clear_Waves = true;
                    Elliott_PAD.__CALL(MODE_CREATE, true,Sg_Position2D_Def);
                    gElliotWave_Pad.BTN_ElliottWAVEKeyClear.GAC.State(false);
                    Elliott_PAD.Is_Clear_Waves = false;
                    //---------------------------------------------------------------------------
          }
          //-----------------------------------------------------------------------------------------------
}//

//+------------------------------------------------------------------+
//||   ||||||||||                 Ce_ElliotWavePanel.mqh            ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
