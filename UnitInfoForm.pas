unit UnitInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel;

type
  TFormInfo = class(TForm)
    sPanel1: TsPanel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowMessageOnTime(text: string; time_in_msec: Integer);
  end;

var
  FormInfo: TFormInfo;

implementation

{$R *.dfm}
procedure TFormInfo.ShowMessageOnTime(text: string; time_in_msec: Integer);
begin
      sPanel1.Caption:=text;
      Show;
      formInfo.refresh;
      formInfo.repaint;
      formInfo.repaint;
      sleep(time_in_msec);
      formInfo.refresh;
      formInfo.repaint;
      formInfo.repaint;
      formInfo.Hide;
end;

end.
