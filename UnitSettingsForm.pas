unit UnitSettingsForm;

interface
type
  TFormType = (MAIN, CHILD);
  TInterfaceMode = (MAX, NOMENU, TRACK, MIN);

type
  TFormSets = class (TObject)
  private

  public
    FormType: TFormType;// тип формы дочерн€€ или главна€
    Top,Left,Heigth, Width: integer;  //координаты формы
    KvadratorOn:boolean;  // включен ли режим квадратора
    InterfaceMode: TInterfaceMode;  //текущее состо€ние интерфейса формы - определ€ет какие панели видны
    SyncronizationAllow: boolean;   //поддержка синхронизации формой
    ManageAllow: boolean;   //поддержка управлени€ формой с главной формы MAIN
    constructor Create;
  end;


implementation

  constructor TFormSets.Create;
  begin
    inherited;
    FormType:= MAIN;
    InterfaceMode:=MAX;
    KvadratorOn:=false;
    SyncronizationAllow:= false;
    ManageAllow:= false;

  end;
end.
