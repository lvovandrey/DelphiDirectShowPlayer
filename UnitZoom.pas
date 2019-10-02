unit UnitZoom;
{$optimization off}

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TZoom = class(TObject)
  private

  public
    constructor Create;
    //Функция расчитывает координаты прямоугольника который зуммируется
    function CalcRect(Pan: TRect; // целевой прямоугольник который надо зуммировать
                  Wnd:TRect;  // прямоугольник отрисовки (например окна в котором прорисовыватся целевой прямоуг) верхлев угол - это 0,0
                  M:TPoint;   //координаты точки зума (например указателя мыши) относительно верх лев WND
                  K:Double)   //коэф зуммирования - от 0 до беск-ти (если 2 - прям-ик по каждой оси увеличивается в 2 раза)
                  : TRect;    //новые координаты для углов целевого прям-ка
  end;


implementation

constructor TZoom.Create;
begin
  inherited;
end;

//Функция расчитывает координаты прямоугольника который зуммируется
function TZoom.CalcRect(Pan: TRect; Wnd:TRect; M:TPoint; K:Double): TRect;
var
   ResRect: TRect; // прям-ик для результатов
   LaddX,LaddY: double;  //добавка к размеру стороны, возникающая при зуммировании

   OMx,OKx,OMMx,OKKx,M_MMx:double; // тут Длины отрезков и координаты точек - я их лучше нарисую
   Xm,Xk,Xo:double;          //  тут О - точка начала отрезка
                              //  M - точка центра зуммирования (напр координата мыши если вокруг нее долж быть зум)
                              //  MM - то же но после растягивания отрезка на Ladd
                              //  K - точка конца отрезка
                              //  KK - новая точка конца отрезка после зума
   {          ноль координат(типа Wnd.Left)
                 |
      [--------- |---------o-----x-------------]---------]
      O          |         M    MM             K         KK            }
   {Вообще задача такая - сначала прибавляем к длине отрезка OK  добавочную длину Ladd,
    а затем смещаем этот отрезок так чтобы точки M и MM совпали}

   OMy,OKy,OMMy,OKKy, M_MMy:double; // все то же самое что выше просто по оси Y
   Ym,Yk,Yo:double;

   Xkk,Xoo,Ykk,Yoo:double;           //А это собственно результаты

begin
//--------------------------------------------------------//
//          сначала разберемся с Осью X                   //
//--------------------------------------------------------//
  Xk:=Pan.Right;
  Xm:=M.X;
  Xo:=Pan.Left;

  OKx:=Xk-Xo;
  OMx:=Xm-Xo;
  OKKx:=OKx*k;
  OMMx:= OKKx*(OMx/OKx);

  LaddX:=OKKx-OKx;      // прибавка длины

  M_MMx:= OMMx - OMx;   // смещение прямоугольника

  //теперь высчитываем координаты результирующие из начальных используя смещение и прибавку длины
  Xoo:=Xo-M_MMx;
  Xkk:=Xk-M_MMx + LaddX;

//--------------------------------------------------------//
//          теперь  Ось Y                                 //
//--------------------------------------------------------//
  Yk:=Pan.Bottom;
  Ym:=M.Y;
  Yo:=Pan.Top;

  OKy:=Yk-Yo;
  OMy:=Ym-Yo;
  OKKy:=OKy*k;
  OMMy:= OKKy*(OMy/OKy);

  LaddY:=OKKy-OKy;      // прибавка длины

  M_MMy:= OMMy - OMy;   // смещение прямоугольника

  //теперь высчитываем координаты результирующие из начальных используя смещение и прибавку длины
  Yoo:=Yo-M_MMy;
  Ykk:=Yk-M_MMy + LaddY;

//------- Теперь просто в Rect запихиваем это и отдаем
  ResRect.Left:=Round(Xoo);
  ResRect.Right:=Round(Xkk);
  ResRect.Top:=Round(Yoo);
  ResRect.Bottom:=Round(Ykk);

  Result:= ResRect;
end;

end.
