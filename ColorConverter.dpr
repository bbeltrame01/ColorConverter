program ColorConverter;

uses
  Vcl.Forms,
  uColorConverter in 'uColorConverter.pas' {fcolorconverter};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfcolorconverter, fcolorconverter);
  Application.Run;
end.
