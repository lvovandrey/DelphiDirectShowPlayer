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
    //������� ����������� ���������� �������������� ������� �����������
    function CalcRect(Pan: TRect; // ������� ������������� ������� ���� �����������
                  Wnd:TRect;  // ������������� ��������� (�������� ���� � ������� �������������� ������� �������) ������� ���� - ��� 0,0
                  M:TPoint;   //���������� ����� ���� (�������� ��������� ����) ������������ ���� ��� WND
                  K:Double)   //���� ������������ - �� 0 �� ����-�� (���� 2 - ����-�� �� ������ ��� ������������� � 2 ����)
                  : TRect;    //����� ���������� ��� ����� �������� ����-��
  end;


implementation

constructor TZoom.Create;
begin
  inherited;
end;

//������� ����������� ���������� �������������� ������� �����������
function TZoom.CalcRect(Pan: TRect; Wnd:TRect; M:TPoint; K:Double): TRect;
var
   ResRect: TRect; // ����-�� ��� �����������
   LaddX,LaddY: double;  //������� � ������� �������, ����������� ��� ������������

   OMx,OKx,OMMx,OKKx,M_MMx:double; // ��� ����� �������� � ���������� ����� - � �� ����� �������
   Xm,Xk,Xo:double;          //  ��� � - ����� ������ �������
                              //  M - ����� ������ ������������ (���� ���������� ���� ���� ������ ��� ���� ���� ���)
                              //  MM - �� �� �� ����� ������������ ������� �� Ladd
                              //  K - ����� ����� �������
                              //  KK - ����� ����� ����� ������� ����� ����
   {          ���� ���������(���� Wnd.Left)
                 |
      [--------- |---------o-----x-------------]---------]
      O          |         M    MM             K         KK            }
   {������ ������ ����� - ������� ���������� � ����� ������� OK  ���������� ����� Ladd,
    � ����� ������� ���� ������� ��� ����� ����� M � MM �������}

   OMy,OKy,OMMy,OKKy, M_MMy:double; // ��� �� �� ����� ��� ���� ������ �� ��� Y
   Ym,Yk,Yo:double;

   Xkk,Xoo,Ykk,Yoo:double;           //� ��� ���������� ����������

begin
//--------------------------------------------------------//
//          ������� ���������� � ���� X                   //
//--------------------------------------------------------//
  Xk:=Pan.Right;
  Xm:=M.X;
  Xo:=Pan.Left;

  OKx:=Xk-Xo;
  OMx:=Xm-Xo;
  OKKx:=OKx*k;
  OMMx:= OKKx*(OMx/OKx);

  LaddX:=OKKx-OKx;      // �������� �����

  M_MMx:= OMMx - OMx;   // �������� ��������������

  //������ ����������� ���������� �������������� �� ��������� ��������� �������� � �������� �����
  Xoo:=Xo-M_MMx;
  Xkk:=Xk-M_MMx + LaddX;

//--------------------------------------------------------//
//          ������  ��� Y                                 //
//--------------------------------------------------------//
  Yk:=Pan.Bottom;
  Ym:=M.Y;
  Yo:=Pan.Top;

  OKy:=Yk-Yo;
  OMy:=Ym-Yo;
  OKKy:=OKy*k;
  OMMy:= OKKy*(OMy/OKy);

  LaddY:=OKKy-OKy;      // �������� �����

  M_MMy:= OMMy - OMy;   // �������� ��������������

  //������ ����������� ���������� �������������� �� ��������� ��������� �������� � �������� �����
  Yoo:=Yo-M_MMy;
  Ykk:=Yk-M_MMy + LaddY;

//------- ������ ������ � Rect ���������� ��� � ������
  ResRect.Left:=Round(Xoo);
  ResRect.Right:=Round(Xkk);
  ResRect.Top:=Round(Yoo);
  ResRect.Bottom:=Round(Ykk);

  Result:= ResRect;
end;

end.
