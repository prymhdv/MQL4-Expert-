//+------------------------------------------------------------------+
//|                                     C_MULTIVARIABLE.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class C_MULTIVARIABLE     BEGIN-END                  |
//+------------------------------------------------------------------+
class C_MULTIVARIABLE
{
private:

public:
          void                  C_MULTIVARIABLE::C_MULTIVARIABLE();
          void                  C_MULTIVARIABLE::~C_MULTIVARIABLE() {/*RunCallFunction--; ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_MULTIVARIABLE-Error",  __LINE__, __FUNCTION__);*/ }
          template<typename T>
          bool                  C_MULTIVARIABLE::ArrayPrapare(T &ArrayCom[], int SizeCom);



          //


          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_MULTIVARIABLE::C_MULTIVARIABLE()
{         RunCallFunction++; //________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          //Print("       ", __FUNCSIG__); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename T>
bool C_MULTIVARIABLE::ArrayPrapare(T &ArrayCom[], int SizeCom)
{         if(ArraySize(ArrayCom) < 0) SizeCom = ArrayResize(ArrayCom, SizeCom);
          /* ArrayInitialize(ArrayCom, NULL);*/ return true; //
}
//+------------------------------------------------------------------+
class DATE // KARABAKH İS AZERBAİJAN From TABRİZ///Programming issue.. multivariables
{         //STARTED ALTAY OCEAN SUNCOREKERNEL 2021.
          // ( ‌" إِنَّ ٱللَّهَ عَٰلِمُ غَيۡبِ ٱلسَّمَٰوَٰتِ وَٱلۡأَرۡضِۚ إِنَّهُۥ عَلِيمُۢ بِذَاتِ ٱلصُّدُورِ ۳۳ <- فاطر36 " ) /

private:  int ID;                                          /* ID OF VARIABLE */
          string NAME;                             /* NAME OF VARIABLE */
          double VALUE;                           /* VALUE OF VARIABLE */
          int AGE;                                       /* AGE OF VARIABLE */
          int AGE_MAXIMUM;                 /* AGEMAXIMUM OF VARIABLE */
          string TAG;                                 /* TAG OF VARIABLE */
          DATE *TIME_CREATED;           /* TIMECREATED OF VARIABLE *///DATE *TIME_CREATED//even struct not pointing gone class pointer//undefined class 'DATE' cannot be used       C_MULTIVARIABLE.mqh          45        16
          string WHERE_CREATED;        /* WHERECREATED OF VARIABLE */
          string WHERE_LAST_USED;    /* WHERELASTUSED OF VARIABLE */
          string WHERE_LAST_EVENT;   /* WHERELASTEVENT OF VARIABLE */
          string WHERE_DIVED_LAST;    /* WHEREDIVEDLAST OF VARIABLE */
          string WHY_DIVED_LAST;        /* WHYDIVEDLAST OF VARIABLE */
          string WHEN_DIVED_LAST;      /* WHENDIVEDLAST OF VARIABLE */
          string WHO_DIVED_LAST;        /* WHODIVEDLAST OF VARIABLE */
          bool   RECEPTORS;                      /* RECEPTORS OF VARIABLE */
          string VALUE_TEAIS_LAST;       /* WHODIVEDLAST OF VARIABLE */
          string SENSE_SMELL;                /* SENSESMELL OF VARIABLE */
          string SENSE_VISION;                 /* SENSEVISION OF VARIABLE */
          string SENSE_HEARIN;               /* SENSEHEARING OF VARIABLE */
          string SENSE_TASTE;                  /* SENSETASTE OF VARIABLE */
          string SENSE_SOMESTHETIC;   /* SENSEOMESTHETIC OF VARIABLE */
          string EXTRASENSORY_WHY;   /* EXTRASENSORYWHY OF VARIABLE */
          string EXTRASENSORY_WHQ;   /* EXTRASENSORYWHQ OF VARIABLE */
public://///   public function acceccible from other class...  but privet members acceccible from self class functions..//
          //=========================================================
          DATE()
          {         DATE DATETime;
                    DATETime.NAME = "DATETime";
                    DATETime.VALUE = 0.00000001;//
          }

//....
};
struct DOUBLE // KARABAKH İS AZERBAİJAN From TABRİZ///Programming issue.. multivariables
{         //STARTED ALTAY OCEAN SUNCOREKERNEL 2021.
          // ( ‌" إِنَّ ٱللَّهَ عَٰلِمُ غَيۡبِ ٱلسَّمَٰوَٰتِ وَٱلۡأَرۡضِۚ إِنَّهُۥ عَلِيمُۢ بِذَاتِ ٱلصُّدُورِ ۳۳ <- فاطر36 " ) /
          int ID;                                          /* ID OF VARIABLE */
          string NAME;                             /* NAME OF VARIABLE */
          double VALUE;                           /* VALUE OF VARIABLE */
          int AGE;                                       /* AGE OF VARIABLE */
          int AGE_MAXIMUM;                 /* AGEMAXIMUM OF VARIABLE */
          string TAG;                                 /* TAG OF VARIABLE */
          DATE TIME_CREATED;            /* TIMECREATED OF VARIABLE */
          string WHERE_CREATED;        /* WHERECREATED OF VARIABLE */
          string WHERE_LAST_USED;    /* WHERELASTUSED OF VARIABLE */
          string WHERE_LAST_EVENT;   /* WHERELASTEVENT OF VARIABLE */
          string WHERE_DIVED_LAST;    /* WHEREDIVEDLAST OF VARIABLE */
          string WHY_DIVED_LAST;        /* WHYDIVEDLAST OF VARIABLE */
          string WHEN_DIVED_LAST;      /* WHENDIVEDLAST OF VARIABLE */
          string WHO_DIVED_LAST;        /* WHODIVEDLAST OF VARIABLE */
          bool   RECEPTORS;                      /* RECEPTORS OF VARIABLE */
          string VALUE_TEAIS_LAST;       /* WHODIVEDLAST OF VARIABLE */
          string SENSE_SMELL;                /* SENSESMELL OF VARIABLE */
          string SENSE_VISION;                 /* SENSEVISION OF VARIABLE */
          string SENSE_HEARIN;               /* SENSEHEARING OF VARIABLE */
          string SENSE_TASTE;                  /* SENSETASTE OF VARIABLE */
          string SENSE_SOMESTHETIC;   /* SENSEOMESTHETIC OF VARIABLE */
          string EXTRASENSORY_WHY;   /* EXTRASENSORYWHY OF VARIABLE */
          string EXTRASENSORY_WHQ;   /* EXTRASENSORYWHQ OF VARIABLE */
          //=========================================================
          DOUBLE()
          {         DOUBLE AlcoholPercent;
                    AlcoholPercent.NAME = "AlcoholPercent";
                    AlcoholPercent.VALUE = 0.00000001;//
          }

//....
};
//+------------------------------------------------------------------+
//|             Class C_MULTIVARIABLE     BEGIN-END                 |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class C_MULTIVARIABLE     BEGIN-END                 |
//+------------------------------------------------------------------+

struct ResultSTR
{         bool result;
          int  index;//
          int  countFalse; //For Array save in ZERRO element ResultSelect[0].countFalse++
          int  countTrue() {return (index - countFalse);} ; //


};
//+------------------------------------------------------------------+
//|             Class C_MULTIVARIABLE     BEGIN-END                 |
//+------------------------------------------------------------------+
