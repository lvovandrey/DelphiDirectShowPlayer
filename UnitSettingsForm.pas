unit UnitSettingsForm;

interface
type
  TFormType = (MAIN, CHILD);
  TInterfaceMode = (MAX, NOMENU, TRACK, MIN);

type
  TFormSets = class (TObject)
  private

  public
    FormType: TFormType;// ��� ����� �������� ��� �������
    Top,Left,Heigth, Width: integer;  //���������� �����
    KvadratorOn:boolean;  // ������� �� ����� ����������
    InterfaceMode: TInterfaceMode;  //������� ��������� ���������� ����� - ���������� ����� ������ �����
    SyncronizationAllow: boolean;   //��������� ������������� ������
    ManageAllow: boolean;   //��������� ���������� ������ � ������� ����� MAIN
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
