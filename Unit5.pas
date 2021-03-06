unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFOlah = class(TForm)
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
    PInput: TPanel;
    Label14: TLabel;
    DBGrid1: TDBGrid;
    OpenDialog1: TOpenDialog;
    BBatal: TButton;
    BHapus: TButton;
    BSimpan: TButton;
    BTambah: TButton;
    BUbah: TButton;
    CbAgama: TComboBox;
    CbDarah: TComboBox;
    CbJk: TComboBox;
    CbStatus: TComboBox;
    DTanggalLahir: TDateTimePicker;
    EAlamat: TEdit;
    ENama: TEdit;
    ENik: TEdit;
    ENoHp: TEdit;
    ENokk: TEdit;
    EPekerjaan: TEdit;
    ETempatLahir: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure PDashboardClick(Sender: TObject);
    procedure PPendudukClick(Sender: TObject);
    procedure PStrukturClick(Sender: TObject);
    procedure PKeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTambahClick(Sender: TObject);
    procedure BBatalClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BSimpanClick(Sender: TObject);
    procedure BUbahClick(Sender: TObject);
    procedure BHapusClick(Sender: TObject);
    procedure ENikKeyPress(Sender: TObject; var Key: Char);
    procedure ENokkKeyPress(Sender: TObject; var Key: Char);
    procedure ENoHpKeyPress(Sender: TObject; var Key: Char);
    procedure ENamaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOlah: TFOlah;

implementation

{$R *.dfm}

uses Unit1, Unit2, Unit3, Unit4, JPeg;


procedure PEnable;
begin
FOlah.ENokk.Enabled:=true;
FOlah.ENama.Enabled:=true;
FOlah.ETempatLahir.Enabled:=true;
FOlah.DTanggalLahir.Enabled:=true;
FOlah.CbJk.Enabled:=true;
FOlah.EAlamat.Enabled:=true;
FOlah.CbAgama.Enabled:=true;
FOlah.CbDarah.Enabled:=true;
FOlah.CbStatus.Enabled:=true;
FOlah.EPekerjaan.Enabled:=true;
FOlah.ENoHp.Enabled:=true;
end;

procedure PDisable;
begin
FOlah.ENik.Enabled:=false;
FOlah.ENokk.Enabled:=false;
FOlah.ENama.Enabled:=false;
FOlah.ETempatLahir.Enabled:=false;
FOlah.DTanggalLahir.Enabled:=false;
FOlah.CbJk.Enabled:=false;
FOlah.EAlamat.Enabled:=false;
FOlah.CbAgama.Enabled:=false;
FOlah.CbDarah.Enabled:=false;
FOlah.CbStatus.Enabled:=false;
FOlah.EPekerjaan.Enabled:=false;
FOlah.ENoHp.Enabled:=false;
end;

procedure PAwal;
begin
FOlah.BTambah.Enabled:=true;
FOlah.BUbah.Enabled:=false;
FOlah.BHapus.Enabled:=false;
FOlah.BSimpan.Enabled:=false;
FOlah.BBatal.Enabled:=false;
FOlah.ENik.Text:='';
FOlah.ENokk.Text:='';
FOlah.ENama.Text:='';
FOlah.ETempatLahir.Text:='';
FOlah.DTanggalLahir.Date:=Now;
FOlah.CbJk.Text:='';
FOlah.EAlamat.Text:='';
FOlah.CbAgama.Text:='';
FOlah.CbDarah.Text:='';
FOlah.CbStatus.Text:='';
FOlah.EPekerjaan.Text:='';
FOlah.ENoHp.Text:='';
end;

procedure TFOlah.BBatalClick(Sender: TObject);
begin
PDisable;
PAwal;
end;

procedure TFOlah.BHapusClick(Sender: TObject);
begin
if MessageDlg('Apakah anda yakin menghapus data ini?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
begin
  with FDashboard.ZQuery1 do
  begin
    SQL.Clear;
    SQL.Text:='DELETE FROM penduduk WHERE nik='+QuotedStr(ENik.Text);
    ExecSQL;
    MessageDlg('Data berhasil di hapus', mtInformation, [mbOK], 0);
    FormCreate(Sender);
  end;
end;
end;


procedure TFOlah.BSimpanClick(Sender: TObject);
begin
with FDashboard.ZQuery1 do
begin
  Active:=false;
  SQL.Clear;
  SQL.Text:='SELECT *FROM penduduk WHERE nik ='+QuotedStr(ENik.Text);
  Active:=true;
  if (ENik.Text='') or (ENokk.Text='') or (ENama.Text='') or (ETempatLahir.Text='') or
  (CbJk.Text='') or (EAlamat.Text='') or (CbAgama.Text='') or (CbDarah.Text='') or (CbStatus.Text='')
  or (EPekerjaan.Text='') or (ENoHp.Text='')then
  begin
     MessageDlg('Maaf Data belum terisi semua', mtWarning, [mbOK], 0);
  end
  else
  begin
    with FDashboard.ZQuery1 do
    begin
    //nik,no_kk,nama,tempat_lahir,tanggal_lahir,jenis_kelamin,alamat,agama,gol_darah,status,pekerjaan,no_hp
      SQL.Clear;
      SQL.Text:='INSERT into penduduk(nik,no_kk,nama,tempat_lahir,tanggal_lahir,jenis_kelamin,alamat,agama,gol_darah,status,pekerjaan,no_hp) VALUES('
      +QuotedStr(ENik.Text)+','+QuotedStr(ENokk.Text)+','+QuotedStr(ENama.Text)+','
      +QuotedStr(ETempatLahir.Text)+','+QuotedStr(FormatDateTime('yyyy/MM/dd', DTanggalLahir.Date))+','
      +QuotedStr(CbJk.text)+','+QuotedStr(EAlamat.Text)+','+QuotedStr(CbAgama.text)+','+QuotedStr(CbDarah.Text)+','
      +QuotedStr(CbStatus.text)+','+QuotedStr(EPekerjaan.Text)+','+QuotedStr(ENoHp.text)+')';
      ExecSQL;
      MessageDlg('Data berhasil di simpan', mtInformation, [mbOK], 0);
      FormCreate(Sender);
    end;
  end;
end;
end;

procedure TFOlah.BTambahClick(Sender: TObject);
begin
ENik.Enabled:=true;
PEnable;
BTambah.Enabled:=false;
BUbah.Enabled:=false;
BHapus.Enabled:=false;
BSimpan.Enabled:=true;
BBatal.Enabled:=true;
end;

procedure TFOlah.BUbahClick(Sender: TObject);
begin
with FDashboard.ZQuery1 do
begin
  Active:=false;
  SQL.Clear;
  SQL.Text:='SELECT *FROM penduduk WHERE nik ='+QuotedStr(ENik.Text);
  Active:=true;
  if (ENik.Text='') or (ENokk.Text='') or (ENama.Text='') or (ETempatLahir.Text='') or
  (CbJk.Text='') or (EAlamat.Text='') or (CbAgama.Text='') or (CbDarah.Text='') or (CbStatus.Text='')
  or (EPekerjaan.Text='') or (ENoHp.Text='')then
  begin
     MessageDlg('Maaf Data belum terisi semua', mtWarning, [mbOK], 0);
  end
  else
  begin
    with FDashboard.ZQuery1 do
    begin
      SQL.Clear;
      SQL.Text:='UPDATE penduduk SET nik ='+QuotedStr(ENik.Text)+',no_kk='+QuotedStr(ENokk.Text)
      +',nama='+QuotedStr(ENama.Text)+',tempat_lahir='+QuotedStr(ETempatLahir.Text)+',tanggal_lahir='
      +QuotedStr(FormatDateTime('yyyy/MM/dd', DTanggalLahir.Date)) +',jenis_kelamin='+QuotedStr(CbJk.Text)
      +',alamat='+QuotedStr(EAlamat.Text)+',agama='+QuotedStr(CbAgama.Text)+',gol_darah='+QuotedStr(CbDarah.Text)
      +',status='+QuotedStr(CbStatus.Text)+',pekerjaan='+QuotedStr(EPekerjaan.Text)+',no_hp='+QuotedStr(ENoHp.Text)
      +' WHERE nik='+QuotedStr(ENik.Text);
      ExecSQL;
      MessageDlg('Data berhasil di ubah', mtInformation, [mbOK], 0);
      FormCreate(Sender);
    end;
  end;
end;
end;


procedure TFOlah.DBGrid1DblClick(Sender: TObject);
begin
PEnable;
BTambah.Enabled:=false;
BUbah.Enabled:=true;
BHapus.Enabled:=true;
BSimpan.Enabled:=false;
BBatal.Enabled:=true;
ENik.Text:= DBGrid1.Fields[0].AsString;
ENokk.Text:=DBGrid1.Fields[1].AsString;
ENama.Text:=DBGrid1.Fields[2].AsString;
ETempatLahir.Text:=DBGrid1.Fields[3].AsString;
DTanggalLahir.Date:=DBGrid1.Fields[4].AsDateTime;
CbJk.Text:=DBGrid1.Fields[5].AsString;
EAlamat.Text:=DBGrid1.Fields[6].AsString;
CbAgama.Text:=DBGrid1.Fields[7].AsString;
CbDarah.Text:=DBGrid1.Fields[8].AsString;
CbStatus.Text:=DBGrid1.Fields[9].AsString;
EPekerjaan.Text:=DBGrid1.Fields[10].AsString;
ENoHp.Text:=DBGrid1.Fields[11].AsString;
end;

procedure TFOlah.ENamaKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['a'..'z','A'..'Z',#8,#13,#32]) then
 begin
 key:=#0;
 showmessage('inputan hanya huruf');
 end;
end;

procedure TFOlah.ENikKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',#8,#13,#32]) then
 begin
 key:=#0;
 showmessage('Inputan hanya angka');
 end;
end;

procedure TFOlah.ENoHpKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',#8,#13,#32]) then
 begin
 key:=#0;
 showmessage('Inputan hanya angka');
 end;
end;

procedure TFOlah.ENokkKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',#8,#13,#32]) then
 begin
 key:=#0;
 showmessage('Inputan hanya angka');
 end;
end;

procedure TFOlah.FormActivate(Sender: TObject);
begin
with FDashboard.ZQuery1 do
begin
Active:=false;
SQL.Text:='SELECT *From penduduk';
ExecSQL;
Active:=true;
end;
end;

procedure TFOlah.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate
end;

procedure TFOlah.FormCreate(Sender: TObject);
begin
PAwal;
PDisable;
end;

procedure TFOlah.PDashboardClick(Sender: TObject);
begin
FDashboard.Show;
FOlah.Hide;
end;

procedure TFOlah.PKeluarClick(Sender: TObject);
begin
FLogin.Show;
FOlah.Hide;
end;

procedure TFOlah.PPendudukClick(Sender: TObject);
begin
FPenduduk.Show;
FOlah.Hide;
end;

procedure TFOlah.PStrukturClick(Sender: TObject);
begin
FStruktur.Show;
FOlah.Hide;
end;

end.
