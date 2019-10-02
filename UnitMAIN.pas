unit UnitMAIN;
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
  UnitVideoEngine, UnitTxtSMIFle, acPNG, UnitMiniViewForm;


 const
   VERSION = '6.2.7';
   PROG_CAPTION = '���������� �����';
   WM_MYMESSAGE = WM_USER+1;
   MAX_CLD_FORMS = 10;        //����������� �� ���-�� �������� ���� �������������

type



  //type TMyGrid=class(TCustomGrid);

  TForm1 = class(TForm)


    sSkinManager1: TsSkinManager;
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    Panel1: TPanel;
    sPanel4: TsPanel;
    sTrackBar1: TsTrackBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    D1: TMenuItem;
    sOpenDialog1: TsOpenDialog;
    Timer1: TTimer;
    ApplicationEvents1: TApplicationEvents;
    sSaveDialog1: TsSaveDialog;
    sOpenDialog2: TsOpenDialog;
    Panel2: TsPanel;
    sPanel6: TsPanel;
    sPanel3: TsPanel;
    sSpeedButtonPlay: TsSpeedButton;
    sSpeedButtonPause: TsSpeedButton;
    sSpeedButtonStop: TsSpeedButton;
    sSpeedButtonDec: TsSpeedButton;
    sSpeedButtonInc: TsSpeedButton;
    sSpeedButtonOpen: TsSpeedButton;
    sSpeedButtonOptions: TsSpeedButton;
    sLabel5: TsLabel;
    sSpeedButtonPrevFrame: TsSpeedButton;
    sSpeedButtonNextFrame: TsSpeedButton;
    sLabel6: TsLabel;
    sLabel9: TsLabel;
    sLabel10: TsLabel;
    sLabel2: TsLabel;
    sLabel1: TsLabel;
    sTrackBar2: TsTrackBar;
    sDecimalSpinEdit1: TsDecimalSpinEdit;
    sSpeedButtonExcelOpen: TsSpeedButton;
    sSpeedButtonTimeSend: TsSpeedButton;
    Panel3: TPanel;
    sButton1: TsButton;
    sButton6: TsButton;
    sButton2: TsButton;
    sButton7: TsButton;
    sButton3: TsButton;
    sButton8: TsButton;
    sButton4: TsButton;
    sButton9: TsButton;
    sButton5: TsButton;
    sButton0: TsButton;
    sButton13: TsButton;
    sButton10: TsButton;
    Panel4: TPanel;
    StringGrid1: TStringGrid;
    Panel5: TPanel;
    sSpeedButtonImgForm: TsSpeedButton;
    sOpenPictureDialog1: TsOpenPictureDialog;
    sSpeedButtonNewForm: TsSpeedButton;
    sPathDialog1: TsPathDialog;
    sSpeedButtonKvadrator: TsSpeedButton;
    sPanel8: TsPanel;
    sTrackBarSHIFT: TsTrackBar;
    sPanelSHIFT: TsPanel;
    sPanel9: TsPanel;
    sLabel8: TsLabel;
    sSpeedButtonInterface: TsSpeedButton;
    sSpeedButtonSaveTxt: TsSpeedButton;
    sLabelKvadrator: TsLabel;
    Timer2: TTimer;
    sCheckBoxManage: TsCheckBox;
    sCheckBoxSync: TsCheckBox;
    sSkinManager2: TsSkinManager;
    sLabelTitles: TsLabel;
    Label1: TLabel;
    sSpeedButton1: TsSpeedButton;
    sButtonQ: TsButton;
    sButtonW: TsButton;
    sButtonE: TsButton;
    sButtonR: TsButton;
    sButtonT: TsButton;
    sButtonY: TsButton;
    sButtonU: TsButton;
    sButtonI: TsButton;
    sButtonO: TsButton;
    sButtonP: TsButton;
    sSkinManager3: TsSkinManager;
    PopupMenuStrGrd: TPopupMenu;
    E1: TMenuItem;
    N3: TMenuItem;
    sSpeedButtonStrDownDel: TsSpeedButton;
    sSpeedButtonStrSelDel: TsSpeedButton;
    sSpeedButtonStrDel: TsSpeedButton;
    N4: TMenuItem;
    L1: TMenuItem;
    sSpeedButtonAddStr: TsSpeedButton;
    N5: TMenuItem;
    sPanel5: TsPanel;
    sLabelFileName: TsLabel;
    sPanel7: TsPanel;
    sCheckBox1: TsCheckBox;
    sSpeedButtonTimeSend2: TsSpeedButton;
    TimerSendToExcel: TTimer;
    sLabelExcelConnect: TsLabel;
    sCheckBoxExcelSync: TsCheckBox;
    TimerOpenFile: TTimer;
    sPanel10: TsPanel;
    LabelProgInfo: TLabel;
    sLabelTxtFileName: TsLabel;
    sButton11: TsButton;
    sMemoTxtDir: TsMemo;
    Image1: TImage;
    Button1: TButton;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Button2: TButton;
    Panel9: TPanel;
    Button3: TButton;
    Button4: TButton;
    procedure FormResize(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure Initializ;
    procedure Player;

    function FindEmptyString(SG :TStringGrid): Integer;
    procedure RecordCurTimeInGrid(CurRow: Integer; Zone:String; SG: TStringGrid);
    procedure AddInStrGrd(StrGrd:TStringGrid; S:String);
    procedure DeleteRowStrGrd (StrGrd: TStringGrid; CurRow:Integer);
    procedure AddRowSelectedStrGrd (StrGrd: TStringGrid; CurRow:Integer);
    procedure NextRowSelectedStrGrd (StrGrd: TStringGrid; Shift:Integer);
    procedure ClearStrGrd();
    function HaveDataInStrGrd(): boolean;


    //procedure DeleteARow(Grid: TStringGrid; ARow: Integer);
    Procedure TimeConvertForTimers(pCurrentTime: int64;
                                      var sH:String;
                                      var sM:string;
                                      var sS:string;
                                      var sMS:string);


    procedure sTrackBar1Change(Sender: TObject);
    procedure sSpeedButtonPlayClick(Sender: TObject);
    procedure sSpeedButtonPauseClick(Sender: TObject);
    procedure sSpeedButtonStopClick(Sender: TObject);
    procedure sSpeedButtonDecClick(Sender: TObject);
    procedure sSpeedButtonIncClick(Sender: TObject);
    procedure sSpeedButtonOpenClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sTrackBar1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sTrackBar1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);


    procedure Panel1DblClick(Sender: TObject);



    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure sTrackBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sSpeedButtonExcelOpenClick(Sender: TObject);
    procedure sSpeedButtonTimeSendClick(Sender: TObject);

    procedure MessageReceiver(var msg: TMessage);  message WM_MYMESSAGE;
    procedure sButton1Click(Sender: TObject);

    procedure sButton13Click(Sender: TObject);
    procedure sButton10Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure sButton4Click(Sender: TObject);
    procedure sButton5Click(Sender: TObject);
    procedure sButton6Click(Sender: TObject);
    procedure sButton7Click(Sender: TObject);
    procedure sButton8Click(Sender: TObject);
    procedure sButton9Click(Sender: TObject);
    procedure sButton0Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure sSpeedButtonImgFormClick(Sender: TObject);
    procedure sSpeedButtonNewFormClick(Sender: TObject);
    procedure sSpeedButtonKvadratorClick(Sender: TObject);
//    procedure sSpeedButtonSaveTxtClick(Sender: TObject);
    procedure sSpeedButtonInterfaceClick(Sender: TObject);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sPanel3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);

    procedure WMSysCommand(var Msg: TWMSysCommand);message WM_SYSCOMMAND;


    procedure F_Pause;
    procedure F_Stop;
    procedure F_Play;
    procedure F_OpenFiles(FileNames: array of string; NFiles: integer);
    procedure F_SetPosition(Position: int64);
    procedure F_AddCldForm;
    procedure F_ChangeSpeed(ratio: double);
    procedure F_StepFrame(NSteps: integer);

    procedure F_Syncronization;
    
    procedure InterfaceMAX;
    procedure InterfaceMIN;
    procedure InterfaceTRACK;
    procedure InterfaceNOMENU;
    procedure Kvadrat(ForceStart:boolean);

    procedure Zooming(MousePos: TPoint; K:Double);




    procedure FormRefreshSets;
    procedure sSpeedButtonNextFrameClick(Sender: TObject);
    procedure sSpeedButtonPrevFrameClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure sCheckBoxManageClick(Sender: TObject);
    procedure sCheckBoxSyncClick(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure sButton14Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sButtonQClick(Sender: TObject);
    procedure sButtonWClick(Sender: TObject);
    procedure sButtonEClick(Sender: TObject);
    procedure sButtonRClick(Sender: TObject);
    procedure sButtonTClick(Sender: TObject);
    procedure sButtonYClick(Sender: TObject);
    procedure sButtonUClick(Sender: TObject);
    procedure sButtonIClick(Sender: TObject);
    procedure sButtonOClick(Sender: TObject);
    procedure sButtonPClick(Sender: TObject);
    procedure sSpeedButtonStrDownDelClick(Sender: TObject);
    procedure sSpeedButtonStrSelDelClick(Sender: TObject);
    procedure sSpeedButtonStrDelClick(Sender: TObject);
    procedure sSpeedButtonAddStrClick(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sSpeedButtonTimeSend2Click(Sender: TObject);
    procedure TimerSendToExcelTimer(Sender: TObject);
    procedure ExcelClosing;
    procedure ExcelOpening;
    procedure SendStateToExcel;
    procedure Panel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TimerOpenFileTimer(Sender: TObject);
    procedure sMemoTxtDirChange(Sender: TObject);
    procedure sButton11Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);



   
  private


  public
    hr: HRESULT; //������ ��������� �������� ����
    pCurrent : int64;// ������� ��������� � ������������ ������
    pDuration:int64;
    Mode: TPlayerMode; // ����� ���������������
    Rate: Double;// ���������� �������� ���������������
    FullScreen: boolean; //��������� �������� � ������������� �����
    i: integer;// ������� ����������� ������
    FileName: string;//��� ����� ��� ������� ���������� ����
    xn: integer; //��� �������� ��������� ����
    yn: integer;
    mouse: tmouse; //���������� ����
    TrackingBarOn: boolean; //��������� �������������� ����-����
    TrackBarInch: int64; //������� ����� (100��) � ����� ��������� ����-���� (����� ��������� 2000)

    Panel1MovingFlag: boolean;  // ���������� ��� ������������� �����������
    MousePos:TPoint;            //

    TxtSMIFile: TTxtSMIFile;


    Sets: TFormSets;


    ShPos: Int64;  //�������� (� �����(100��))


    //���������� ��� ���������� � ���������� ������
    pGraphBuilder        : IGraphBuilder       ; //��� ����
    pMediaControl        : IMediaControl       ; //���������� ������
    pMediaEvent          : IMediaEvent         ; //���������� �������
    pVideoWindow         : IVideoWindow        ; //������ ���� ��� ������
    pMediaSeeking        : IMediaSeeking       ; //������� ������������
    pBasicAudio          : IBasicAudio        ; //���������� ������

    //���������� ��� ������� Excel
    Excel             : OleVariant;
    WkSheet           : OleVariant;
    PixelsPerPoint    : Double ;
    XL_Open           : boolean ;



    { Public declarations }
  end;




var
  Form1: TForm1;
  CldForms: array[1..MAX_CLD_FORMS] of TForm1; // ������ �������� ����
  NCldForms: integer  = 0; // ���������� �������� ����
  ArrFileNames: array [0..MAX_CLD_FORMS] of string;//����� ������ ��� ���� ���� 0 ���� - ��� �������� �����
  Titles: TTitles;
  Zoom:TZoom;

  NN:integer;

  var eng1, eng2, eng3, eng4: TVideoEngineDshow9; //������ ��� �����������



{  ����� ���������!
 1. ��� ���������������� ����� ����� �� 0,1 �� ��� 1 000 000 �����������
����� IMediaSeeking (1 ��� - ����� 100 ��)   }


implementation

{$R *.dfm}

procedure TForm1.FormRefreshSets;
begin
  Height:= Sets.Heigth;
  Top:= Sets.Top;
  Width:=Sets.Width;
  Left:=Sets.Left;
end;


//---------------------------------------------------//
// ������� ������ ������
//---------------------------------------------------//
//---------------------------------------------------//
//---------------------------------------------------//
//---------------------------------------------------//
//---------------------------------------------------//
procedure TForm1.Initializ;
//��������� ���������� �����
begin
//����������� ������������ ����������
  if Assigned(pMediaSeeking) then pMediaSeeking := nil;
  if Assigned(pBasicAudio) then pBasicAudio  := nil;
  if Assigned(pVideoWindow) then pVideoWindow := nil;
  if Assigned(pMediaEvent) then pMediaEvent := nil;
  if Assigned(pMediaControl) then pMediaControl := nil;
  if Assigned(pGraphBuilder) then pGraphBuilder := nil;
//�������� ��������� ���������� �����
  hr := CoCreateInstance(CLSID_FilterGraph, nil, CLSCTX_INPROC_SERVER, IID_IGraphBuilder, pGraphBuilder);
  if hr<>0 then begin
    ShowMessage('�� ������� ������� ����');
    exit;
  end;
//�������� ��������� ����������
  hr := pGraphBuilder.QueryInterface(IID_IMediaControl, pMediaControl);
  if hr<>0 then begin
    ShowMessage('�� ������� �������� ��������� IMediaControl');
    exit;
  end;
//�������� ��������� �������
   hr := pGraphBuilder.QueryInterface(IID_IMediaEvent, pMediaEvent);
   if hr<>0 then begin
    ShowMessage('�� ������� �������� ��������� �������');
    exit;
  end;
//�������� ��������� ���������� ����� ������ �����
  hr := pGraphBuilder.QueryInterface(IID_IVideoWindow, pVideoWindow);
  if hr<>0 then begin
    ShowMessage('�� ������� �������� IVideoWindow');
    exit;
  end;
//�������� ��������� ���������� ������
   hr := pGraphBuilder.QueryInterface(IBasicAudio, pBasicAudio);
  if hr<>0 then begin
    ShowMessage('�� ������� �������� ����� ���������');
    exit;
  end;
//�������� ���������  ���������� �������� ������������
  hr := pGraphBuilder.QueryInterface(IID_IMediaSeeking, pMediaSeeking);
   if hr<>0 then begin
    ShowMessage('�� ������� �������� ��������� ���������� ��������');
    exit;
  end;
//��������� ���� ��� ������������
  hr := pGraphBuilder.RenderFile(StringToOleStr(PChar(filename)), '');
  if hr<>0 then begin
    ShowMessage('�� ������� ������������ ����');
    exit;
  end;
//����������� ������ � ����� �� ������
   pVideoWindow.Put_Owner(Panel1.Handle);//������������� "���������" ����, � ����� ������ Panel1
   pVideoWindow.Put_WindowStyle(WS_CHILD OR WS_CLIPSIBLINGS);//����� ����
   pVideoWindow.put_MessageDrain(Panel1.Handle);//��������� ��� Panel1 ����� �������� ��������� ����� ����
   pVideoWindow.SetWindowPosition(0,0,Panel1.ClientRect.Right,Panel1.ClientRect.Bottom); //�������
end;


procedure TForm1.Player;
//��������� ������������ �����
begin
if mode<>paused then begin
//���� ���� �� ����������, �� �������
if not FileExists(FileName) then begin ShowMessage('���� �� ����������');exit;end;
//����������� ����� ���������������
end;
//����������� ����� ���������������
Initializ;
//��������� ��������� ������������
pMediaControl.Run;
//�������� �������� ���������������
pMediaSeeking.GetRate(Rate);
//����������� ��������� ����� ��� �������������� �����
//Caption := PROG_CAPTION + ' '+ VERSION;//  +'                      ' + ExtractFileName(FileName);
sLabelFilename.Caption :=FileName;
//������������� ����� ��������������� PlayMode - play
mode:=play;
end;

//---------------------------------------------------//
// ������� ������ ������ ������, ������� ���������������� �� ��� ���������� ���� ������
//---------------------------------------------------//
procedure TForm1.F_Pause();
var i: integer;
begin
   if mode = play then begin
      pMediaControl.Pause;
      if (NCldForms>0) and (Sets.FormType = MAIN) then
      begin
        for i:=1 to NCldForms do
        begin
          if CldForms[i].Sets.ManageAllow and (CldForms[i].mode=play) then
          begin
            CldForms[i].pMediaControl.Pause;
            CldForms[i].Mode:= paused;
          end;
        end;
      end;
   mode := paused;
   end;
end;

procedure TForm1.F_Stop();
var i: integer;
beg: int64;
begin
 if (mode=paused) or (mode=play) then
 begin
   pMediaControl.Stop;
   beg:= 0;  //sTrackBar1.Position;
   pMediaSeeking.GetDuration(pDuration);
   pMediaSeeking.SetPositions(beg, AM_SEEKING_AbsolutePositioning, pDuration, AM_SEEKING_NoPositioning);
   if (NCldForms>0) and (Sets.FormType = MAIN) then
   begin
      for i:=1 to NCldForms do
      begin
          if CldForms[i].Sets.ManageAllow and ((CldForms[i].Mode = Paused) or (CldForms[i].mode=play)) then
          begin
            CldForms[i].pMediaControl.Stop;
            beg:= 0;
            CldForms[i].pMediaSeeking.GetDuration(CldForms[i].pDuration);
            CldForms[i].pMediaSeeking.SetPositions(beg, AM_SEEKING_AbsolutePositioning, CldForms[i].pDuration, AM_SEEKING_NoPositioning);
            CldForms[i].Mode:=Stop;
          end;
      end;
   end;
   mode:=Stop;
 end;
end;

procedure TForm1.F_Play();
var i: integer;
begin
 //��������� ���� �� ���������������
 if (mode=paused) or (mode=stop) then
 begin
   if FileExists(FileName) then begin pMediaControl.Run;  end;
   if (NCldForms>0) and (Sets.FormType = MAIN) then
   begin
      for i:=1 to NCldForms do
      begin
          if CldForms[i].Sets.ManageAllow and (FileExists(CldForms[i].FileName)) and ((CldForms[i].Mode = Paused) or (CldForms[i].mode=stop)) then
          begin
              CldForms[i].pMediaControl.Run;
              CldForms[i].Mode:=Play;
          end;
      end;
   end;
   mode:=play;//������������� playmode -> ����
 end;
end;

procedure TForm1.F_OpenFiles(FileNames: array of string; NFiles: integer);
var
 j,i: Integer;
 beg: int64;
begin
  F_Pause();
  if NFiles>MAX_CLD_FORMS then
  begin
    ShowMessage('������ ������ ���� ����� ' + IntToStr(MAX_CLD_FORMS));
  end;
  Filename:=FileNames[0];
  ArrFileNames[0]:=Filename;

  player;
  F_pause;
  pMediaSeeking.GetDuration(pDuration);
  beg:= 0;
  pMediaSeeking.SetPositions(beg, AM_SEEKING_AbsolutePositioning, pDuration, AM_SEEKING_NoPositioning);
  TrackBarInch:= round(pDuration/STrackbar1.Max); //������ ������� ����-����


  if Sets.FormType = MAIN then
  for I := 1 to NFiles-1  do
  begin
    if NCldForms<(NFiles-1) then F_AddCldForm;
    ArrFileNames[I]:= FileNames[I];
    CldForms[I].FileName:=  FileNames[I];
    CldForms[I].player;
    CldForms[I].F_pause;
    CldForms[I].pMediaSeeking.GetDuration( CldForms[I].pDuration);
    beg:= 0;
    CldForms[I].pMediaSeeking.SetPositions(beg, AM_SEEKING_AbsolutePositioning,  CldForms[I].pDuration, AM_SEEKING_NoPositioning);
    CldForms[I].TrackBarInch:= round(CldForms[I].pDuration/CldForms[I].STrackbar1.Max); //������ ������� ����-����
    CldForms[I].Left:=Left+20*I;
    CldForms[I].Top:=Top+20*I;
  end;
  I:=NFiles-1;
  While I>=1 do
  begin
    cldForms[I].show;
    Dec(I);
  end;
  Show;

  MiniViewForm.VideoGo;

  if Sets.FormType = MAIN then //��������� �����
  begin
    Titles.STATE:=false;
   // sPanel6.Caption:= '';

    if not ((Titles.GetTitlesFileName(FileName))='') then
    begin
      FormInfo.sPanel1.Caption:='C��������� ������';
      formInfo.Show;
      sleep(100);
      formInfo.refresh;
      formInfo.repaint;
      formInfo.repaint;

      //showMessage(Titles.GetTitlesFileName(FileName));
      Titles.ParseFile(Titles.GetTitlesFileName(FileName));
      Titles.STATE:=true;
      formInfo.Hide;
    end
    else
    begin
      formInfo.sPanel1.Caption:='����� �� �������';
      formInfo.Show;
      sleep(500);
      formInfo.refresh;
      formInfo.repaint;
      form1.repaint;
      sleep(500);
      formInfo.Hide;
    end;

   // sPanel6.Caption:='';

   
  end;


end;



procedure TForm1.F_SetPosition(Position: int64);
var i:integer;
begin
  if not(mode=Empty) then
  pMediaSeeking.SetPositions(Position, AM_SEEKING_AbsolutePositioning, pDuration, AM_SEEKING_NoPositioning);

  if (NCldForms>0) and (Sets.FormType = MAIN) then
    for i:=1 to NCldForms do
      if not(CldForms[i].mode=Empty) and CldForms[i].Sets.ManageAllow and CldForms[i].Sets.SyncronizationAllow  then
        CldForms[i].pMediaSeeking.SetPositions(Position, AM_SEEKING_AbsolutePositioning, CldForms[i].pDuration, AM_SEEKING_NoPositioning);
end;

procedure TForm1.F_AddCldForm();
begin
  if NCldForms< MAX_CLD_FORMS then
  begin
    Inc(NCldForms);
    CldForms[NCldForms]:= TForm1.Create(Form1);
    CldForms[NCldForms].Sets.FormType:= CHILD;
    CldForms[NCldForms].Sets.SyncronizationAllow:=true;
    CldForms[NCldForms].sCheckBoxSync.Checked:=true;
    CldForms[NCldForms].sCheckBoxSync.Show;
    CldForms[NCldForms].Sets.ManageAllow:= true;
    CldForms[NCldForms].sCheckBoxManage.Checked:=true;
    CldForms[NCldForms].sCheckBoxManage.Show;
    
    
    //����������� ���������
    CldForms[NCldForms].InterfaceTRACK;
    CldForms[NCldForms].sTrackBar2.Position:=0;
    CldForms[NCldForms].sSpeedButtonImgForm.Hide;
    CldForms[NCldForms].sSpeedButtonNewForm.Hide;
    CldForms[NCldForms].sSpeedButtonKvadrator.Hide;
    CldForms[NCldForms].sSpeedButtonSaveTxt.Hide;
    CldForms[NCldForms].sLabelKvadrator.Hide;
    CldForms[NCldForms].sDecimalSpinEdit1.Hide;
    CldForms[NCldForms].sLabel10.Hide;
    CldForms[NCldForms].sLabel9.Hide;
    CldForms[NCldForms].Width:=Width;
    CldForms[NCldForms].Height:=Height;
    CldForms[NCldForms].Left:= Left+Width;
    CldForms[NCldForms].top:= top;


    CldForms[NCldForms].Show;
  end
  else ShowMessage('������� ������������ ���-�� ����');
end;



procedure TForm1.F_StepFrame(NSteps: integer);
var
   beg: int64;
   pitch: double;
   i: integer;
begin
 pitch:= sDecimalSpinEdit1.Value;
 if (mode=play) or (mode=paused) then
 begin
   pMediaSeeking.GetCurrentPosition(pCurrent);
   pMediaSeeking.GetDuration(pDuration);
   pCurrent:= pCurrent+round(10000000*pitch*NSteps);
   if pCurrent<0 then pCurrent:=0;
   pMediaSeeking.SetPositions(pCurrent, AM_SEEKING_AbsolutePositioning, pDuration, AM_SEEKING_NoPositioning);
 end;

  if (NCldForms>0) and (Sets.FormType = MAIN) then
   begin
      for i:=1 to NCldForms do
      begin
          if CldForms[i].Sets.ManageAllow and ((CldForms[i].Mode = Paused) or (CldForms[i].mode=play)) then
          begin
             CldForms[i].pMediaSeeking.GetCurrentPosition(CldForms[i].pCurrent);
             CldForms[i].pMediaSeeking.GetDuration(CldForms[i].pDuration);
             CldForms[i].pCurrent:= CldForms[i].pCurrent+round(10000000*pitch*NSteps);
             if CldForms[i].pCurrent<0 then CldForms[i].pCurrent:=0;
             CldForms[i].pMediaSeeking.SetPositions(CldForms[i].pCurrent, AM_SEEKING_AbsolutePositioning, CldForms[i].pDuration, AM_SEEKING_NoPositioning);
          end;
      end;
   end;

end;

procedure TForm1.F_ChangeSpeed(ratio: double);
var  pdRate: Double;
 i:integer;
begin
 if (mode=play) or (mode=paused)  then
 begin
  pMediaSeeking.GetRate(pdRate); //������ ������� ��������
  pMediaSeeking.SetRate(pdRate*ratio);//��������� �� �� �����������
 end;

 if (NCldForms>0) and (Sets.FormType = MAIN) then
   begin
      for i:=1 to NCldForms do
      begin
          if CldForms[i].Sets.ManageAllow and ( (CldForms[i].Mode = Paused) or (CldForms[i].mode=play)) then
          begin
             pdRate:=0;
             CldForms[i].pMediaSeeking.GetRate(pdRate); //������ ������� ��������
             CldForms[i].pMediaSeeking.SetRate(pdRate*ratio);//��������� �� �� �����������
          end;
      end;
   end;
end;

procedure TForm1.F_Syncronization;
var
  beg:int64;
  modeF: TPlayerMode;
  i:integer;
begin
 if (NCldForms>0) and (Sets.FormType = MAIN) and ((Mode = Paused) or (mode=play)) then
   begin
      modeF:=mode;
      F_Pause;
      for i:=1 to NCldForms do
      begin
          if CldForms[i].Sets.SyncronizationAllow  then
          begin
             pMediaSeeking.GetCurrentPosition(pCurrent);
             CldForms[i].pMediaSeeking.GetDuration(CldForms[i].pDuration);
             CldForms[i].pMediaSeeking.SetPositions(pCurrent, AM_SEEKING_AbsolutePositioning, CldForms[i].pDuration, AM_SEEKING_NoPositioning);
          end;
      end;
      if modeF=play then F_play;
   end;
end;



//---------------------------------------------------//
// ������� ������� �����
//---------------------------------------------------//
//---------------------------------------------------//
//---------------------------------------------------//
//---------------------------------------------------//
//---------------------------------------------------//

procedure TForm1.FormResize(Sender: TObject);
begin
{if (Width < 935) and (sPanel7.Visible = true) then
begin
  sPanel7.Visible:=false;
end;
if (Width > 935) and (sPanel7.Visible = false) then
begin
  sPanel7.Visible:=true;
end; }

//���� � ��� ����� �������� align �� Panel ��� ����� ����� ��� � ������ - (�� ������ ���� �� ������� �� ����)
if Panel1.Align = alNone then
begin
  if (panel1.Left+Panel1.Width) <= (sPanel2.Width) then    // ���� ���������� ������� ��� SMI - ��� ���� �������� ��� �� �������
  begin
     Panel1.Width:= sPanel2.Width-panel1.Left;  //-sPanel3.Width  � ��� ����
  end;
  if (panel1.Top+Panel1.Height) <= (sPanel2.Height) then
  begin
     Panel1.Height:= sPanel2.Height-panel1.Top;
  end;
end;


// �������� ������ ������������� �������
 if (mode=play) or (mode = paused) then
 begin
   pVideoWindow.SetWindowPosition(0,0,Panel1.ClientRect.Right,Panel1.ClientRect.Bottom);
 end;

//���� ������� ����� ���������� ���������� ���� � ���
if Sets.KvadratorOn then
  kvadrat(true);

end;

procedure TForm1.N2Click(Sender: TObject);
var
 j,i: Integer;
 beg: int64;
 A: array [0..MAX_CLD_FORMS] of string;
begin
 F_Pause();

 //sOpenDialog1.Options:=[ofHideReadOnly,ofEnableSizing];
 sOpenDialog1.Options := [ofAllowMultiSelect, ofFileMustExist];
 sOpenDialog1.Title  := '�������� ������';
 //������ ��� ������
 sOpenDialog1.Filter := '����� ����������� |*.mp3;*.wma;*.wav;*.vob;*.avi;*.mpg;*.mp4;*.mov;*.mpeg;*.flv;*.wmv;*.qt;|��� �����|*.*';
 //������ �������� �����
 if not sOpenDialog1.Execute then exit;
 for i:=0 to  sOpenDialog1.Files.Count-1 do
   A[i]:= sOpenDialog1.Files.Strings[i];

 F_OpenFiles(A, sOpenDialog1.Files.Count);

 i:=0;
  //�� �������� ��� ���� ������� ���������
 StringGrid1.Cells[0,i]:= '���';
 StringGrid1.Cells[1,i]:= '���';
 StringGrid1.Cells[2,i]:= '���';
 StringGrid1.Cells[3,i]:= '����';
 StringGrid1.Cells[4,i]:= '����';
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  A: array [0..MAX_CLD_FORMS] of string;
  j,i: Integer;
begin

  //�������������� ��� ����������
  Sets:= TFormSets.Create;  //������� ��������� �����
  Titles:= TTitles.Create;  // ������� ����� ������� �����
  Zoom:= TZoom.Create;
  TxtSMIFile := TTxtSMIFile.Create;
  hr:= 1; //������ ��������� �������� ����
  FullScreen:= false; //��������� �������� � ������������� �����
  i:= 0;// ������� ����������� ������
  TrackingBarOn:= false; //��������� �������������� ����-����
  mode:= Empty;
  //���������� ��� ���������� � ���������� ������
  pGraphBuilder        := nil; //��� ����
  pMediaControl        := nil; //���������� ������
  pMediaEvent          := nil; //���������� �������
  pVideoWindow         := nil; //������ ���� ��� ������
  pMediaSeeking        := nil; //������� ������������
  pBasicAudio          := nil; //���������� ������
  //���������� ��� ������� Excel
  PixelsPerPoint    := 0;
  XL_Open           := false;
  CoInitialize(nil);// ���������������� OLE

  Caption:= '���������� �����';// PROG_CAPTION + ' ' + VERSION;
  LabelProgInfo.Caption := 'Ver. ' + VERSION;
  if ParamCount > 0 then
  begin
    //F_Pause();
    sLabelFileName.Caption := '���� �����������...';
    TimerOpenFile.Enabled := true;
    //F_Pause();
  end;
end;



procedure TForm1.FormDestroy(Sender: TObject);
begin
   CoUninitialize;// ������������������ OLE
end;


// ��������� �������������� ����-����
procedure TForm1.sTrackBar1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   MousePos: integer;
begin
   if (mode=play) or (mode=paused) then begin
     TrackingBarOn := true;
     MousePos:= Round((X-13)/((strackbar1.Width-27)/strackbar1.Max));
     if MousePos<0 then MousePos:=0;
     if MousePos>STrackbar1.Max then MousePos:= sTrackBar1.Max;
     sTrackbar1.Position := mousePos;
   end;
end;

procedure TForm1.sTrackBar1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if (mode=play) or (mode=paused) then begin
    TrackingBarOn := false;
    if mode = play  then  pMediaControl.Run;
   end;
end;


procedure TForm1.sTrackBar1Change(Sender: TObject);
var
  p: real;
  beg: int64;
begin
  if (mode=play) or (mode=paused) then begin
  //if hr = 0 then  begin
    if TrackingBarOn then
     begin
        beg:= Round((pDuration/STrackbar1.Max)*sTrackBar1.Position);
        F_SetPosition(beg);
     end;
  //end;
  end;
  
end;


procedure TForm1.sSpeedButtonPlayClick(Sender: TObject);
begin
  F_play();
  F_Syncronization;
end;

procedure TForm1.sSpeedButtonPauseClick(Sender: TObject);
begin
  F_pause();
  F_Syncronization;
end;


procedure TForm1.sSpeedButtonStopClick(Sender: TObject);
begin
  F_stop;
end;

procedure TForm1.sSpeedButtonDecClick(Sender: TObject);
begin
  F_ChangeSpeed(0.5);
  F_Syncronization;
end;

procedure TForm1.sSpeedButtonIncClick(Sender: TObject);
begin
  F_ChangeSpeed(2);
  F_Syncronization;
end;

procedure TForm1.sSpeedButtonOpenClick(Sender: TObject);
begin
  N2Click(sSpeedButtonOpen);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
TrackLen, TrackPos: Double;
ValPos: Double;
ValLen: Double;
plVolume:Longint;
db  : integer;
pdRate: Double;
TN:int64; // ����� ������ �����

  H, M, S, MS: Integer;
  sH, sM, sS, sMS: String;

  tmp: int64;
  time_re: int64;
begin
//������� �����
//sLabel4.Caption:=TimeToStr(SysUtils.Time);
//��������� ����� ���������������, ���� �� Play �� �������
if hr <> 0 then Exit;
//������ ������� ��������
pMediaSeeking.GetRate(pdRate);
//������� �������� ���������������
sLabel6.caption:= FloatToStrF(pdRate,ffGeneral,3,1);
//����� ������������ ������
//��������� ��� ����� ������ � ��������
pMediaSeeking.GetDuration(pDuration);
//��������� ������� ������ ������ �� ������ ���������������
pMediaSeeking.GetCurrentPosition(pCurrent);
//������ ������� ����-����
//������ ������� ��������� ProgressBar

TrackBarInch:= round(pDuration/2000);              //sTrackBar1.Max:=round(pDuration/1000000);
sTrackBar1.Position:=Round(pCurrent/TrackBarInch);

//���� ����� ���������� - �������
if pCurrent=pDuration then  exit;


//��������� ���������, ��������� �������� �� -10000 �� 0
//� ��������� ��� ����� ������������� ���� �������� ������� ������������ ������ � ����� �����
//pBasicAudio.put_Volume(TrackBar1.Position*100-10000);

//��� ���� ������� ������������� ���������. ����� ������� ������������� �����
plVolume:= (65535 * sTrackBar2.Position*5) div 100;
//��������� �������������� ������ ���������
db:= trunc(33.22 * 100 * ln((plVolume+1e-6)/65535)/ln(10));
if db< -10000 then db:=-9999;
pBasicAudio.put_Volume(db);



 //������ ���������� �������
   TimeConvertForTimers(pCurrent,sH,sM,sS,sMS);
   sLabel1.Caption:= sH+ ':'+sM+ ':'+sS+ '.'+sMS;

   TimeConvertForTimers(pDuration,sH,sM,sS,sMS);
   sLabel2.Caption:=  sH+ ':'+sM+ ':'+sS+ '.'+sMS;

 if (mode = play) and (sSpeedButtonPlay.Visible = true) then
 begin
  sSpeedButtonPlay.Visible := false;
  sSpeedButtonPause.Visible := true;
 end;

 if (mode = paused) and (sSpeedButtonPause.Visible = true) then
 begin
  sSpeedButtonPause.Visible := false;
  sSpeedButtonPlay.Visible := true;
 end;

 if (mode = stop) and (sSpeedButtonPlay.Visible = false) then
 begin
  sSpeedButtonPause.Visible := false;
  sSpeedButtonPlay.Visible := true;
 end;

  // ������������ ������
  if sets.FormType = MAIN then
  begin
    if Titles.STATE then
    begin
       TN:=1;
       TN:=Titles.NumTitleRec(trunc(pCurrent/10000));
       sLabelTitles.Caption:= XText[TN];
    end;
  end;


end;

Procedure TForm1.TimeConvertForTimers(pCurrentTime: int64;
                                      var sH:String;
                                      var sM:string;
                                      var sS:string;
                                      var sMS:string);
var
   H,M,S,MS,tmp: int64;
begin
tmp:= round(pCurrentTime/10000);
   //� ��������������� ��������� ����, ������ ������� � ����
   H:= tmp div 3600000;
   tmp:= tmp - (H*3600000);
   M:= tmp div 60000;
   tmp:= tmp - (M*60000);
   S:= tmp div 1000;
   tmp:= tmp - (S*1000);
   MS:= tmp;

   if H>=10 then sH := IntToStr(H)
   else sH := IntToStr(H);
   if M>=10 then sM := IntToStr(M)
   else sM := '0'+IntToStr(M);
   if S>=10 then sS := IntToStr(S)
   else sS := '0'+IntToStr(S);
   if MS>=100 then sMS := IntToStr(MS)
   else
   begin
    if MS>=10 then sMS := '0'+IntToStr(MS)
    else sMS := '00'+IntToStr(MS);
   end;
end;


function TForm1.FindEmptyString(SG :TStringGrid): Integer;
var i : integer;
begin
Result:=-1;
  for i := 0 to sg.RowCount do
  begin
    if (SG.Cells[0,i]='') then
    begin
      Result:= i;

      break;
    end;
  end;

end;



//���������� ������� ����� � �������
procedure TForm1.RecordCurTimeInGrid(CurRow: Integer; Zone:String; SG: TStringGrid);
var
  H, M, S, MS: Integer;
  tmp: int64;
  time_re: int64;
begin
   time_re:=-1;
   //��������� ������� ������� � ������  � ��������
   pMediaSeeking.GetCurrentPosition(pCurrent);
   tmp:= round(pCurrent/10000);
   //��������� �� ����������  � ����������
   if CurRow> 1   then
   time_re:= StrToInt(SG.Cells[0,CurRow-1])*3600000 +
         StrToInt(SG.Cells[1,CurRow-1])*60000 +
         StrToInt(SG.Cells[2,CurRow-1])*1000 +
         StrToInt(SG.Cells[3,CurRow-1]);
   if time_re = tmp then
   begin
     CurRow := CurRow-1;
     SG.Row:= CurRow;
   end;
   if  (time_re > tmp) and (CurRow > 1) then
   begin
     pMediaControl.Pause;
     ShowMessage('����� � ���������� ������ �� ����� ���� ������ ������� � ���������');
     //pMediaControl.Run;
     exit;
   end;
   //� ��������������� ��������� ����, ������ ������� � ����
   H:= tmp div 3600000;
   tmp:= tmp - (H*3600000);
   M:= tmp div 60000;
   tmp:= tmp - (M*60000);
   S:= tmp div 1000;
   tmp:= tmp - (S*1000);
   MS:= tmp;


   //������ ��� � �������������� ������ �����������
   SG.Cells[0,CurRow] := IntToStr(H);
   SG.Cells[1,CurRow] := IntToStr(M);
   SG.Cells[2,CurRow] := IntToStr(S);
   SG.Cells[3,CurRow] := IntToStr(MS);
   SG.Cells[4,CurRow] := Zone;


end;



//��������� ���� ����� �� �������� ������ �� ������ �����
procedure TForm1.Panel1DblClick(Sender: TObject);
begin
//  N2Click(Panel1);
sSpeedButtonInterface.Click;
end;

//������� ������ �� ���������� �����������
{procedure TForm1.DeleteARow(Grid: TStringGrid;
  ARow: Integer);
begin


  TMyGrid(Grid).DeleteRow(ARow);
end; }



procedure TForm1.sSpeedButtonNextFrameClick(Sender: TObject);
begin
 F_StepFrame(1);
end;

procedure TForm1.sSpeedButtonPrevFrameClick(Sender: TObject);
begin
 F_StepFrame(-1);
end;






procedure TForm1.sTrackBar1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
   MousePos:integer;
   TrackBarPosX: integer;
   beg: int64;
     H, M, S, MS: Integer;
  sH, sM, sS, sMS: String;
  MiniWndCoord:TPoint;
begin



    beg:=0;
    MiniWndCoord.X:= 100;
    MiniWndCoord.Y:= 100;


   if (Y>14) and (Y<38) and (X>10) and (X<sTrackBar1.Width-14) then
   begin

     if (mode=play) or (mode=paused) then begin
        if TrackingBarOn then
        begin

          beg:= Round((pDuration/STrackbar1.Max)*sTrackBar1.Position);
          //������������ ����� � ������� ��� �� ��������
          TimeConvertForTimers(beg,sH,sM,sS,sMS);
          Panel2.Show;
          Panel2.left:= X-round(Panel2.width/2);
          Panel2.Caption:= sH+ ':'+sM+ ':'+sS+ '.'+sMS;
        end
        else
        begin
          TrackBarPosX:= Round((sTrackbar1.Position)/(strackbar1.Max/(strackbar1.Width-27)));
          MousePos:= Round((X-13)/((strackbar1.Width-27)/strackbar1.Max));
          if MousePos<0 then MousePos:=0;
          if MousePos>STrackbar1.Max then MousePos:= sTrackBar1.Max;
          //��������� ��� ����� ������ � ��������
          pMediaSeeking.GetDuration(pDuration);
          //��������� ������� ������ ������ �� ������ ���������������
          pMediaSeeking.GetCurrentPosition(pCurrent);
          //������ ������� ����-����
          //������ ������� ��������� ProgressBar
          beg:= Round((pDuration/STrackbar1.Max)*MousePos);
          //������������ ����� � ������� ��� �� ��������
          TimeConvertForTimers(beg,sH,sM,sS,sMS);
          Panel2.Show;
          Panel2.left:= X-round(Panel2.width/2);
          Panel2.Caption:= sH+ ':'+sM+ ':'+sS+ '.'+sMS;
        end;

       if MiniViewForm.Ready then
       begin
          MiniWndCoord.X:= Form1.Left+sPanel3.Left+sPanel1.Left+Panel2.Left;
          MiniWndCoord.Y:= Form1.Top+sPanel3.top+sPanel1.top-MiniViewForm.Height-20;
          MiniViewForm.VideoGoGo(beg,MiniWndCoord);
       end;
     end;

   end
   else
   begin
    panel2.Hide;
    MiniViewForm.Hide;
   end;

 //panel3.Show;
 //Panel3.Caption:= intToStr(MousePos) + '  ' + intToStr(sTrackBar1.Position)  + '  X=' + inttostr(X);


end;

procedure TForm1.Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Panel2.Hide;
end;



procedure TForm1.sSpeedButtonExcelOpenClick(Sender: TObject);
var
    Res: HResult;
    openDialog : TOpenDialog;
    filename: string;
begin
 try
  openDialog := TOpenDialog.Create(self);
  openDialog.InitialDir := GetCurrentDir;
  openDialog.Options := [ofFileMustExist];
  openDialog.Filter := '���� Excel ��� ��������� �����|*.xlsm';
  if not openDialog.Execute then exit;

  Excel := CreateOleObject('Excel.Application');
  Excel.Workbooks.Open(openDialog.FileName);
  openDialog.Free;
  Excel.Visible := true;
  Excel.UserControl := True;

  WkSheet := Excel.Worksheets.Item['��������'];
  WkSheet.Select;
  PixelsPerPoint:= Excel.DefaultWebOptions.PixelsPerInch/72;
  Excel.WindowState := -4143;
  ExcelOpening;
 except

 end;

end;



procedure TForm1.ExcelOpening;
begin
  XL_Open:= true;
  sLabelExcelConnect.Caption := '���� ����� � Excel';
  TimerSendToExcel.Enabled := True;
end;
procedure TForm1.ExcelClosing;
begin
  XL_Open:= false;
  sLabelExcelConnect.Caption := '��� ����� � Excel';
  TimerSendToExcel.Enabled := false;
end;


procedure TForm1.sSpeedButtonTimeSendClick(Sender: TObject);
begin
   Excel.Run ('WriteTime', sLabel1.caption);
end;

procedure TForm1.sSpeedButtonTimeSend2Click(Sender: TObject);
begin
   Excel.Run ('WriteTime2', sLabel1.caption);
end;

procedure TForm1.SendStateToExcel;
begin
      Try
      case mode of
        paused: Excel.Run ('CurModeReceive', 'Paused');
        stop: Excel.Run ('CurModeReceive', 'Stop');
        play: Excel.Run ('CurModeReceive', 'Play');
      end;

    except

    end;
    try
      //if mode = play then
     // begin
          Excel.Run ('CurTimeReceive', sLabel1.caption);
           Excel.Run ('CurSpeedReceive', sLabel6.caption);
          Excel.Run ('CurTimePitchReceive', sDecimalSpinEdit1.Text);
     // end;
    except
    end;
end;

procedure TForm1.TimerSendToExcelTimer(Sender: TObject);
begin
    if sCheckBoxExcelSync.Checked then  SendStateToExcel;
end;


procedure TForm1.MessageReceiver(var msg: TMessage);
 var
   txt: PChar;
   _mode: TPlayerMode;
   beg: int64;
   tmpTime: int64;
 begin
   _mode:= mode;
   case msg.LParam of
     34: begin

            if _mode = play then begin
                                F_pause();
                                F_Syncronization;
                                end;
            if _mode = paused then begin
                                F_play();
                                F_Syncronization;
                                end;
         end;
     35: sSpeedButtonPause.OnClick(Form1);
     36: sSpeedButtonStop.OnClick(Form1);
     37: sSpeedButtonDec.OnClick(Form1);
     38: sSpeedButtonInc.OnClick(Form1);
     39: sSpeedButtonPrevFrame.OnClick(Form1);
     40: sSpeedButtonNextFrame.OnClick(Form1);
     41: sSpeedButtonOpen.OnClick(Form1);
     42: sSpeedButtonTimeSend.OnClick(Form1);
     43: sSpeedButtonTimeSend2.OnClick(Form1);
     44: sDecimalSpinEdit1.Value := sDecimalSpinEdit1.Value + sDecimalSpinEdit1.Increment;
     45: sDecimalSpinEdit1.Value := sDecimalSpinEdit1.Value - sDecimalSpinEdit1.Increment;
     46: ExcelClosing;

     else begin end;
   end;
   if msg.LParam = 47 then
   begin
       tmpTime:= msg.WParam;
       beg:= tmpTime*10000;
        F_SetPosition(beg);
    //  sLabel5.Caption:= IntToStr(msg.WParam);
   end;

   case msg.LParam of
     34,35,36,37,38,39,40,41,42,43,44,45: begin ExcelOpening; SendStateToExcel;end;
   end;

end;


procedure TForm1.StringGrid1DblClick(Sender: TObject);
//�������� ��� ��������� ����� �������������� ����� �� �������� ������
  {with StringGrid1 do
  begin
    if goRowSelect in Options then
    begin
      Options:= Options+[goEditing]-[goRowSelect];
    end
    else
    begin
      Options:= Options-[goEditing]+[goRowSelect];
    end;
  end;}
var
    begStrGrd: int64;
    d:double;
    d1:double;
    d2:double;
    d3:double;
   h,m,s,ms:int64;
   bH,bM,bS,bMS:boolean;
begin
 begStrGrd:=-1;
//��������� ���� �� ���������������
 if (mode=play) or (mode=paused) then
 begin
   bH := TryStrToInt64(stringgrid1.cells[0,stringgrid1.row],h);
   bM := TryStrToInt64(stringgrid1.cells[1,stringgrid1.row],m);
   bS := TryStrToInt64(stringgrid1.cells[2,stringgrid1.row],s);
   bMS := TryStrToInt64(stringgrid1.cells[3,stringgrid1.row],ms);

     if bH and bM and bS and bMS then
     begin

         d1 := h*3600000;
         d2 := m*60000;
         d3 := s*1000;
       // d:=10000*( d1+ d2 + d3  +  ms);
        d:=10000*( h*3600000+ m*60000 + s*1000  +  ms);
        begStrGrd:= round(d);
        if begStrGrd>=0 then
        begin
          if mode=play then
          begin
            f_pause;
            pMediaSeeking.GetDuration(pDuration);
            pMediaSeeking.SetPositions(begStrGrd, AM_SEEKING_AbsolutePositioning,
                                     pDuration, AM_SEEKING_NoPositioning);
            f_play;
          end
          else
          begin
            pMediaSeeking.GetDuration(pDuration);
            pMediaSeeking.SetPositions(begStrGrd, AM_SEEKING_AbsolutePositioning,
                                     pDuration, AM_SEEKING_NoPositioning);
          end;
        end;
     end;


   
 end;
end;









//��������� ������ "����� ���� txt"
procedure TForm1.sButton13Click(Sender: TObject);
var
  CurRow, i, NRows: integer;
  temp:Word;
begin
  If HaveDataInStrGrd then
  begin
      StringGrid1.Row := 1;
      temp:=MessageBox(handle, PChar('�� ������ ������� ������������ ����� ������. ���������� ��������?'), PChar('�������� ������')
                         , MB_YESNO+MB_ICONQUESTION);
      if temp = idNo then exit;
      If temp = idYes then
      begin
        CurRow:=StringGrid1.Row;
        NRows:= StringGrid1.RowCount;// FindEmptyString(StringGrid1);
        for i:= CurRow to NRows-1 do
        begin
          DeleteRowStrGrd(StringGrid1,CurRow);
        end;
        if curRow>15 then StringGrid1.Row:=CurRow-10;
        StringGrid1.Row:=CurRow;

      end;
  end;
  TxtSMIFile.NewFile;
end;

//��������� ������ "���������"
procedure TForm1.sButton11Click(Sender: TObject);
begin
   TxtSMIFile.SaveExistingFile;
end;



procedure TForm1.ClearStrGrd;

begin
   StringGrid1.Row:=1;
   Form1.sSpeedButtonStrDownDelClick(Form1);
End;

function TForm1.HaveDataInStrGrd(): boolean;
var i,j: integer;
  data: string;
  Res: boolean;
begin
  Res:=false;
  for i := 1 to Form1.StringGrid1.RowCount do
  begin
    data:='';
    for j:= 0 to 4 do
    begin
      data:= data+ StringGrid1.Cells[j,i];
    end;

    if data <> '' then
    Res:= true;
    break;
  end;
  Result:=Res;
end;



procedure TForm1.AddInStrGrd(StrGrd:TStringGrid; S:String);
var
  CurRow: Integer;
begin
   if not TxtSMIFile.MainFile.IsFileOpen then begin ShowMessage ('������� �������� ����� ����'); Exit; end;

   if hr <>0 then Exit;
   StrGrd.RowCount:= StrGrd.RowCount+1;
   CurRow:= FindEmptyString(StrGrd);
   if CurRow > 0 then StrGrd.Row:= CurRow;
   RecordCurTimeInGrid(CurRow,S,StrGrd);

   TxtSMIFile.SaveOnlyLogFile;
end;

procedure TForm1.sButton1Click(Sender: TObject);
begin AddInStrGrd(StringGrid1,'1');
end;

procedure TForm1.sButton2Click(Sender: TObject);
begin AddInStrGrd(StringGrid1,'2');
end;

procedure TForm1.sButton3Click(Sender: TObject);
begin AddInStrGrd(StringGrid1,'3');
end;

procedure TForm1.sButton4Click(Sender: TObject);
begin AddInStrGrd(StringGrid1,'4');
end;

procedure TForm1.sButton5Click(Sender: TObject);
begin AddInStrGrd(StringGrid1,'5');
end;

procedure TForm1.sButton6Click(Sender: TObject);
begin AddInStrGrd(StringGrid1,'6');
end;

procedure TForm1.sButton7Click(Sender: TObject);
begin AddInStrGrd(StringGrid1,'7');
end;

procedure TForm1.sButton8Click(Sender: TObject);
begin AddInStrGrd(StringGrid1,'8');
end;

procedure TForm1.sButton9Click(Sender: TObject);
begin AddInStrGrd(StringGrid1,'9');
end;

procedure TForm1.sButton0Click(Sender: TObject);
begin AddInStrGrd(StringGrid1,'0');
end;

procedure TForm1.sButtonQClick(Sender: TObject);
begin AddInStrGrd(StringGrid1,'q');
end;

procedure TForm1.sButtonWClick(Sender: TObject);
begin AddInStrGrd(StringGrid1,'w');
end;

procedure TForm1.sButtonEClick(Sender: TObject);
begin AddInStrGrd(StringGrid1,'e');
end;

procedure TForm1.sButtonRClick(Sender: TObject);
begin AddInStrGrd(StringGrid1,'r');
end;

procedure TForm1.sButtonTClick(Sender: TObject);
begin AddInStrGrd(StringGrid1,'t');
end;

procedure TForm1.sButtonYClick(Sender: TObject);
begin AddInStrGrd(StringGrid1,'y');
end;

procedure TForm1.sButtonUClick(Sender: TObject);
begin AddInStrGrd(StringGrid1,'u');
end;

procedure TForm1.sButtonIClick(Sender: TObject);
begin AddInStrGrd(StringGrid1,'i');
end;

procedure TForm1.sButtonOClick(Sender: TObject);
begin AddInStrGrd(StringGrid1,'o');
end;

procedure TForm1.sButtonPClick(Sender: TObject);
begin AddInStrGrd(StringGrid1,'p');
end;









procedure TForm1.sButton10Click(Sender: TObject);
var
    f : TextFile;
    txtFilename, StrForFile, s, s_tmp: string;
    i, j, Nrows, N, len: integer;
    sep: string;
begin
txtSMIFile.OpenFile;

end;

procedure TForm1.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var
 p : double;
begin

if (Msg.message = WM_MOUSEWHEEL)  then
begin
      if (HiWord (Msg.wParam) > 32512) then
      begin
        if  ((Mouse.CursorPos.X - Form1.Left)>sPanel2.Width) then
        begin
          Form1.NextRowSelectedStrGrd(Form1.StringGrid1,1);
        end
        else
        begin
          if (Mode = play ) or (mode = paused) then
          begin
            Zooming(Mouse.CursorPos,0.90909090);
          end;
        end;
      end
      else
      begin
        if  ((Mouse.CursorPos.X - Form1.Left)>sPanel2.Width) then
        begin
          Form1.NextRowSelectedStrGrd(Form1.StringGrid1,-1);
        end
        else
        begin
          if (Mode = play ) or (mode = paused) then
          begin
            Zooming(Mouse.CursorPos,1.1);
          end;
        end;
      end;
     //   Zooming(Mouse.CursorPos,1.1);
      Msg.message := WM_NULL;
end;

if (Msg.message = WM_KEYDOWN) and (Sets.FormType=MAIN) then //and (goEditing in StringGrid1.Options) then
  begin
    if Msg.wParam = 32 then        //������
    begin
       if mode = play then sSpeedButtonPauseClick(Panel1)
       else   if mode = paused then sSpeedButtonPlayClick(Panel1);
       ApplicationEvents1.CancelDispatch;
       handled:=true;
    end;
    if Msg.wParam = 39 then        //=>
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sSpeedButtonNextFrameClick(ApplicationEvents1);
    end;
    if Msg.wParam = 37 then        //<=
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sSpeedButtonPrevFrameClick(ApplicationEvents1);
    end;
    if Msg.wParam = 38 then        //������� �����
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sSpeedButtonIncClick(ApplicationEvents1);
    end;
    if Msg.wParam = 40 then        //������� ����
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sSpeedButtonDecClick(ApplicationEvents1);
    end;

    if (Msg.wParam = 96) or (Msg.wParam = 48) then        //0
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButton0Click(ApplicationEvents1);
    end;
    if (Msg.wParam = 97) or (Msg.wParam = 49)  then        //1
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButton1Click(ApplicationEvents1);
    end;
    if (Msg.wParam = 98) or (Msg.wParam = 50)  then        //2
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButton2Click(ApplicationEvents1);
    end;
    if (Msg.wParam = 99) or (Msg.wParam = 51)  then        //3
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButton3Click(ApplicationEvents1);
    end;
    if (Msg.wParam = 100) or (Msg.wParam = 52)  then        //4
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButton4Click(ApplicationEvents1);
    end;
    if (Msg.wParam = 101) or (Msg.wParam = 53)  then        //5
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButton5Click(ApplicationEvents1);
    end;
    if (Msg.wParam = 102) or (Msg.wParam = 54)  then        //6
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButton6Click(ApplicationEvents1);
    end;
    if (Msg.wParam = 103) or (Msg.wParam = 55)  then        //7
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButton7Click(ApplicationEvents1);
    end;
    if (Msg.wParam = 104) or (Msg.wParam = 56)  then        //8
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButton8Click(ApplicationEvents1);
    end;
    if (Msg.wParam = 105) or (Msg.wParam = 57)  then        //9
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButton9Click(ApplicationEvents1);
    end;
    if (Msg.wParam = Ord('Q'))  then                        //Q
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButtonQClick(ApplicationEvents1);
    end;
    if (Msg.wParam = Ord('W'))  then                        //W
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButtonWClick(ApplicationEvents1);
    end;
    if (Msg.wParam = Ord('E'))  then                        //E
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButtonEClick(ApplicationEvents1);
    end;
    if (Msg.wParam = Ord('R'))  then                        //R
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButtonRClick(ApplicationEvents1);
    end;
    if (Msg.wParam = Ord('T'))  then                        //T
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButtonTClick(ApplicationEvents1);
    end;
    if (Msg.wParam = Ord('Y'))  then                        //Y
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButtonYClick(ApplicationEvents1);
    end;
    if (Msg.wParam = Ord('U'))  then                        //U
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButtonUClick(ApplicationEvents1);
    end;
    if (Msg.wParam = Ord('I'))  then                        //I
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButtonIClick(ApplicationEvents1);
    end;
    if (Msg.wParam = Ord('O'))  then                        //O
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButtonOClick(ApplicationEvents1);
    end;
    if (Msg.wParam = Ord('P'))  then                        //P
    begin
       ApplicationEvents1.CancelDispatch;
       handled:=true;
       sButtonPClick(ApplicationEvents1);
    end;


  end;
end;

































procedure TForm1.sSpeedButtonImgFormClick(Sender: TObject);
var
 FileImgName: string;
begin

sOpenPictureDialog1.Title  := '�������� �����������';
//������ ��� ������
sOpenPictureDialog1.Filter := '����� ����������� |*.bmp;*.jpg;|��� �����|*.*';
//������ �������� �����
 if not sOpenPictureDialog1.Execute then exit;
 FileImgName:=sOpenPictureDialog1.FileName;
 FormIMG.Show;
 FormIMG.sImage1.Picture.LoadFromFile(FileImgName);
end;

procedure TForm1.sSpeedButtonNewFormClick(Sender: TObject);
begin
  F_AddCldForm();
end;





procedure TForm1.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Panel1MovingFlag:=true;
MousePos.X:=X;
MousePos.Y:=Y;
panel1.Align:= alNone;
screen.Cursor:= crHandPoint;
//timer3.Enabled:= true;

end;

procedure TForm1.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var newleft,newtop:integer;
begin
  Panel2.Hide;
  if Panel1MovingFlag then
  begin
    newleft:= Panel1.Left+X-MousePos.X;
    newtop:=Panel1.Top+Y-MousePos.Y;
    if (newleft<=0) and (newleft + panel1.Width >= sPanel2.Width) then
    Panel1.Left:=newleft;
    if (newtop<=0) and (newtop + panel1.Height >= (sPanel2.Height)) then
    Panel1.Top:=newtop;

 end;
 panel1.Refresh;
 panel1.Repaint;
end;

procedure TForm1.Panel1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Panel1MovingFlag:=false;
screen.Cursor:= crDefault;
 panel1.Refresh;
 panel1.Repaint;
//timer3.Enabled:= false;
end;



procedure TForm1.sPanel3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Panel2.Hide;
end;

procedure TForm1.sSpeedButtonKvadratorClick(Sender: TObject);
var i:integer;
begin
  Kvadrat(false);
end;

procedure TForm1.Kvadrat(ForceStart:boolean);
var i, x, y :integer;

begin

  if (sets.KvadratorOn) and (not ForceStart) then
  begin
    sLabelKvadrator.Caption:='OFF';
    Sets.KvadratorOn:= false;
    exit;
  end;


  if Sets.FormType = CHILD then exit; //������� ��������� ����� ������ ����� MAIN
  if NCldForms<3 then
  begin
    ShowMessage('������ ���� 4 ����');
    exit;
  end;

  sLabelKvadrator.Caption:='ON';
  Sets.KvadratorOn:= true;

  x:= Left+Width;
  y:= Top+Height;
  CldForms[1].Top:=0;
  CldForms[1].Left:=0;
  CldForms[1].Width:=round(x/2);
  CldForms[1].Height:=round(y/2);

  CldForms[2].Top:=0;
  CldForms[2].Left:=round(x/2);
  CldForms[2].Width:=round(x/2);
  CldForms[2].Height:=round(y/2);

  CldForms[3].Top:=round(y/2);
  CldForms[3].Left:=0;
  CldForms[3].Width:=round(x/2);
  CldForms[3].Height:=round(y/2);

  Top:=round(y/2);
  Left:=round(x/2);
  Width:=round(x/2);
  Height:=round(y/2);

  {CldForms[1].Activate;
  CldForms[1].Repaint;
  CldForms[2].Repaint;
  CldForms[3].Repaint;
  Repaint;
  Refresh;
  Activate;
  Repaint;
  Refresh;}


end;



{procedure TForm1.sSpeedButtonSaveTxtClick(Sender: TObject);
begin
  TxtSMIFile.NewFile;;
end;
 }
procedure TForm1.sSpeedButtonInterfaceClick(Sender: TObject);
begin
  if Sets.InterfaceMode = MAX then
  begin
    //InterfaceNOMENU;
    InterfaceTRACK;
    Exit;
  end;
  {if Sets.InterfaceMode = NOMENU then
  begin
    InterfaceTRACK;
    Exit;
  end;}
  if Sets.InterfaceMode = TRACK then
  begin
    InterfaceMIN;
    Exit;
  end;
  if Sets.InterfaceMode = MIN then
  begin
    InterfaceMAX;
    Exit;
  end;
end;

procedure TForm1.InterfaceMAX;
begin
    sPanel1.Height:= 85;
    sPanel3.Height:= 59;
    sPanel6.Height:= 45;
    MainMenu1.AutoMerge:=false;
    OnResize(Self);
    Sets.InterfaceMode:= MAX;
end;

procedure TForm1.InterfaceNOMENU;
begin
    sPanel1.Height:= 85;
    sPanel3.Height:= 59;
    sPanel6.Height:= 45;
    MainMenu1.AutoMerge:=true;
    OnResize(Self);
    Sets.InterfaceMode:= NOMENU;
end;

procedure TForm1.InterfaceTRACK;
begin
    sPanel1.Height:= 46;
    sPanel3.Height:= 0;
    sPanel6.Height:= 0;
    MainMenu1.AutoMerge:=true;
    OnResize(Self);
    Sets.InterfaceMode:= TRACK;
end;

procedure TForm1.InterfaceMIN;
begin
    sPanel1.Height:= 0;
    sPanel3.Height:= 0;
    sPanel6.Height:= 0;
    MainMenu1.AutoMerge:=true;
    OnResize(Self);
    Sets.InterfaceMode:= MIN;
end;

// ������� �������������� � ������������ ����� (���������� ��������� ���������)
procedure TForm1.WMSysCommand;
begin
  case Msg.CmdType of
  SC_MINIMIZE:
    begin

    end;
  SC_MAXIMIZE:
    begin
      if Sets.FormType = MAIN then
      begin
        Sets.KvadratorOn:= false;
        sLabelKvadrator.Caption:='OFF';
      end;

    end;

  end;
  inherited;
end;








procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if Sets.FormType = MAIN then
    F_Syncronization
  else
    Timer2.Enabled:= false;
end;



procedure TForm1.sCheckBoxManageClick(Sender: TObject);
begin
  sets.ManageAllow:=sCheckBoxManage.Checked;
end;

procedure TForm1.sCheckBoxSyncClick(Sender: TObject);
begin
   sets.SyncronizationAllow:= sCheckBoxSync.Checked;
end;

procedure TForm1.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin

  if (Mode = play ) or (mode = paused) then
  begin
    Zooming(MousePos,0.90909090);
  end;
end;

procedure TForm1.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if (Mode = play ) or (mode = paused) then
  begin
   Zooming(MousePos,1.1);
  end;
end;

procedure TForm1.Zooming(MousePos: TPoint; K:Double);

Var
  Pxy1, Pxy2:TPoint; //��������� ������ �������� � ������� ������� ���� Panel1(������ �����)
                    //������������ ���� ������
  M:TPoint;       // ��������� ��������� ���� ������������ ������� ���� Panel1
  ResRect,Pan,Wnd:TRect;  // // ������� ������������� ������� ���� �����������(Panel1) � ��� �������� � ����������� ��� ��������
begin
   Pxy1.X:=Left+sPanel2.Left+Panel1.Left;
   Pxy1.Y:=Top+sPanel2.Top+Panel1.Top;
   Pxy2.X:=Pxy1.X + panel1.Width;
   Pxy2.Y:=Pxy1.Y + panel1.Height;

   M.X:= MousePos.X -(Left+sPanel2.Left);
   M.Y:= MousePos.Y -(Top+sPanel2.Top);

   Pan.Left:= Panel1.Left;
   Pan.Right:= Panel1.Left + Panel1.Width;
   Pan.Top:= Panel1.Top;
   Pan.Bottom:= Panel1.Top + Panel1.Height;

   Wnd.Left:= sPanel2.Left;
   Wnd.Right:= sPanel2.Left + sPanel2.Width;
   Wnd.Top:= sPanel2.Top;
   Wnd.Bottom:= sPanel2.Top + sPanel2.Height;

   if (MousePos.X>Pxy1.X) and
      (MousePos.X<Pxy2.X) and
      (MousePos.Y>Pxy1.Y) and
      (MousePos.Y<Pxy2.Y) then
      begin
        { if ( Panel1.Width < (sPanel2.Width-5)) or ( Panel1.Height < (sPanel2.Height-5))   then
         Panel1.Align:= alClient
         else
         begin}
           Panel1.Align:= alNone;
           ResRect:= Zoom.CalcRect(Pan,Wnd,M,K);

           Panel1.Width:= ResRect.Right-ResRect.Left;
           Panel1.Height:= ResRect.Bottom-ResRect.Top;
           panel1.Left:=ResRect.Left;
           panel1.top:=ResRect.Top;
           //f_pause;
         //end;

         if ( Panel1.Width < (sPanel2.Width-2)) or ( Panel1.Height < (sPanel2.Height-2))   then
         Panel1.Align:= alClient
         else  Panel1.Align:= alNone;



         if (Panel1.Left>=0) then
         Panel1.Left:=0;

         if (Panel1.Left+Panel1.Width<=sPanel2.Width) then
         Panel1.Left := sPanel2.Width - Panel1.Width;



         if (panel1.Top>=0) then
         Panel1.Top:= 0;
         if (Panel1.Top+Panel1.Height<=sPanel2.Height) then
         Panel1.Top := sPanel2.Height - Panel1.Height;


         pVideoWindow.SetWindowPosition(0,0,Panel1.ClientRect.Right,Panel1.ClientRect.Bottom); //�������
      end;
end;


procedure TForm1.sButton14Click(Sender: TObject);
begin
        { Panel1.Align:= alNone;
         Panel1.Width:= Panel1.Width +100;
         Panel1.Height:= Panel1.Height +100;

         f_pause;
         label1.Caption:= IntToStr(panel1.Width) + '  '+IntToStr(panel1.Height);

         pVideoWindow.SetWindowPosition(0,0,Panel1.Width,Panel1.Height); //�������}
end;

procedure TForm1.sSpeedButton1Click(Sender: TObject);
begin
   Panel1.Align:=alClient;
   pVideoWindow.SetWindowPosition(0,0,Panel1.ClientRect.Right,Panel1.ClientRect.Bottom);
end;




//��������� ������ "������� ������ �����"
procedure TForm1.sSpeedButtonStrDownDelClick(Sender: TObject);
var
  CurRow, i, NRows: integer;
  temp:Word;
begin
  temp:=MessageBox(handle, PChar('�� ������ ������� ������������ ����� ������. ���������� ��������?'), PChar('�������� ������')
                         , MB_YESNO+MB_ICONQUESTION);
  If temp = idYes then
  begin
    CurRow:=StringGrid1.Row;
    NRows:= StringGrid1.RowCount;// FindEmptyString(StringGrid1);
    for i:= CurRow to NRows-1 do
    begin
      DeleteRowStrGrd(StringGrid1,CurRow);
    end;
    if curRow>15 then StringGrid1.Row:=CurRow-10;
    StringGrid1.Row:=CurRow;
  end;
  if TxtSMIFile.IsDefOk then TxtSMIFile.SaveOnlyLogFile;
end;



//��������� ������ "������� ���������� ������ "
procedure TForm1.sSpeedButtonStrSelDelClick(Sender: TObject);
var
  CurRow, i, NRows: integer;
  temp:Word;
begin
  if (StringGrid1.Selection.Bottom - StringGrid1.Selection.Top) > 5 then
  temp:=MessageBox(handle, PChar('�� ������ ������� ������ 5 �����. ���������� ��������?'), PChar('�������� ������')
                         , MB_YESNO+MB_ICONQUESTION)
  else temp := idYes;

  If temp = idYes then
  begin
    CurRow:=StringGrid1.Selection.Top;
    for i:=StringGrid1.Selection.Top to StringGrid1.Selection.Bottom do
    begin
      DeleteRowStrGrd(StringGrid1,CurRow);
    end;
    if curRow>15 then StringGrid1.Row:=CurRow-10;
    StringGrid1.Row:=CurRow;
  end;
  if TxtSMIFile.IsDefOk then TxtSMIFile.SaveOnlyLogFile;
end;


//��������� ������ "������� ������"
procedure TForm1.sSpeedButtonStrDelClick(Sender: TObject);
var
 CurRow, i, NRows: integer;
begin
  CurRow:=StringGrid1.Row;
  DeleteRowStrGrd(StringGrid1,CurRow);
  if CurRow > 10 then
  begin
    StringGrid1.Row:=CurRow-10;
    StringGrid1.Row:=CurRow;
  end
  else
  begin
    StringGrid1.Row:=1;
    StringGrid1.Row:=CurRow;
  end;
  if TxtSMIFile.IsDefOk then TxtSMIFile.SaveOnlyLogFile;
end;


procedure TForm1.DeleteRowStrGrd (StrGrd: TStringGrid; CurRow:Integer);
var
  i, NRows: integer;
begin
  NRows:=  FindEmptyString(StrGrd);
  StrGrd.Cells[0,CurRow]:='';
  StrGrd.Cells[1,CurRow]:='';
  StrGrd.Cells[2,CurRow]:='';
  StrGrd.Cells[3,CurRow]:='';
  StrGrd.Cells[4,CurRow]:='';
  for i:= CurRow to StrGrd.RowCount-1 do
  begin
    StrGrd.Cells[0,i]:=StrGrd.Cells[0,i+1];
    StrGrd.Cells[1,i]:=StrGrd.Cells[1,i+1];
    StrGrd.Cells[2,i]:=StrGrd.Cells[2,i+1];
    StrGrd.Cells[3,i]:=StrGrd.Cells[3,i+1];
    StrGrd.Cells[4,i]:=StrGrd.Cells[4,i+1];
  end;
end;

// �������� ������ � StringGrid
procedure TForm1.AddRowSelectedStrGrd (StrGrd: TStringGrid; CurRow:Integer);
var
  i, NRows: integer;
begin
  CurRow:= StringGrid1.Row;
  NRows:=  StrGrd.RowCount;//FindEmptyString(StrGrd);
  i:= NRows-1;
  While i>= CurRow  do
  begin
    StrGrd.Cells[0,i+1]:=StrGrd.Cells[0,i];
    StrGrd.Cells[1,i+1]:=StrGrd.Cells[1,i];
    StrGrd.Cells[2,i+1]:=StrGrd.Cells[2,i];
    StrGrd.Cells[3,i+1]:=StrGrd.Cells[3,i];
    StrGrd.Cells[4,i+1]:=StrGrd.Cells[4,i];
    Dec(i);
  end;

  StrGrd.Cells[0,CurRow]:='';
  StrGrd.Cells[1,CurRow]:='';
  StrGrd.Cells[2,CurRow]:='';
  StrGrd.Cells[3,CurRow]:='';
  StrGrd.Cells[4,CurRow]:='';
end;

// ������� �� ��������� ������ � StringGrid
procedure TForm1.NextRowSelectedStrGrd (StrGrd: TStringGrid; Shift: Integer);
var
  i, NRows, CurRow: integer;
begin
  CurRow:= StrGrd.Row;
  NRows:=  StrGrd.RowCount;
  i:= NRows-1;
  if ((CurRow+Shift) <= i) and ((CurRow+Shift) >= 1)  then
  begin
    StrGrd.Row := StrGrd.Row+Shift;
  end;
end;

procedure TForm1.sSpeedButtonAddStrClick(Sender: TObject);
var CurRow:Integer;
begin
   CurRow:= StringGrid1.Row;
   AddRowSelectedStrGrd(StringGrid1,CurRow);
   if TxtSMIFile.IsDefOk then TxtSMIFile.SaveOnlyLogFile;
end;

procedure TForm1.E1Click(Sender: TObject);
begin
    sSpeedButtonStrDelClick(Sender);
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  sSpeedButtonStrDownDelClick(Sender);
end;

procedure TForm1.L1Click(Sender: TObject);
begin
  sSpeedButtonAddStrClick(Sender);
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  sSpeedButtonStrSelDelClick(Sender);
end;



procedure TForm1.sCheckBox1Click(Sender: TObject);
var beg:int64;
    CurMode : TPlayerMode;
begin
  CurMode := Mode;
  F_Pause;
  F_stop;
  beg:=pCurrent;
  if sCheckbox1.Checked then
    formStyle := fsStayOnTop
  else
  FormStyle := fsNormal;

  if (CurMode = play) or (CurMode = paused) or (CurMode = Stop) then
  begin
    F_OpenFiles(ArrFileNames,1);
    F_SetPosition(beg);
  end;
  F_Pause;
end;










procedure TForm1.TimerOpenFileTimer(Sender: TObject);
var
  A: array [0..MAX_CLD_FORMS] of string;
begin
    TimerOpenFile.Enabled := false;
    A[0]:= ParamStr(1);
    F_OpenFiles(A, 1);
end;

procedure TForm1.sMemoTxtDirChange(Sender: TObject);
begin
   if TxtSMIFile <>  nil then
   if TxtSmiFile.IsDefOk then sMemoTxtDir.Text:= TxtSMIFile.MainFile.FullFileName
   else  sMemoTxtDir.Text:= '��� �����';
end;



procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var r: integer;
begin
   if form1.HaveDataInStrGrd then  r := MessageDlg('� ������� ���� ������. ������� ��� ����������?',mtWarning, [mbYes, mbNo], 0);

   if r = mrNo then Action := caNone;
   if r = mrYes then Action := caFree;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  MiniViewForm.Show;
  //MiniViewForm.VideoGo;
end;

procedure TForm1.Button2Click(Sender: TObject);

begin
  eng1 := TVideoEngineDshow9.Create(Panel6.Handle);
  eng1.InitializAuto('C:\tmp\Test5.avi',Panel6.Handle, Panel6);


    eng2 := TVideoEngineDshow9.Create(Panel7.Handle);
  eng2.InitializAuto('C:\tmp\Test5.avi',Panel7.Handle, Panel7);

    eng3 := TVideoEngineDshow9.Create(Panel8.Handle);
  eng3.InitializAuto('C:\tmp\Test5.avi',Panel8.Handle, Panel8);

    eng4 := TVideoEngineDshow9.Create(Panel9.Handle);
  eng4.InitializAuto('C:\tmp\Test5.avi',Panel9.Handle, Panel9);

  eng1.Rate:=8;
  eng2.Rate:=8;
  eng3.Rate:=8;
  eng4.Rate:=8;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
          eng1.F_Play;
           eng2.F_Play;
            eng3.F_Play;
             eng4.F_Play;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
       eng1.Rate:=2;
  eng2.Rate:=2;
  eng3.Rate:=2;
  eng4.Rate:=2;
end;

end.
