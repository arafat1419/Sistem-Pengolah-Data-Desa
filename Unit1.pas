unit Unit1;

interface


uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ShellAPI, Vcl.Imaging.pngimage;

type
  TFLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BLogin: TButton;
    Image1: TImage;
    BClose: TButton;
    procedure BLoginClick(Sender: TObject);
    procedure BCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses Unit2, Unit8;

procedure TFLogin.BCloseClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFLogin.BLoginClick(Sender: TObject);
begin
if (Edit1.Text='') and (Edit2.Text ='') then
MessageDlg('Nama dan Kata sandi tidak boleh kosong!', mtInformation , [mbOK],0)
  else if (Edit1.Text ='') then
MessageDlg('Nama tidak boleh kosong!', mtInformation,[mbOK],0)
  else if (Edit2.Text ='') then
MessageDlg('Kata sandi tidak boleh kosong!', mtInformation,[mbOK],0)
  else if (Edit1.Text <> 'admin') and (Edit2.Text <> '123') then
begin
  MessageDlg('Nama dan kata sandi anda salah!', mtInformation,[mbOK],0);
 Edit1.clear ;
 Edit2.clear ;
end
 else if (Edit1.Text <> 'admin') and (Edit2.Text = '123')  then
begin
MessageDlg('Nama anda salah!!', mtError,[mbOK],0);
Edit1.clear;
end
   else if (Edit1.text = 'admin') and (Edit2.Text <> '123')  then
begin
MessageDlg('Kata sandi anda salah!', mtError,[mbOK],0);
Edit2.clear;
end
else if (Edit1.Text = 'admin') and (Edit2.Text <>'123')  then
begin
     MessageDlg('Kata sandi Anda Salah ', mtInformation, [mbOK],0);
     Edit2.clear;
end
else if (Edit1.Text = 'admin') and (Edit2.Text ='123') then
begin
  Fdashboard.Show;
  FLogin.Hide;
end;
end;

procedure TFLogin.FormActivate(Sender: TObject);
begin
FormCreate(sender);
end;

procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
Edit1.Text:='';
Edit2.Text:='';
end;

end.
