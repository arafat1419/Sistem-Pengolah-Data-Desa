unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TFStruktur = class(TForm)
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
    PDashboard: TPanel;
    PPenduduk: TPanel;
    PStruktur: TPanel;
    POlah: TPanel;
    PKeluar: TPanel;
    PPilihan: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    labelsaja: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    namaLurah: TEdit;
    nipLurah: TLabel;
    namaSekertaris: TEdit;
    Label16: TLabel;
    nipSek: TLabel;
    namaPU: TEdit;
    Label18: TLabel;
    nipPu: TLabel;
    namaEkonomi: TEdit;
    Label20: TLabel;
    nipEko: TLabel;
    namaTrantib: TEdit;
    Label22: TLabel;
    nipTrantib: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ZQuery1: TZQuery;
    ZQuery2: TZQuery;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    ZQuery3: TZQuery;
    DataSource3: TDataSource;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    ZQuery4: TZQuery;
    DataSource4: TDataSource;
    ZQuery5: TZQuery;
    DataSource5: TDataSource;
    DBGrid5: TDBGrid;
    BUbah: TButton;
    procedure PDashboardClick(Sender: TObject);
    procedure PPendudukClick(Sender: TObject);
    procedure POlahClick(Sender: TObject);
    procedure PKeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BUbahClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FStruktur: TFStruktur;

implementation

{$R *.dfm}

uses Unit1, Unit5, Unit3, Unit2, Unit6;

procedure TFStruktur.BUbahClick(Sender: TObject);
begin
FUbahStruktur.Show;
end;

procedure TFStruktur.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate
end;


procedure TFStruktur.FormCreate(Sender: TObject);
begin
namaLurah.Text := DBGrid1.Fields[1].AsString;
nipLurah.Caption := DBGrid1.Fields[2].AsString;
namaSekertaris.Text := DBGrid2.Fields[1].AsString;
nipSek.Caption := DBGrid2.Fields[2].AsString;
namaPU.Text := DBGrid3.Fields[1].AsString;
nipPu.Caption := DBGrid3.Fields[2].AsString;
namaTrantib.Text := DBGrid4.Fields[1].AsString;
nipTrantib.Caption := DBGrid4.Fields[2].AsString;
namaEkonomi.Text := DBGrid5.Fields[1].AsString;
nipEko.Caption := DBGrid5.Fields[2].AsString;
end;

procedure TFStruktur.PDashboardClick(Sender: TObject);
begin
FDashboard.Show;
FStruktur.Hide;
end;

procedure TFStruktur.PKeluarClick(Sender: TObject);
begin
FLogin.Show;
FStruktur.Hide;
end;

procedure TFStruktur.POlahClick(Sender: TObject);
begin
FOlah.Show;
FStruktur.Hide;
end;

procedure TFStruktur.PPendudukClick(Sender: TObject);
begin
FPenduduk.Show;
FStruktur.Hide;
end;


end.
