program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {FLogin},
  Unit2 in 'Unit2.pas' {FDashboard},
  Unit3 in 'Unit3.pas' {FPenduduk},
  Unit4 in 'Unit4.pas' {FStruktur},
  Unit5 in 'Unit5.pas' {FOlah},
  Unit6 in 'Unit6.pas' {FUbahStruktur},
  Unit7 in 'Unit7.pas' {FCetakPenduduk};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFDashboard, FDashboard);
  Application.CreateForm(TFPenduduk, FPenduduk);
  Application.CreateForm(TFStruktur, FStruktur);
  Application.CreateForm(TFOlah, FOlah);
  Application.CreateForm(TFUbahStruktur, FUbahStruktur);
  Application.CreateForm(TFCetakPenduduk, FCetakPenduduk);
  Application.Run;
end.
