unit UnitTitlesUtil;
 {$optimization off}
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StrUtils;



type
  TTitleRec = record        //
    I, Nom:longint; //����� ����� (�� ������� � ������ �����) � ����� (������ � �������) ������ � ������
                  // ������ ��� ��� �������� ������ ���������
   // text: string[100]; // ������ ������
    timeBeg, timeEnd: longint;  // ����� ������ � ����� ������������ ������ � ������� � ������ �����
  end;

type
  TTitleSettings = record
    Font: TFont;
    Position: TPoint;
  end;
Type
    PTitlesTab = ^TTitleRec;
    //PFileContent = ^TString;
    TArrayTitleRec = array of TTitleRec;
type
  TTitles = class (TObject)
  private

  public
    F: TextFile;
    //FileContent: array[1..1000000] of String;  // ������ ����� ��������������
    NStrings: longint;  // ���������� ����� � �����
    FileName: string;  // ��� ����� ������ .srt
    TitlesTab: TArrayTitleRec;// array[1..1000000] of TTitleRec; // ������ ����� ������ ������������
    NRec: longint; // ����� ��������� ������� ������
   // XXXText: array[1..1000000] of string[100];
    TitleCur: TTitleRec; // ������� ������ ������
    Sets: TTitleSettings;
    STATE: BOOLEAN; // ��������� ������ - ������ ��� �� ������ � ������������

    constructor Create;
    procedure ParseFile(FileName : string);     //������ ���� ������ � ��������� ��������� ���������� ������ ����� ������� ���������� ���� �����
    function NumTitleRec(TimeCur: longint): longint;  //���� � �������� TitlesTab (���������� ������� �������� �����)
                                                  //������ ������ �� ������� (����) � ���������� �� �����   (��� ���� ���� �� �����)
    function TimeStringToMSec(S:string):longint; // ����������� ����� � ������� ��:��:��,000 � ���������� ����������
    function GetTitleText(S:string): string;  // �������� �� ������ � �������� � ����� <Font> ��� ����� ������
    function GetTitlesFileName(FilmFileName:String):string; //�������� ��� ����� ������ �� ����� ����� �����

    procedure addElem( var A: TArrayTitleRec; Index: longint;  // ���������� �������� � ������������ ������ TitleRec
                                       ANew: TTitleRec );


  end;

var
  XText: array[1..1000000] of string[150];


implementation

constructor TTitles.Create;
var i:Longint;
begin
  inherited;
  Sets.Font:= TFont.Create;
  Sets.Position.X:= 0;
  Sets.Position.Y:=0;
  STATE:=False;
  for i:=0 to 1000000 do
    XText[i]:='-';

end;






procedure TTitles.ParseFile(FileName : string);
var i, Num: int64;
    tmp: string;
    Rec: TTitleRec;
    n:integer;
begin
  AssignFile(F,FileName);
  Reset(F);
  i:=1;
  NStrings:=i;
  i:=1;
  Num:=1;
  while not EOF(F) do
  begin
    Rec.Nom:= 0;
    Rec.I:=0;
    Rec.timeBeg:=0;
    Rec.timeEnd:=0;
    //Rec.Text:='';

    Rec.I:= Num;
    try
        readln(F,tmp);
        Rec.Nom:=StrToInt(tmp);
    except   // ������ �� ��� ������ ������
      ShowMessage('������ ���������� - �� ��������� ����� �����');
    end;
    inc(i);
    try
       readln(F,tmp);
       Rec.timeBeg:= TimeStringToMSec(Copy(tmp,1,12));
       Rec.timeEnd:= TimeStringToMSec(Copy(tmp,18,12));
    except   // ������ �� ��� ������ ������
      ShowMessage('������ ���������� - �� ���������� ����� �����');
    end;
    inc(i);
    try
       readln(F,tmp);
       Xtext[Num]:= GetTitleText(tmp);
   //    rec.text:=text[num];
    except
        ShowMessage('������ ���������� - �� ��������� ����� �����');
    end;
    try
      n:=0;
      repeat
        inc(i);
        readln(F,tmp);
        n:= Pos('</font>',tmp);
        if n<= 0 then Xtext[Num]:= Xtext[Num]+' | '+tmp;
        if EOF(F) then break;
      until n>0 ;

      inc(i);
      readln(F,tmp);
    except
      ShowMessage('������ ���������� - �� ���� ��������� ����');
    end;

    addElem(TitlesTab,Num,Rec);
    inc(Num);
    if Num = 10000 then
    begin
      Num:=Num;
    end;
  end;
  self.NRec:= Num-1;
  Close(f);
end;


function TTitles.TimeStringToMSec(S:string):longint;
var
   HH, MM, SS, MSS: string;
   res: longint;
begin
  HH:=Copy(S,1,2);
  MM:=Copy(S,4,2);
  SS:=Copy(S,7,2);
  MSS:=Copy(S,10,3);
  result:=3600000*StrToInt(HH)+60000*StrToInt(MM)+1000*StrToInt(SS)+StrToInt(MSS);
  //return res;
end;

function TTitles.GetTitleText(S:string): string;
Var n:integer;
begin
   n:= Pos('>',S);
   if n>0 then
   begin
     result:=copy(S,n+1,(length(S)-n));
   end
   else result:='';
end;



//����� � ������� ��������� ���������
function TTitles.NumTitleRec(TimeCur: longint): LongInt;
var verh, niz, sred, n{����� ���������}: longint;
    found: boolean;
begin
  // ����� verh:=1;
  niz := self.NRec;
  verh:=1;
  n := 0;   // ����� ��������� � ��������
  found := FALSE;
  // �������� ����� � �������
  repeat
    sred := Trunc((niz - verh) / 2) + verh;
    inc(n);

    if (TimeCur>=Self.TitlesTab[sred].timeBeg) and
       (TimeCur<Self.TitlesTab[sred].timeEnd)  then
      found := TRUE
    else
    if (TimeCur<Self.TitlesTab[sred].timeBeg) then
      niz := sred - 1
    else
      verh := sred + 1;
  until  (verh > niz) or found;


  if found then
  begin
    //ShowMessage('OK ' + IntToStr(sred));
    result:= sred;
  end
  else
  begin
    //showMessage('!');
    result:= 0;
  end;
end;



//--------------------------------------------------//
//      ��������� �������                           //
//--------------------------------------------------//

function TTitles.GetTitlesFileName(FilmFileName:String):string;
var tmp: string;
    Ext:String;
begin
  Ext:=ExtractFileExt(FilmFileName);
  tmp:= StringReplace(FilmFileName,Ext,'.srt',[]);
  if FileExists(tmp) then result:=tmp
  else Result:='';
end;

function ReversePos(Str:string; Substr:string): integer;
var S1: string;
    S2:string;
    N:integer;
begin
  N:=0;
  S1:= AnsiReverseString(Str);
  S2:= AnsiReverseString(Substr);
  N:= Pos(S2,S1);
  Result:= Length(Str) - Pos(S2,S1)+1;
end;





procedure TTitles.addElem( var A: TArrayTitleRec; Index: longint;
                                       ANew: TTitleRec );
var Len : integer;
begin
   Len:= Length( A );
   if Index >= Len then Index := Len+1;
   setLength(A, Len+1);
   {move( A[Index], A[ Index+1 ],
         (Len-Index) * sizeof( A[Index] ));
   }
   A[Index-1] := ANew;
end;

end.
