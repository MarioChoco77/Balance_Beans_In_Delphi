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
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TFormulario_Juego = class(TForm)
    Molde: TPanel;
    Boton_Matriz: TButton;
    Bean: TShape;
    Boton_Reinciar: TBitBtn;
    P_Intentos: TPanel;
    One_Bean: TPanel;
    Orange_Bean: TShape;
    Num_Rest1: TLabel;
    Two_Beans: TPanel;
    Yellow_Bean: TShape;
    Num_Rest2: TLabel;
    Yellow_Bean2: TShape;
    Three_beans: TPanel;
    Blue_Bean: TShape;
    Num_Rest3: TLabel;
    Blue_Bean1: TShape;
    Blue_Bean2: TShape;
    Boton_Girar: TBitBtn;
    Sop: TLabel;
    procedure Boton_MatrizClick(Sender: TObject);
    procedure MoldeClick(Sender: TObject);
    procedure One_BeanClick(Sender: TObject);
    procedure Boton_GirarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formulario_Juego: TFormulario_Juego;
  Panel:TPanel;
  Shape : TShape;
  var corX,corY : Integer;
  var z : Integer;
  var filas,colum,x,y, i : Integer;
  var PanelClick: TPanel;
  var PanelAd1 :  TPanel;
  //i significa numero de intentos
  var OneBe_Selected, TwoBe_Selected, ThreeBe_Selected, horizontal : boolean;
  implementation

uses Math;

{$R *.dfm}

procedure TFormulario_Juego.Boton_MatrizClick(Sender: TObject);
begin
inc(i);
P_Intentos.Caption:= 'Intentos: ' + IntToStr(i);
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
    Panel.OnClick:=Molde.OnClick;
  end;
end;
end;

procedure TFormulario_Juego.MoldeClick(Sender: TObject);
begin
PanelClick:= Sender as TPanel;
corX:= StrToInt(PanelClick.name[7]);
corY:= StrToInt(PanelClick.name[9]);

If TwoBe_Selected = true then begin
  if (horizontal = true) and (corY<=5) then begin
    PanelAd1:= FindComponent('Panel_'+ IntToStr(corX)+'_'+ IntToStr(corY+1)+'_'+IntToStr(i)) as TPanel;
    if PanelAd1.Enabled=False then exit;
  end
  else if (horizontal = false) and (corX >=1) then begin
    PanelAd1:= FindComponent('Panel_'+ IntToStr(corX-1)+'_'+ IntToStr(corY)+'_'+IntToStr(i)) as TPanel;
    if PanelAd1.Enabled=False then exit;
  end
  else begin
    exit;
  end;
  z:=z+1;
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
If ThreeBe_Selected = true then begin

end;

if (OneBe_Selected = true) or (TwoBe_Selected = true) or (ThreeBe_Selected =true) then begin
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

If OneBe_Selected = true then begin
Shape.Brush.Color:= $000080FF;
Sop.Caption:=IntToStr(corX) + '_' +  IntToStr(corY);
end;
If TwoBe_Selected = true then begin
Shape.Brush.Color:= Clyellow;
end;
If ThreeBe_Selected = true then begin
Shape.Brush.Color:= clskyblue;
end;
end;


procedure TFormulario_Juego.One_BeanClick(Sender: TObject);
begin
PanelClick:= Sender as TPanel;
PanelClick.Color:=clactiveBorder;
if(sender = One_Bean) then begin
OneBe_Selected := true;
TwoBe_Selected := false;
Two_Beans.Color:= clBtnFace;
Three_beans.Color:= clBtnFace;
ThreeBe_Selected := false;
end;

if(sender = Two_Beans) then begin
OneBe_Selected := false;
TwoBe_Selected := true;
One_Bean.Color:= clBtnFace;
Three_beans.Color:= clBtnFace;
ThreeBe_Selected := false;
end;

if(sender = Three_beans) then begin
OneBe_Selected := false;
TwoBe_Selected := false;
Two_Beans.Color:= clBtnFace;
One_bean.Color:= clBtnFace;
ThreeBe_Selected :=true;
end;
end;

procedure TFormulario_Juego.Boton_GirarClick(Sender: TObject);
begin
If horizontal = false then begin
horizontal:= true;
Boton_Girar.Caption:= 'Vertical';
end
else begin
horizontal:= false;
Boton_Girar.Caption:= 'Horizontal';
end;
end;



end.
