unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids, ShellAPI;

type
  TFDashboard = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LKk: TLabel;
    LPerempuan: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    PDashboard: TPanel;
    PPenduduk: TPanel;
    PStruktur: TPanel;
    POlah: TPanel;
    PKeluar: TPanel;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    ZQuery2: TZQuery;
    ZQuery3: TZQuery;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    procedure PPendudukClick(Sender: TObject);
    procedure PStrukturClick(Sender: TObject);
    procedure POlahClick(Sender: TObject);
    procedure PKeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDashboard: TFDashboard;

implementation

{$R *.dfm}

uses Unit1, Unit5, Unit3, Unit4, Unit6;


procedure TFDashboard.FormActivate(Sender: TObject);
begin
with ZQuery2 do
begin
Active:=false;
Active:=true;
end;
with ZQuery3 do
begin
Active:=false;
Active:=true;
end;
LKk.Caption:=DBGrid2.Fields[0].AsString;
LPerempuan.Caption:=DBGrid1.Fields[0].AsString;
end;

procedure TFDashboard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;


procedure TFDashboard.PKeluarClick(Sender: TObject);
begin
FLogin.show;
FDashboard.Hide;
end;

procedure TFDashboard.POlahClick(Sender: TObject);
begin
FOlah.show;
FDashboard.Hide;
end;

procedure TFDashboard.PPendudukClick(Sender: TObject);
begin
FPenduduk.show;
FDashboard.Hide;
end;

procedure TFDashboard.PStrukturClick(Sender: TObject);
begin
FStruktur.show;
FDashboard.Hide;
end;

end.
