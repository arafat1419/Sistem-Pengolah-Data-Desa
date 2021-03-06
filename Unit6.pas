unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.StdCtrls;

type
  TFUbahStruktur = class(TForm)
    ENip: TEdit;
    ENama: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label16: TLabel;
    CbJabatan: TComboBox;
    BUbah: TButton;
    BBatal: TButton;
    Label1: TLabel;
    ZQuery1: TZQuery;
    procedure BUbahClick(Sender: TObject);
    procedure BBatalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CbJabatanChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUbahStruktur: TFUbahStruktur;

implementation

{$R *.dfm}

uses Unit4, Unit2;

procedure TFUbahStruktur.BBatalClick(Sender: TObject);
begin
FUbahStruktur.Close;
ENama.Text:='';
CbJabatan.Text:='';
ENip.Text:='';
end;

procedure TFUbahStruktur.BUbahClick(Sender: TObject);
begin
if (ENama.Text = '') and (ENip.Text = '') then
begin
MessageDlg('Maaf Data belum terisi semua', mtWarning, [mbOK], 0);
end
else
begin
with ZQuery1 do
begin
  SQL.Clear;
  SQL.Text := 'UPDATE struktur SET nama = '+QuotedStr(ENama.Text)+ ', nip = '+QuotedStr(ENip.Text)+' WHERE jabatan = '+QuotedStr(CbJabatan.Text);
  ExecSQL;
  MessageDlg('Data berhasil di ubah', mtInformation, [mbOK], 0);
end;
ENama.Text:='';
CbJabatan.Text:='';
ENip.Text:='';
BUbah.Enabled:=false;
end;
end;

procedure TFUbahStruktur.CbJabatanChange(Sender: TObject);
begin
BUbah.Enabled:=True;
end;

procedure TFUbahStruktur.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ENama.Text:='';
CbJabatan.Text:='';
ENip.Text:='';
end;

procedure TFUbahStruktur.FormCreate(Sender: TObject);
begin
BUbah.Enabled:=false;
BBatal.Enabled:=true;
end;

end.
