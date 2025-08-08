{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
unit Unidad_Juego;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, GraphicEx, MPlayer;

type
  TFormulario_Juego = class(TForm)
    Molde: TPanel;
    Boton_Matriz: TButton;
    Bean: TShape;
    Boton_Reinciar: TBitBtn;
    P_Intentos: TPanel;
    One_Bean: TPanel;
    Num_Rest1: TLabel;
    Two_Beans: TPanel;
    Num_Rest2: TLabel;
    Three_beans: TPanel;
    Num_Rest3: TLabel;
    Boton_Girar: TBitBtn;
    Sop: TLabel;
    Label1: TLabel;
    Orange_Bean: TImage;
    Yellow_Bean: TImage;
    Blue_Bean: TImage;
    Timer_Carga: TTimer;
    Main_Music: TMediaPlayer;
    Timer_Music: TTimer;
    Sound: TMediaPlayer;
    Indicadores: TImage;
    BitBtn1: TBitBtn;
    Carta: TImage;
    Estatus: TImage;
    Panel_Victoria: TPanel;
    Timer_Finalizado: TTimer;
    procedure Boton_MatrizClick(Sender: TObject);
    procedure MoldeClick(Sender: TObject);
    procedure One_BeanClick(Sender: TObject);
    procedure Boton_GirarClick(Sender: TObject);
    procedure Timer_CargaTimer(Sender: TObject);
    procedure Timer_MusicTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer_FinalizadoTimer(Sender: TObject);
    procedure MoldeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formulario_Juego: TFormulario_Juego;
  Panel:TPanel;
  Shape : TShape;
  CursorHandle: HCursor;
  corX,corY : Integer;
  z : Integer;
  filas,colum,x,y, i : Integer;
  PanelClick: TPanel;
  PanelAd1, PanelAd2, PanelE :  TPanel;
  //i significa numero de intentos
  OneBe_Selected, TwoBe_Selected, ThreeBe_Selected, horizontal : boolean;
  Bal_Izq, Bal_Der, Suma : Integer;
  Cant_One, Cant_Two, Cant_Three : Integer;
  implementation

uses Math, Unidad_MenuPrincipal;

{$R *.dfm}

procedure TFormulario_Juego.Boton_MatrizClick(Sender: TObject);
begin
Menu_Principal.Visible:=false;
inc(i);
P_Intentos.Caption:= 'Intentos: ' + IntToStr(i);
Bal_Izq:= 0;
Bal_Der:= 0;
z:=0;
filas:=3;
colum:=7;
for x:=0 to filas-1 do begin
  for y:=0 to colum-1 do begin
    Panel:=TPanel.Create(Self);
    Panel.Parent:=Self;
    Panel.Name:= 'Panel_'+ IntToStr(x)+'_'+ IntToStr(y)+'_'+IntToStr(i);
    Panel.Caption:='';
    Panel.Width:= Molde.Width;
    Panel.Height:= Molde.Height;
    Panel.Left:=Molde.Left + Molde.Width *(y);
    Panel.Top:=Molde.Top + Molde.Height * (x);
    Panel.Font.Size:=14;
    Panel.Color:=Molde.Color;
    Panel.BorderStyle:=Molde.BorderStyle;
    Panel.OnClick:=Molde.OnClick;
    Panel.OnMouseMove:=Molde.OnMouseMove;
  end;
end;
if i>1 then begin
for x:=0 to filas-1 do begin
  for y:=0 to colum-1 do begin
    Panel:= FindComponent('Panel_'+ IntToStr(x)+'_'+ IntToStr(y)+'_'+IntToStr(i-1)) as TPanel;
    Panel.Enabled:=False;
  end;
end;
end;
Panel:= FindComponent('Panel_'+ IntToStr(1)+'_'+ IntToStr(2)+'_'+IntToStr(i)) as TPanel;

case Menu_Principal.Selec_Dificultad.ItemIndex of
    0:begin
        Bal_Izq:=3;
        Carta.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes/Carta_Easy.png');
        Cant_Three:=2;
      end;
    1:begin
        Bal_Izq:=2;
        Carta.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes/Carta_Medium.png');
        Cant_Three:=2;
        Cant_Two:=1;
      end;
    2:begin
        Bal_Izq:=4;
        Carta.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes/Carta_Hard.png');
        Cant_Three:=2;
        Cant_One:=1;
      end;
    3:begin
        Bal_Izq:=0;
        Carta.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes/Carta_SuperHard.png');
        Cant_Three:=2;
        Cant_Two:=2;
      end;
end;
Num_Rest1.Caption:=IntToStr(Cant_One);
Num_Rest2.Caption:=IntToStr(Cant_Two);
Num_Rest3.Caption:=IntToStr(Cant_Three);


if Cant_One=0 then begin
One_Bean.Enabled:=false;
One_Bean.Color:=clActiveBorder;
end
else begin
One_Bean.Color:= clBtnFace;
One_Bean.Enabled:=True;
end;
if Cant_Two=0 then begin
Two_Beans.Enabled:=false;
Two_Beans.Color:=clActiveBorder;
end
else begin
Two_Beans.Color:= clBtnFace;
Two_Beans.Enabled:=True;
end;
if Cant_Three=0 then begin
Three_beans.Enabled:=false;
Three_beans.Color:=clActiveBorder;
end
else begin
Three_beans.Color:= clBtnFace;
Three_beans.Enabled:=true;
end;

for x:=0 to filas-1 do begin
      for y:=0 to colum-1 do begin
        if (Menu_Principal.Selec_Dificultad.ItemIndex = 0) then begin
          if (y=3) or (((y=2)or (y=1)) and (x=1)) then begin
            Panel:= FindComponent('Panel_'+ IntToStr(x)+'_'+ IntToStr(y)+'_'+IntToStr(i)) as TPanel;
          end;
        end;
        if (Menu_Principal.Selec_Dificultad.ItemIndex = 1) then begin
          if (y=2) or (((y=1) or (y=4) or (y=5)) and (x=1)) then begin
            Panel:= FindComponent('Panel_'+ IntToStr(x)+'_'+ IntToStr(y)+'_'+IntToStr(i)) as TPanel;
          end;
        end;
        if (Menu_Principal.Selec_Dificultad.ItemIndex = 2) then begin
          if (y=2) or (((y=2) or (y=3) or (y=4)) and (x=2)) or ((y=1) and (x=0)) then begin
            Panel:= FindComponent('Panel_'+ IntToStr(x)+'_'+ IntToStr(y)+'_'+IntToStr(i)) as TPanel;
          end;
        end;
        if (Menu_Principal.Selec_Dificultad.ItemIndex = 3) then begin
          if (y=2) or (((y=1) or (y=5) or (y=6)) and (x=1)) then begin
            Panel:= FindComponent('Panel_'+ IntToStr(x)+'_'+ IntToStr(y)+'_'+IntToStr(i)) as TPanel;
          end;
        end;
        z:=z+1;
        Shape:=TShape.Create(Self);
        Shape.Parent:= Panel;
        Shape.Name:= 'Bean_'+ IntToStr(Z) + '_'+IntToStr(i);
        Shape.Width:= Bean.Width;
        Shape.Height:= Bean.Height;
        Shape.Shape:=Bean.Shape;
        Shape.Brush.Color:=ClRed;
        Shape.Top:= 8;
        Shape.Left:=8;
        Panel.Enabled:=false;
      end;
    end;
end;



procedure TFormulario_Juego.MoldeClick(Sender: TObject);
begin
PanelClick:= Sender as TPanel;
corX:= StrToInt(PanelClick.name[7]);
corY:= StrToInt(PanelClick.name[9]);

If (TwoBe_Selected = true) and (Cant_Two>0) then begin
  if (horizontal = true) and (corY<=5) then begin
    PanelAd1:= FindComponent('Panel_'+ IntToStr(corX)+'_'+ IntToStr(corY+1)+'_'+IntToStr(i)) as TPanel;
    if (PanelAd1.Enabled=False) then exit;
  end
  else if (horizontal = false) and (corX >=1) then begin
    PanelAd1:= FindComponent('Panel_'+ IntToStr(corX-1)+'_'+ IntToStr(corY)+'_'+IntToStr(i)) as TPanel;
    if PanelAd1.Enabled=False then exit;
  end
  else begin
    exit;
  end;
  z:=z+1;
  corY:= (StrToInt(PanelAd1.name[9])+1);
  case corY of
    1: Bal_Izq:= Bal_Izq+3;
    2: Bal_Izq:= Bal_Izq+2;
    3: Bal_Izq:= Bal_Izq+1;
    4: ;
    5: Bal_Der:=Bal_Der+1;
    6: Bal_Der:=Bal_Der+2;
    7: Bal_Der:=Bal_Der+3;
    end;
  Shape:=TShape.Create(Self);
  Shape.Parent:= PanelAd1;
  Shape.Name:= 'Bean_'+ IntToStr(Z) + '_'+IntToStr(i);
  Shape.Width:= Bean.Width;
  Shape.Height:= Bean.Height;
  Shape.Shape:=Bean.Shape;
  Shape.Top:= 8;
  Shape.Left:=8;
  Shape.Brush.Color:= Clyellow;
  PanelAd1.Enabled:=false;
end;
If (ThreeBe_Selected = true) and (Cant_Three>0) then begin
  if (horizontal = true) and ((corY<=5) and (corY>=1)) then begin
    PanelAd1:= FindComponent('Panel_'+ IntToStr(corX)+'_'+ IntToStr(corY+1)+'_'+IntToStr(i)) as TPanel;
    PanelAd2:= FindComponent('Panel_'+ IntToStr(corX)+'_'+ IntToStr(corY-1)+'_'+IntToStr(i)) as TPanel;
    if (PanelAd1.Enabled=False)  or (PanelAd2.Enabled=false) then exit;
  end
  else if (horizontal = false) and (corX = 1) then begin
    PanelAd1:= FindComponent('Panel_'+ IntToStr(corX-1)+'_'+ IntToStr(corY)+'_'+IntToStr(i)) as TPanel;
    PanelAd2:= FindComponent('Panel_'+ IntToStr(corX+1)+'_'+ IntToStr(corY)+'_'+IntToStr(i)) as TPanel;
    if (PanelAd1.Enabled=False) or (PanelAd2.Enabled=false) then exit;
  end
  else begin
    exit;
  end;
  z:=z+1;
  for x:=1 to 2 do begin
      if x=1 then begin
      corY:= (StrToInt(PanelAd1.name[9])+1);
      end
      else begin
      corY:= (StrToInt(PanelAd2.name[9])+1);
      end;
    case corY of
    1: Bal_Izq:= Bal_Izq+3;
    2: Bal_Izq:= Bal_Izq+2;
    3: Bal_Izq:= Bal_Izq+1;
    4: ;
    5: Bal_Der:=Bal_Der+1;
    6: Bal_Der:=Bal_Der+2;
    7: Bal_Der:=Bal_Der+3;
    end;
  end;
  Shape:=TShape.Create(Self);
  Shape.Parent:= PanelAd1;
  Shape.Name:= 'Bean_'+ IntToStr(Z) + '_'+IntToStr(i);
  Shape.Width:= Bean.Width;
  Shape.Height:= Bean.Height;
  Shape.Shape:=Bean.Shape;
  Shape.Top:= 8;
  Shape.Left:=8;
  Shape.Brush.Color:= clskyblue;
  PanelAd1.Enabled:=false;

  z:=z+1;
  Shape:=TShape.Create(Self);
  Shape.Parent:= PanelAd2;
  Shape.Name:= 'Bean_'+ IntToStr(Z) + '_'+IntToStr(i);
  Shape.Width:= Bean.Width;
  Shape.Height:= Bean.Height;
  Shape.Shape:=Bean.Shape;
  Shape.Top:= 8;
  Shape.Left:=8;
  Shape.Brush.Color:= clskyblue;
  PanelAd2.Enabled:=false;
end;

if ((OneBe_Selected = true) and (Cant_One>0)) or ((TwoBe_Selected = true) and (Cant_Two>0)) or ((ThreeBe_Selected =true) and(Cant_Three>0 )) then begin
Sound.FileName:= (ExtractFilePath(Application.ExeName)+'Sounds/Put_On.aiff');
Sound.Open;
Sound.Play;
//If StrToInt(PanelClick.Name[9]) = 0 then Suma
corY:= (StrToInt(PanelClick.name[9])+1);
case corY of
  1: Bal_Izq:= Bal_Izq+3;
  2: Bal_Izq:= Bal_Izq+2;
  3: Bal_Izq:= Bal_Izq+1;
  4: ;
  5: Bal_Der:=Bal_Der+1;
  6: Bal_Der:=Bal_Der+2;
  7: Bal_Der:=Bal_Der+3;
end;
z:=z+1;
Shape:=TShape.Create(Self);
Shape.Parent:= Sender as TPanel;
Shape.Name:= 'Bean_'+ IntToStr(Z) + '_'+IntToStr(i);
Shape.Width:= Bean.Width;
Shape.Height:= Bean.Height;
Shape.Shape:=Bean.Shape;
Shape.Top:= 8;
Shape.Left:=8;
PanelClick.Enabled:=false;
end;

If (OneBe_Selected = true) and (Cant_One>0) then begin
Shape.Brush.Color:= $000080FF;
Sop.Caption:=IntToStr(corX) + '_' +  IntToStr(corY);
Cant_One:=Cant_One-1;
end;
If (TwoBe_Selected = true) and (Cant_Two>0) then begin
Shape.Brush.Color:= Clyellow;
Sop.Caption:=IntToStr(corX) + '_' +  IntToStr(corY);
Cant_Two:=Cant_Two-1;
end;
If (ThreeBe_Selected = true) and (Cant_Three >0) then begin
Shape.Brush.Color:= clskyblue;
Cant_Three:=Cant_Three-1;
end;
Label1.Caption:= IntToStr(bal_izq-Bal_Der);

Suma:=Bal_Izq-Bal_Der;
if suma=0 then Estatus.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes/Estado_Balanceado.png');
if suma<0 then Estatus.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes/Estado_DesbalanceadoDer.png');
if suma>0 then Estatus.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes/Estado_DesbalanceadoIzq.png');

Num_Rest1.Caption:=IntToStr(Cant_One);
Num_Rest2.Caption:=IntToStr(Cant_Two);
Num_Rest3.Caption:=IntToStr(Cant_Three);

if Cant_One=0 then begin
One_Bean.Enabled:=false;
One_Bean.Color:=clActiveBorder;
end;
if Cant_Two=0 then begin
Two_Beans.Enabled:=false;
Two_Beans.Color:=clActiveBorder;
end;
if Cant_Three=0 then begin
Three_beans.Enabled:=false;
Three_beans.Color:=clActiveBorder;
end;

end;


procedure TFormulario_Juego.One_BeanClick(Sender: TObject);
begin
Sound.FileName:= (ExtractFilePath(Application.ExeName)+'Sounds/Select.wav');
Sound.Open;
Sound.Play;
if(sender = One_Bean) or (sender =Num_Rest1) or (Sender = Orange_Bean) then begin
One_Bean.Color:=clactiveBorder;
OneBe_Selected := true;
TwoBe_Selected := false;
if Cant_Two > 0 then Two_Beans.Color:= clBtnFace;
if Cant_Three > 0 then Three_beans.Color:= clBtnFace;
ThreeBe_Selected := false;
end;

if(sender = Two_Beans) or (sender =Num_Rest2) or (Sender = Yellow_Bean) then begin
Two_Beans.Color:=clactiveBorder;
OneBe_Selected := false;
TwoBe_Selected := true;
if Cant_One > 0 then One_Bean.Color:= clBtnFace;
if Cant_Three > 0 then Three_beans.Color:= clBtnFace;
ThreeBe_Selected := false;
end;

if(sender = Three_beans) or (sender =Num_Rest3) or (Sender = Blue_Bean) then begin
Three_Beans.Color:=clactiveBorder;
OneBe_Selected := false;
TwoBe_Selected := false;
if Cant_Two > 0 then Two_Beans.Color:= clBtnFace;
if Cant_One > 0 then One_bean.Color:= clBtnFace;
ThreeBe_Selected :=true;
end;
end;

procedure TFormulario_Juego.Boton_GirarClick(Sender: TObject);
begin
Sound.FileName:= (ExtractFilePath(Application.ExeName)+'Sounds/Rotar.mp3');
Sound.Open;
Sound.Play;
If horizontal = false then begin
horizontal:= true;
Boton_Girar.Caption:= 'Vertical';
end
else begin
horizontal:= false;
Boton_Girar.Caption:= 'Horizontal';
end;
end;



procedure TFormulario_Juego.Timer_CargaTimer(Sender: TObject);
begin
Orange_Bean.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes/Orange_Bean.png');
Yellow_Bean.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes/Yellow_Beans.png');
Blue_Bean.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes/Blue_Beans.png');
Indicadores.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes/indicadores.png');
Timer_Carga.Enabled:=false;
end;

procedure TFormulario_Juego.Timer_MusicTimer(Sender: TObject);
begin
Main_Music.FileName:= (ExtractFilePath(Application.ExeName)+'Sounds/Game_Song.mp3');
Main_Music.Open;
Main_Music.Play;
Timer_Music.Interval:= 135000;
end;

procedure TFormulario_Juego.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Menu_Principal.Visible:=true;
i:=0;
z:=0;
Menu_Principal.Timer_MusicaMenu.Interval:= 5;
Menu_Principal.Timer_MusicaMenu.Enabled:=True;
horizontal:=false;
Cant_One:=0;
Cant_Two:=0;
Cant_Three:=0;
Formulario_Juego.Destroy;
end;

procedure TFormulario_Juego.BitBtn1Click(Sender: TObject);
begin
if (Cant_One = 0) and (Cant_Two = 0) and (Cant_Three = 0) and (Suma = 0) then begin
Timer_Finalizado.Enabled:=True;
Sound.FileName:= (ExtractFilePath(Application.ExeName)+'Sounds/celebrate.wav');
Sound.Open;
Sound.Play;
Main_Music.FileName:= (ExtractFilePath(Application.ExeName)+'Sounds/win.mp3');
Main_Music.Open;
Main_Music.Play;
Panel_Victoria.BringToFront;
end
else begin
Sound.FileName:= (ExtractFilePath(Application.ExeName)+'Sounds/risa.wav');
Sound.Open;
Sound.Play;
end;
end;

procedure TFormulario_Juego.Timer_FinalizadoTimer(Sender: TObject);
begin
Panel_Victoria.Visible:=false;
close;
end;

procedure TFormulario_Juego.MoldeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
if (OneBe_Selected = true) and (Cant_One > 0) then begin
CursorHandle := LoadCursorFromFile(PChar(ExtractFilePath(Application.ExeName)+'Cursores/One_Orange_Bean.cur'));
Screen.Cursors[1] := CursorHandle;
Screen.Cursor := 1;
end;

if (TwoBe_Selected = true) and (Cant_Two > 0) then begin
  if horizontal = true then CursorHandle := LoadCursorFromFile(PChar(ExtractFilePath(Application.ExeName)+'Cursores/Two_Yellow_Bean_Horizontal.cur'));
  if horizontal = false then CursorHandle := LoadCursorFromFile(PChar(ExtractFilePath(Application.ExeName)+'Cursores/Two_Yellow_Bean_Vertical.cur'));
Screen.Cursors[2] := CursorHandle;
Screen.Cursor := 2;
end;

if (ThreeBe_Selected = true) and (Cant_Three > 0) then begin
  if horizontal = true then CursorHandle := LoadCursorFromFile(PChar(ExtractFilePath(Application.ExeName)+'Cursores/Three_Blue_Bean_Horizontal.cur'));
  if horizontal = false then CursorHandle := LoadCursorFromFile(PChar(ExtractFilePath(Application.ExeName)+'Cursores/Three_Blue_Bean_Vertical.cur'));
Screen.Cursors[3] := CursorHandle;
Screen.Cursor := 3;
end;

end;

procedure TFormulario_Juego.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
Screen.Cursor:=0;
end;

end.
