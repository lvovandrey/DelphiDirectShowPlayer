program PlayerNiies;

uses
  Forms,
  UnitMAIN in 'UnitMAIN.pas' {Form1},
  UnitSettingsForm in 'UnitSettingsForm.pas',
  UnitTitlesUtil in 'UnitTitlesUtil.pas',
  UnitZoom in 'UnitZoom.pas',
  UnitVideoEngine in 'UnitVideoEngine.pas',
  UnitImgForm in 'UnitImgForm.pas' {FormIMG},
  UnitInfoForm in 'UnitInfoForm.pas' {FormInfo},
  UnitTxtSMIFle in 'UnitTxtSMIFle.pas',
  UnitMiniViewForm in 'UnitMiniViewForm.pas' {MiniViewForm};

// ������� ����� �������������

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '���������� �����';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormIMG, FormIMG);
  Application.CreateForm(TFormInfo, FormInfo);
  Application.CreateForm(TFormIMG, FormIMG);
  Application.CreateForm(TFormInfo, FormInfo);
  Application.CreateForm(TMiniViewForm, MiniViewForm);
  Application.Run;
end.
