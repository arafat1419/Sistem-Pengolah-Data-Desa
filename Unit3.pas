unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TFPenduduk = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
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
    ESearch: TEdit;
    BSearch: TImage;
    DBGPenduduk: TDBGrid;
    PDashboard: TPanel;
    PPenduduk: TPanel;
    PStruktur: TPanel;
    POlah: TPanel;
    PKeluar: TPanel;
    CbPilihan: TComboBox;
    BCetakSemua: TButton;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    BReset: TButton;
    Image1: TImage;
    procedure PDashboardClick(Sender: TObject);
    procedure PStrukturClick(Sender: TObject);
    procedure POlahClick(Sender: TObject);
    procedure PKeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BSearchClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BResetClick(Sender: TObject);
    procedure BCetakSemuaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPenduduk: TFPenduduk;

implementation

{$R *.dfm}

uses Unit1, Unit5, Unit2, Unit4, Unit7;

procedure TFPenduduk.BCetakSemuaClick(Sender: TObject);
begin
FCetakPenduduk.QuickRep1.PreviewWidth:=1366;
FCetakPenduduk.QuickRep1.PreviewHeight:=768;
FCetakPenduduk.QuickRep1.Preview;
end;

procedure TFPenduduk.BResetClick(Sender: TObject);
begin
with ZQuery1 do
begin
Active:=false;
SQL.Clear;
SQL.Text:='SELECT *From penduduk';
Active:=true;
end;
CbPilihan.Text:='Pilihan';
ESearch.Text:='';
end;

procedure TFPenduduk.BSearchClick(Sender: TObject);
//7202221906010002
begin
with ZQuery1 do
begin
Active:=false;
SQL.Clear;
if(CbPilihan.ItemIndex=0) then
begin
SQL.Text:='SELECT *FROM penduduk WHERE nik = '+QuotedStr(ESearch.Text);
Active:=true;
end
else if(CbPilihan.ItemIndex=1) then
begin
SQL.Text:='SELECT *FROM penduduk WHERE no_kk = '+QuotedStr(ESearch.Text);
Active:=true;
end
else if(CbPilihan.ItemIndex=2) then
begin
SQL.Text:='SELECT *FROM penduduk WHERE nama = '+QuotedStr(ESearch.Text);
Active:=true;
end
else if(CbPilihan.ItemIndex=4) then
begin
SQL.Text:='SELECT *FROM penduduk WHERE jenis_kelamin = '+QuotedStr(ESearch.Text);
Active:=true;
end
else if(CbPilihan.ItemIndex=5) then
begin
SQL.Text:='SELECT *FROM penduduk WHERE agama = '+QuotedStr(ESearch.Text);
Active:=true;
end
else if(CbPilihan.ItemIndex=6) then
begin
SQL.Text:='SELECT *FROM penduduk WHERE gol_darah = '+QuotedStr(ESearch.Text);
Active:=true;
end
else if(CbPilihan.ItemIndex=7) then
begin
SQL.Text:='SELECT *FROM penduduk WHERE status = '+QuotedStr(ESearch.Text);
Active:=true;
end
else if(CbPilihan.ItemIndex=3) then
begin
SQL.Text:='SELECT *FROM penduduk WHERE no_hp = '+QuotedStr(ESearch.Text);
Active:=true;
end;
end;
FDashboard.DataSource1.DataSet:=ZQuery1
end;

procedure TFPenduduk.FormActivate(Sender: TObject);
begin
with ZQuery1 do
begin
Active:=false;
SQL.Clear;
SQL.Text:='SELECT *From penduduk';
Active:=true;
end;
CbPilihan.Text:='Pilihan';
ESearch.Text:='';
end;

procedure TFPenduduk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate
end;

procedure TFPenduduk.PDashboardClick(Sender: TObject);
begin
FDashboard.show;
FPenduduk.Hide;
end;

procedure TFPenduduk.PKeluarClick(Sender: TObject);
begin
FLogin.Show;
FPenduduk.Hide;
end;

procedure TFPenduduk.POlahClick(Sender: TObject);
begin
with ZQuery1 do
begin
Active:=false;
SQL.Clear;
SQL.Text:='SELECT *From penduduk';
Active:=true;
end;
CbPilihan.Text:='Pilihan';
ESearch.Text:='';
FOlah.show;
FPenduduk.Hide;
end;

procedure TFPenduduk.PStrukturClick(Sender: TObject);
begin
FStruktur.show;
FPenduduk.Hide;
end;

end.
