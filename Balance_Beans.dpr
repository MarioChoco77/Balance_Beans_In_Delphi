program Balance_Beans;

uses
  Forms,
  Unidad_Juego in 'Unidad_Juego.pas' {Formulario_Juego},
  Unidad_Inicio in '..\Actividad 3 Mosaico\Unidad_Inicio.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormulario_Juego, Formulario_Juego);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
