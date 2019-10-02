unit UnitImgForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, acImage, sPanel;

type
  TFormIMG = class(TForm)
    sPanel1: TsPanel;
    sImage1: TsImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormIMG: TFormIMG;

implementation

{$R *.dfm}

end.
