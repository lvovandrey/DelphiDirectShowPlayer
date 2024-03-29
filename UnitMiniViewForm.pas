unit UnitMiniViewForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,UnitVideoEngine, StdCtrls;

type
  TMiniViewForm = class(TForm)
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure VideoGo;
    procedure VideoGoGo(position: int64; Coord:TPoint);




  private
    { Private declarations }
  public

    VideoEngineDshow9: TVideoEngineDshow9;
    Ready:boolean;

  end;

var
  MiniViewForm: TMiniViewForm;

implementation
{$R *.dfm}
uses UnitMAIN;

procedure TMiniViewForm.FormCreate(Sender: TObject);
begin
  ready:=false;
  VideoEngineDshow9:= TVideoEngineDshow9.Create(MiniViewForm.Handle);
end;

procedure TMiniViewForm.VideoGo;
var curPos: int64;
begin
  VideoEngineDshow9.InitializAuto(Form1.FileName,Panel1.Handle, Panel1);
  VideoEngineDshow9.SetWindowPosition(Panel1.Left,Panel1.Top,Panel1.Left+Panel1.Width, Panel1.Top+ Panel1.Height);
  VideoEngineDshow9.F_Play;
  form1.pMediaSeeking.GetCurrentPosition(curPos);
  VideoEngineDshow9.pCurrent:=curPos;
  VideoEngineDshow9.F_Pause;
  ready:=true;
end;

procedure TMiniViewForm.VideoGOGO(position: int64; Coord:TPoint);
var curPos: int64;
    p: real;
    dur: int64;
begin
  Left:= Coord.X;
  Top:= Coord.Y;
  Show;
  VideoEngineDshow9.F_Play;
  VideoEngineDshow9.pCurrent:=position;
  VideoEngineDshow9.F_Pause;

end;










end.
