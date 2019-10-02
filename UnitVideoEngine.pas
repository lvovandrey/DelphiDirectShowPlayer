unit UnitVideoEngine;
{$optimization off}
interface

//-------------------------------------------------//
//          ВИДЕО-ДВИЖОК ПЛЕЕРА                    //
//   Инкапсулирует функции и процедуры для работы с//
// видео и должен обеспечивать определенный уровень//
// абстракции для упрощения внесения изменений в   //
// механизм отображения видео.                     //
// Возможно здесь будут расположены несколько      //
// механизмов работы с видео - например с помощью  //
// библиотек DirectShow и LibVlc, а может и еще    //
// что-то.                                         //
// Это было бы не плохо поскольку обеспечило бы    //
// легкую взаимозаменяемость механизмов.           //
//-------------------------------------------------//

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DirectShow9, ActiveX, ComObj;



type
  TPlayerMode = (Stop, Play, Paused, Empty); // режим воспроизведения


  TVideoEngineDshow9 = class(TObject)
  private
      //интерфейсы для построения и управления графом
    pGraphBuilder        : IGraphBuilder       ;         //сам граф
    pMediaControl        : IMediaControl       ;         //управление графом
    pMediaEvent          : IMediaEvent         ;         //обработчик событий
    pVideoWindow         : IVideoWindow        ;         //задает окно для вывода
    pMediaSeeking        : IMediaSeeking       ;         //позиция проигрывания
    pBasicAudio          : IBasicAudio         ;         //управление звуком

    //поля для хранения данных о режиме работы
    pMode                : TPlayerMode;                  // режим воспроизведения
    pFullScreen          : boolean;                      //индикатор перехода в полноэкранный режим
    pFileName            : string;                       //поле хранит имя файла для данного экземпляра окна
    pWindowHandle        : OAHWND;                        // Дескриптор родительского окна в котором все происходит

    // Геттеры и сеттеры public-свойств
    function GetPCurrent : int64;                        //см одноименное свойство
    procedure SetPCurrent(SCurrent:int64);               //см одноименное свойство
    function GetPDuration: int64;                        //см одноименное свойство
    function GetRate: double;                            //см одноименное свойство
    procedure SetRate(SRate:double);                      //см одноименное свойство
    function GetFileName: String;                        //см одноименное свойство
    procedure SetFileName(SFileName:String);             //см одноименное свойство
    function GetMode: TPlayerMode;                       //см одноименное свойство
    function IsFullScreen: boolean;                      //см свойство FullScreen
    procedure SetFullScreenMode(FScreenMode: boolean);   //см свойство FullScreen

  public
    property pCurrent             : int64 read GetPCurrent write SetPCurrent;         // Текужее положение    в МИЛИСЕКУНДАХ
    property pDuration            : int64 read GetPDuration;                          // и длительность фильма  в МИЛИСЕКУНДАХ
    property Rate                 : double read GetRate  write SetRate;               // Скорость проигрывания фильма от 0 до бесконечности
    property FileName             : string read GetFileName write SetFileName;        // Скорость проигрывания фильма от 0 до бесконечности
    property Mode                 : TPlayerMode read GetMode;                         // режим воспроизведения
    property FullScreen           : boolean read IsFullScreen write SetFullScreenMode;//индикатор перехода в полноэкранный режим


    constructor Create(WindowHandle: OAHWND);                              //  В конструктор отсылаем информацию об окне в котором все происходит
    procedure InitializAuto(RenderedFilePath:string; OwnerHandle:OAHWND); //автоматическая инициализация всех механизмов
                                                                          //принимает строку пути к файлу
                                                                          // и Handle поверхности вывода (например Panel1.Handle)
    procedure SetWindowPosition(Left:Integer;Top:Integer;Right:Integer;Bottom:Integer); // инкапсулирует одноименную DShow процедуру
    procedure F_Play; //Запускает проигрывание файла
    procedure F_Pause; //Пауза в проигрывании файла

  end;


implementation
//-----------------------------------------------//
//   ОСНОВНЫЕ МЕТОДЫ КЛАССА TVideoEngineDshow9   //
//-----------------------------------------------//
//-----------------------------------------------//
//-----------------------------------------------//
//-----------------------------------------------//


//       КОНСТРУКТОР
constructor TVideoEngineDshow9.Create(WindowHandle: OAHWND);
begin

end;


//автоматическая инициализация всех механизмов и построение графа
procedure TVideoEngineDshow9.InitializAuto(RenderedFilePath:string; OwnerHandle:OAHWND);  //принимает строку пути к файлу  и Handle поверхности вывода (например Panel1.Handle)
var hr: HRESULT;
begin

  pMode:= Empty;
  pFullScreen:= False;
  pFileName:='';
  //pWindowHandle:= WindowHandle;
//освобождаем подключенные интерфейсы
  if Assigned(pMediaSeeking) then  pMediaSeeking := nil;
  if Assigned(pBasicAudio) then pBasicAudio  := nil;
  if Assigned(pVideoWindow) then pVideoWindow := nil;
  if Assigned(pMediaEvent) then pMediaEvent := nil;
  if Assigned(pMediaControl) then pMediaControl := nil;
  if Assigned(pGraphBuilder) then pGraphBuilder := nil;
//получаем интерфейс построения графа
  hr := CoCreateInstance(CLSID_FilterGraph, nil, CLSCTX_INPROC_SERVER, IID_IGraphBuilder, pGraphBuilder);
  if hr<>0 then begin
    ShowMessage('Не удается создать граф');
    exit;
  end;
//получаем интерфейс управления
  hr := pGraphBuilder.QueryInterface(IID_IMediaControl, pMediaControl);
  if hr<>0 then begin
    ShowMessage('Не удается получить интерфейс IMediaControl');
    exit;
  end;
//получаем интерфейс событий
   hr := pGraphBuilder.QueryInterface(IID_IMediaEvent, pMediaEvent);
   if hr<>0 then begin
    ShowMessage('Не удается получить интерфейс событий');
    exit;
  end;
//получаем интерфейс управления окном вывода видео
  hr := pGraphBuilder.QueryInterface(IID_IVideoWindow, pVideoWindow);
  if hr<>0 then begin
    ShowMessage('Не удается получить IVideoWindow');
    exit;
  end;
//получаем интерфейс управления звуком
   hr := pGraphBuilder.QueryInterface(IBasicAudio, pBasicAudio);
  if hr<>0 then begin
    ShowMessage('Не удается получить аудио интерфейс');
    exit;
  end;
//получаем интерфейс  управления позицией проигрывания
  hr := pGraphBuilder.QueryInterface(IID_IMediaSeeking, pMediaSeeking);
   if hr<>0 then begin
    ShowMessage('Не удается получить интерфейс управления позицией');
    exit;
  end;
//загружаем файл для проигрывания и АВТОМАТИЧЕСКИ СТРОИМ ГРАФ
  hr := pGraphBuilder.RenderFile(StringToOleStr(PChar(RenderedFilePath)), '');
  if hr<>0 then begin
    ShowMessage('Не удается прорендерить файл');
    exit;
  end;
//располагаем окошко с видео на панель
   pVideoWindow.Put_Owner(OwnerHandle);//Устанавливаем "владельца" окна
   pVideoWindow.Put_WindowStyle(WS_CHILD OR WS_CLIPSIBLINGS);//Стиль окна
   pVideoWindow.Put_MessageDrain(OwnerHandle);//указываем что владелец будет получать сообщения видео окна
end;


// инкапсулирует одноименную DShow процедуру  - задаем размеры области отображения
procedure TVideoEngineDshow9.SetWindowPosition(Left:Integer;Top:Integer;Right:Integer;Bottom:Integer);
begin
   pVideoWindow.SetWindowPosition(Left,Top,Right,Bottom); //размеры
end;


// Запуск проигрывания файла
procedure TVideoEngineDshow9.F_Play;
begin
  if not Assigned(pMediaControl) then exit;
  pMediaControl.Run;
  pMode:= Play;
end;
// Пауза проигрывания файла
procedure TVideoEngineDshow9.F_Pause;
begin
  if not Assigned(pMediaControl) then exit;
  pMediaControl.Pause;
  pMode:=Paused;
end;



//-----------------------------------------------//
//   ГЕТТЕРЫ И СЕТТЕРЫ СВОЙСТВ КЛАССА            //
//           TVideoEngineDshow9                  //
//-----------------------------------------------//
//-----------------------------------------------//
//-----------------------------------------------//
function TVideoEngineDshow9.GetPCurrent : int64;
begin
  result:=0;
end;


procedure TVideoEngineDshow9.SetPCurrent(SCurrent:int64);               //см одноименное свойство
var duration: int64;
begin
   duration:= pDuration;
   pMediaSeeking.SetPositions(SCurrent, AM_SEEKING_AbsolutePositioning, duration, AM_SEEKING_NoPositioning);
end;


function TVideoEngineDshow9.GetPDuration: int64;                        //см одноименное свойство
var duration: int64;
begin
  pMediaSeeking.GetDuration(duration);
  result:=duration;
end;


function TVideoEngineDshow9.GetRate: double;                            //см одноименное свойство
begin
  result:=0;
end;


procedure TVideoEngineDshow9.SetRate(SRate:double);                      //см одноименное свойство
begin
pMediaSeeking.SetRate(SRate);
end;


function TVideoEngineDshow9.GetFileName: String;                        //см одноименное свойство
begin
  result:='';
end;


procedure TVideoEngineDshow9.SetFileName(SFileName:String);             //см одноименное свойство
begin
end;


function TVideoEngineDshow9.GetMode: TPlayerMode;                       //см одноименное свойство
begin
  result:=Empty;
end;


function TVideoEngineDshow9.IsFullScreen: boolean;                      //см свойство FullScreen
begin
  result:=false;
end;


procedure TVideoEngineDshow9.SetFullScreenMode(FScreenMode: boolean);   //см свойство FullScreen
begin
end;


end.
