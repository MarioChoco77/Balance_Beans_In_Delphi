unit Unidad_MenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GraphicEx, ExtCtrls, MPlayer, Menus, StdCtrls;

type
  TMenu_Principal = class(TForm)
    Background: TImage;
    Logo: TImage;
    Timer_Carga1: TTimer;
    Music_Menu: TMediaPlayer;
    Timer_MusicaMenu: TTimer;
    Boton_Empezar: TPanel;
    Boton_Creditos: TPanel;
    Boton_Salir: TPanel;
    Selec_Dificultad: TComboBox;
    procedure Timer_Carga1Timer(Sender: TObject);
    procedure Timer_MusicaMenuTimer(Sender: TObject);
    procedure Boton_SalirClick(Sender: TObject);
    procedure Boton_EmpezarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Menu_Principal: TMenu_Principal;

implementation

uses Unidad_Juego;

{$R *.dfm}

procedure TMenu_Principal.Timer_Carga1Timer(Sender: TObject);
begin
Logo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes/Logo.png');
Background.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes/Beans_Background.png');
Timer_Carga1.Enabled:=false;
end;

procedure TMenu_Principal.Timer_MusicaMenuTimer(Sender: TObject);
begin
Music_Menu.FileName:= (ExtractFilePath(Application.ExeName)+'Sounds/Main_MenuSong.mp3');
Music_Menu.Open;
Music_Menu.Play;
Timer_MusicaMenu.Interval:= 84000;
end;

procedure TMenu_Principal.Boton_SalirClick(Sender: TObject);
begin
close;
end;

procedure TMenu_Principal.Boton_EmpezarClick(Sender: TObject);
begin
if Selec_Dificultad.ItemIndex > -1 then begin
Application.CreateForm(TFormulario_Juego, Formulario_Juego);
Music_Menu.Stop;
Timer_MusicaMenu.Enabled:=false;
Formulario_Juego.Timer_Music.Enabled:=true;
Formulario_Juego.Show;
end
else begin
Application.MessageBox('Seleccione una Dificultad','Error',MB_ICONERROR+ MB_OK)
end;
end;

end.
