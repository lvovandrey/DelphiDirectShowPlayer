unit UnitTxtSMIFle;
{$optimization off}
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinManager, StdCtrls, sButton, ExtCtrls, sPanel, sEdit,
  acPopupCtrls, ToolWin, ComCtrls, acCoolBar, Buttons, sSpeedButton,
  sBitBtn, acImage, sGroupBox, sLabel, sListBox, sMemo, sCheckBox,
  acProgressBar, sTrackBar,  Menus,  DirectShow9, ActiveX, ComObj, Grids,
  sDialogs, AppEvnts, sSpinEdit, Mask, sMaskEdit,ExtDlgs, acPathDialog,
  UnitInfoForm, UnitImgForm, UnitSettingsForm, UnitTitlesUtil, UnitZoom,
  UnitVideoEngine;

type
  TSMIFile = Record
    IsFileOpen : boolean;
    ShortFileName : string;
    FullFileName : string;
    FileDir: string;
    txtFile : TextFile;

  end;

type
  TTxtSMIFile = class (TObject)
  private

  public
    LogFile:TSMIFile;
    MainFile: TSMIFile;



    constructor Create;
    function Define(_filename:string) : boolean;
    function IsDefOk : boolean;
    procedure FillFileFromStringGrid (StrGrd:TStringGrid; SMIFile: TSMIFile; IsOKMsg: boolean);
    procedure FillStringGridFromFile (StrGrd:TStringGrid; SMIFile: TSMIFile; IsOKMsg: boolean);
    procedure ClearStrGrd (StrGrd: TStringGrid);
    procedure NewFile;
    procedure OpenFile;
    procedure SaveExistingFile;
    procedure SaveOnlyLogFile;
  end;



implementation
uses UnitMAIN;

constructor TTxtSMIFile.Create;
begin
  inherited;
  MainFile.IsFileOpen := false;
  MainFile.ShortFileName := '';
  MainFile.FullFileName := '';
  MainFile.FileDir:='';
  LogFile.IsFileOpen := false;
  LogFile.ShortFileName := '';
  LogFile.FullFileName := '';
  LogFile.FileDir:='';

end;

function TTxtSMIFile.IsDefOk : boolean;
begin
  if MainFile.IsFileOpen and LogFile.IsFileOpen then
    Result:= true
  else
    Result:= false;
end;

//Сохраняем главный файл
procedure TTxtSMIFile.SaveExistingFile;
begin
  if not IsDefOk then
  begin
    ShowMessage('Сохранение не возможно: файл txt не создан');
    Exit;
  end;
  FillFileFromStringGrid(Form1.StringGrid1,MainFile,true);
  FillFileFromStringGrid(Form1.StringGrid1,LogFile,false);
end;

//сохраняем только лог-файл
procedure TTxtSMIFile.SaveOnlyLogFile;
begin
  if not IsDefOk then
  begin
    ShowMessage('Сохранение не возможно: файл txt не создан');
    Exit;
  end;
  FillFileFromStringGrid(Form1.StringGrid1,LogFile, false);
end;

// создаем файл
procedure TTxtSMIFile.NewFile;
var
    txtFilename, StrForFile: string;
    buttonSelected : Integer;
begin
  Form1.ssaveDialog1.Title := 'Создать файл';
  Form1.ssaveDialog1.InitialDir := GetCurrentDir;
  Form1.ssaveDialog1.Filter := 'Text file|*.txt';
  Form1.ssaveDialog1.DefaultExt := 'txt';
  Form1.ssaveDialog1.FilterIndex := 1;

  if not Form1.sSaveDialog1.Execute then exit;
  txtFilename:=Form1.sSaveDialog1.FileName;

  if (not FileExists(txtFilename)) then
  begin
   if (Define(txtFilename)) then
   begin
     FillFileFromStringGrid(Form1.StringGrid1, MainFile, true);
     FillFileFromStringGrid(Form1.StringGrid1, LogFile, false);
   end;
  // else ShowMessage('Не удалось создать файл txt');
  end
  else
  begin
    buttonSelected := MessageDlg('Выбран уже существующий файл. ДАННЫЕ В НЕМ БУДУТ СТЕРТЫ. Перезаписать?',mtWarning, [mbYes, mbNo], 0);
    if buttonSelected = mrNo then exit;
    if buttonSelected = mrYes  then
    begin
         if (Define(txtFilename)) then
         begin
            FillFileFromStringGrid(Form1.StringGrid1, MainFile, true);
            FillFileFromStringGrid(Form1.StringGrid1, LogFile, false);
         end;
    end;
  end;


end;


//Создаем папку
function MakeDirectory(path: string): boolean;
begin
  if DirectoryExists(path) then
  begin Result:=true; end
  else
    if CreateDir(path) then
       Result:=true
    else
      Result:=false;
end;


//Открываем файл
procedure TTxtSMIFile.OpenFile;
var
    txtFilename: string;
    buttonSelected : Integer;
begin
  Form1.sOpenDialog2.Title := 'Открыть файл';
  Form1.sOpenDialog2.Filter := 'Text file|*.txt';
  Form1.sOpenDialog2.DefaultExt := 'txt';
  Form1.sOpenDialog2.FilterIndex := 1;

  if not Form1.sOpenDialog2.Execute then exit;
  txtFilename:=Form1.sOpenDialog2.FileName;


  if (not FileExists(txtFilename)) then
  begin
    ShowMessage('Файл не существует'); Exit;
  end
  else
  begin
    if Form1.HaveDataInStrGrd then
    begin
      buttonSelected := MessageDlg('В таблице есть данные. Убедитесь что они сохранены в файл. Стереть таблицу и продолжить загрузку файла?',mtWarning, [mbYes, mbNo], 0);
      if buttonSelected = mrNo then exit;
      if buttonSelected = mrYes  then
      begin
         if (Define(txtFilename)) then
         begin
            ClearStrGrd(Form1.StringGrid1);

            FillStringGridFromFile(Form1.StringGrid1, MainFile, true);

            FillFileFromStringGrid(Form1.StringGrid1, LogFile, false);
         end;
      end;
    end
    else
    begin
         if (Define(txtFilename)) then
         begin
            FillStringGridFromFile(Form1.StringGrid1, MainFile, true);

            FillFileFromStringGrid(Form1.StringGrid1, LogFile, false);
         end;
    end;
  end;
end;

// Очищаем стринггрид
procedure TTxtSMIFile.ClearStrGrd (StrGrd: TStringGrid);
var CurRow,NRows, i : Integer;
begin
    CurRow:=1;
    NRows:= StrGrd.RowCount;
    for i:= CurRow to NRows-1 do
    begin
      Form1.DeleteRowStrGrd(StrGrd,CurRow);
    end;
    StrGrd.Row:=1;
end;


//Заполняем Стриггрид из файла
procedure TTxtSMIFile.FillStringGridFromFile(StrGrd:TStringGrid; SMIFile: TSMIFile; IsOKMsg: boolean);
var
    txtFilename, StrForFile, s, s_tmp: string;
    i, j, Nrows, N, len: integer;
    sep: string;
    ok: boolean;
    txtFile:TextFile;
begin
  ok:=true;
  if (not IsDefOk) then
  begin
    ShowMessage('Файл *.txt для сохранения не задан');
    Exit;
  end;

  try
    try



    AssignFile(txtFile, SMIFile.FullFileName);
    Reset(txtFile);

    i := 0;
    while (not EOF(txtFile)) do
    begin
      sep:= ''+ chr(VK_tab);
      Readln(txtFile, s);
      len:= Length(s);
      if len > 4 then
      begin
     //добавляем еще одну строку в таблицу
        StrGrd.RowCount:= StrGrd.RowCount+1;
        i:=i+1;
        for j:= 0 to 3 do
        begin
          N:= Pos(sep,s);
          s_tmp:= copy(s,1,N-1);
          StrGrd.Cells[j,i]:= s_tmp;
          len:= Length(s);
          s:= copy(s,N+1,len-N);
        end;
        StrGrd.Cells[4,i]:= s;
      end;
   end;
   except
      ShowMessage('Ошибка чтения файла .txt');  ok:=false;
   end;
 finally
   try   CloseFile(txtFile);
   except
     ShowMessage('Ошибка освобождения файла .txt');  ok:= false;
   end;
   if ok then
     if IsOKMsg  then
         FormInfo.ShowMessageOnTime('Открытие файла прошло успешно', 500);

 end;

end;

//Определяем все поля объекта и инициализируем его
function TTxtSMIFile.Define(_filename:string) : boolean;
var IsDirCreate:boolean;
begin
  IsDirCreate:= false;
  try
    LogFile.FileDir:= 'C:/NIIES Player Logs';
    if (not MakeDirectory(LogFile.FileDir)) then
    begin
      IsDirCreate:= false;
      raise EInOutError.Create('Can not create directory');
    end;
    LogFile.IsFileOpen := true;
    LogFile.FileDir:= 'C:/NIIES Player Logs/';

    IsDirCreate:= true;
    MainFile.IsFileOpen := true;
    MainFile.ShortFileName := ExtractFileName(_filename);
    MainFile.FullFileName := _filename;
    MainFile.FileDir:= StringReplace(MainFile.FullFileName,MainFile.ShortFileName,'',[rfIgnoreCase]);


    LogFile.ShortFileName:= StringReplace(MainFile.ShortFileName,'.txt','_log_'+DateToStr(Now)+'_' + StringReplace(TimeToStr(Now),':','_',[rfIgnoreCase,rfReplaceAll])+ '.txt',[rfIgnoreCase]);
    LogFile.FullFileName:= LogFile.FileDir + LogFile.ShortFileName;

    Result:= true;
    Form1.sMemoTxtDir.Text := MainFile.FileDir;
    Form1.sLabelTxtFileName.Caption:= MainFile.ShortFileName;

  except
     ShowMessage('Не удалось инициализировать файл txt');
     MainFile.IsFileOpen := false;
     MainFile.ShortFileName := '';
     MainFile.FullFileName := '';
     MainFile.FileDir:='';

     LogFile.IsFileOpen := false;
     LogFile.ShortFileName := '';
     LogFile.FullFileName := '';
     LogFile.FileDir:='';

      if not IsDirCreate then
      ShowMessage('Не удалось создать папку логов C:/NIIES Player Logs');

     Result:= false;
  end;

end;



//Заполняем файл из стринггрида
procedure TTxtSMIFile.FillFileFromStringGrid (StrGrd:TStringGrid; SMIFile: TSMIFile; IsOKMsg: boolean);
var
    StrForFile: string;
    i, Nrows: integer;
    ok: boolean;
begin
 ok:=true;
 if (not IsDefOk) then
 begin
   ShowMessage('Файл *.txt для сохранения не задан');
   Exit;
 end;

 try
    try
    AssignFile(SMIFile.txtFile, SMIFile.FullFileName);
    Rewrite(SMIFile.txtFile);

    Nrows:= Form1.FindEmptyString(StrGrd)-1;                  // ПЛОХАЯ СТРОКА
    if Nrows > 0 then
    begin
      for i:=1 to Nrows do
      begin
      StrForFile:=StrGrd.Cells[0,i] + chr(VK_tab) +
                StrGrd.Cells[1,i] + chr(VK_tab) +
                StrGrd.Cells[2,i] + chr(VK_tab) +
                StrGrd.Cells[3,i] + chr(VK_tab) +
                StrGrd.Cells[4,i];
      Writeln(SMIFile.txtFile, StrForFile);
      end;
    end;
    except ShowMessage('Ошибка записи в файл .txt');  ok:=false;
    end;
 finally
    try   CloseFile(SMIFile.txtFile);
    except
      ShowMessage('Ошибка закрытия файла .txt');  ok:= false;
    end;
    if ok then
      if IsOKMsg  then
          FormInfo.ShowMessageOnTime('Сохранение прошло успешно', 1000);

 end;
end;



end.
