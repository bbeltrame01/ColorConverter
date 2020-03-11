unit uColorConverter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Math,
  Vcl.Samples.Spin;

type
  Tfcolorconverter = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    sColors: TShape;
    sGreyscale: TShape;
    btn_normalizar: TButton;
    btn_limpar: TButton;
    Label18: TLabel;
    R: TSpinEdit;
    G: TSpinEdit;
    B: TSpinEdit;
    H: TSpinEdit;
    S: TSpinEdit;
    V: TSpinEdit;
    C: TSpinEdit;
    M: TSpinEdit;
    Y: TSpinEdit;
    K: TSpinEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GExit(Sender: TObject);
    procedure BExit(Sender: TObject);
    procedure VExit(Sender: TObject);
    procedure CExit(Sender: TObject);
    procedure MExit(Sender: TObject);
    procedure YExit(Sender: TObject);
    procedure KExit(Sender: TObject);
    procedure btn_normalizarClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure RExit(Sender: TObject);
    procedure HExit(Sender: TObject);
    procedure SExit(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaCor;
    procedure CarregaValores;
    procedure EnviarValores;
    procedure RGBToHSV;
    procedure RGBToCMYK;
    procedure HSVToRGB;
    procedure CMYKToRGB;
  public
    { Public declarations }
    dR,dG,dB,
    dH,dS,dV,
    dC,dM,dY,dK,
    dHC,dHX,dHM,
    minRGB,maxRGB,delta: Double;
  end;

var
  fcolorconverter: Tfcolorconverter;

implementation

{$R *.dfm}

procedure Tfcolorconverter.AtualizaCor;
var
  iI:integer;
begin
  // Atualiza Cor
  sColors.Brush.Color := RGB(StrToInt(R.Text),StrToInt(G.Text),StrToInt(B.Text));
  // Converter RGB para Escala de Cinza
  iI := Trunc((dR+dG+dB)/3);
  sGreyscale.Brush.Color := RGB(iI,iI,iI);
end;

procedure Tfcolorconverter.BExit(Sender: TObject);
begin
  CarregaValores;
  RGBToHSV;
  RGBToCMYK;
end;

procedure Tfcolorconverter.btn_limparClick(Sender: TObject);
begin
  R.Text := '0';
  G.Text := '0';
  B.Text := '0';
  CarregaValores;
  RGBToHSV;
  RGBToCMYK;
end;

procedure Tfcolorconverter.btn_normalizarClick(Sender: TObject);
begin
  CarregaValores;
  // Normalizar RGB
  if (dR+dG+dB)>0 then
  begin
    dR := Trunc(abs(dR/(dR+dG+dB))*100);
    dG := Trunc(abs(dG/(dR+dG+dB))*100);
    dB := Trunc(abs(dB/(dR+dG+dB))*100);
  end;
  RGBToHSV;
  RGBToCMYK;
end;

procedure Tfcolorconverter.CarregaValores;
begin
  // RGB
  dR:=StrToFloatDef(R.Text,0);
  if dR>255 then dR:=255;
  dG:=StrToFloatDef(G.Text,0);
  if dG>255 then dG:=255;
  dB:=StrToFloatDef(B.Text,0);
  if dB>255 then dB:=255;
  // HSV
  dH:=StrToFloatDef(H.Text,0);
  if dH>360 then dH:=360;
  dS:=StrToFloatDef(S.Text,0);
  if dS>100 then dS:=100;
  dV:=StrToFloatDef(V.Text,0);
  if dV>100 then dV:=100;
  // CMYK
  dC:=StrToFloatDef(C.Text,0);
  if dC>100 then dC:=100;
  dM:=StrToFloatDef(M.Text,0);
  if dM>100 then dM:=100;
  dY:=StrToFloatDef(Y.Text,0);
  if dY>100 then dY:=100;
  dK:=StrToFloatDef(K.Text,0);
  if dK>100 then dK:=100;
end;

procedure Tfcolorconverter.CExit(Sender: TObject);
begin
  CarregaValores;
  CMYKToRGB;
  RGBToHSV;
end;

procedure Tfcolorconverter.CMYKToRGB;
begin
  // Converter CMYK para RGB
  dK:=dK/100;
  dC:=dC/100;
  dM:=dM/100;
  dY:=dY/100;
  dR := 255*(1-dC)*(1-dK);
  dG := 255*(1-dM)*(1-dK);
  dB := 255*(1-dY)*(1-dK);
  dK:=dK*100;
  dC:=dC*100;
  dM:=dM*100;
  dY:=dY*100;
  EnviarValores;
end;

procedure Tfcolorconverter.EnviarValores;
begin
  // RGB
  R.Text := IntToStr(Trunc(dR));
  G.Text := IntToStr(Trunc(dG));
  B.Text := IntToStr(Trunc(dB));
  // HSV
  H.Text := IntToStr(Trunc(dH));
  S.Text := FloatToStr(dS);
  V.Text := FloatToStr(dV);
  // CMYK
  C.Text := FloatToStr(dC);
  M.Text := FloatToStr(dM);
  Y.Text := FloatToStr(dY);
  K.Text := FloatToStr(dK);
  // Atualiza Cores
  AtualizaCor;
end;

procedure Tfcolorconverter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Tfcolorconverter.GExit(Sender: TObject);
begin
  CarregaValores;
  RGBToHSV;
  RGBToCMYK;
end;

procedure Tfcolorconverter.HExit(Sender: TObject);
begin
  CarregaValores;
  HSVToRGB;
  RGBToCMYK;
end;

procedure Tfcolorconverter.HSVToRGB;
begin
  // Converter HSV para RGB
  dS:=dS/100;
  dV:=dV/100;
  dHC:=dV*dS;
  dHX:=dHC*(1 - abs( abs((dH/60)-2) - 1));
  dHm:=dV-dHC;
  if dH<60 then
  begin
    dR:=dHC;
    dG:=dHX;
    dB:=0;
  end else
  if dH<120 then
  begin
    dR:=dHX;
    dG:=dHC;
    dB:=0;
  end else
  if dH<180 then
  begin
    dR:=0;
    dG:=dHC;
    dB:=dHX;
  end else
  if dH<240 then
  begin
    dR:=0;
    dG:=dHX;
    dB:=dHC;
  end else
  if dH<300 then
  begin
    dR:=dHX;
    dG:=0;
    dB:=dHC;
  end else
  begin
    dR:=dHC;
    dG:=0;
    dB:=dHX;
  end;
  dR:=(dR+dHm)*255;
  dG:=(dG+dHm)*255;
  dB:=(dB+dHm)*255;
  dS:=dS*100;
  dV:=dV*100;
  EnviarValores;
end;

procedure Tfcolorconverter.KExit(Sender: TObject);
begin
  CarregaValores;
  CMYKToRGB;
  RGBToHSV;
end;

procedure Tfcolorconverter.MExit(Sender: TObject);
begin
  CarregaValores;
  CMYKToRGB;
  RGBToHSV;
end;

procedure Tfcolorconverter.RExit(Sender: TObject);
begin
  CarregaValores;
  RGBToHSV;
  RGBToCMYK;
end;

procedure Tfcolorconverter.RGBToCMYK;
begin
  // Converter RGB para CMYK
  dR:=dR/255;
  dG:=dG/255;
  dB:=dB/255;
  dK := 1-Max(Max(dR,dG),dB);
  if dK<>1 then
  begin
    dC := RoundTo((1-dR-dK)/(1-dK)*100,-1);
    dM := RoundTo((1-dG-dK)/(1-dK)*100,-1);
    dY := RoundTo((1-dB-dK)/(1-dK)*100,-1);
  end
  else
  begin
    dC := 0;
    dM := 0;
    dY := 0;
  end;
  dK := RoundTo(dK*100,-1);
  dR:=dR*255;
  dG:=dG*255;
  dB:=dB*255;
  EnviarValores;
end;

procedure Tfcolorconverter.RGBToHSV;
begin
  // Converter RGB para HSV
  minRGB := Min(Min(dR, dG), dB);
  maxRGB := Max(Max(dR, dG), dB);
  delta := (maxRGB - minRGB);

  if delta>0 then
  begin
    if (maxRGB=dR) then
    begin
      dH := 60*((dG-dB)/delta);
      if dG<dB then dH:=dH+360;
    end
    else if (maxRGB=dG) then
      dH := 60*((dB-dR)/delta)+120
    else if (maxRGB=dB) then
      dH := 60*((dR-dG)/delta)+240;
  end
  else dH:=0;
  if maxRGB>0 then
    dS := RoundTo((delta/maxRGB)*100,-1)
  else
    dS := 0;
  dV := RoundTo((maxRGB*100)/255,-1);
  EnviarValores;
end;

procedure Tfcolorconverter.SExit(Sender: TObject);
begin
  CarregaValores;
  HSVToRGB;
  RGBToCMYK;
end;

procedure Tfcolorconverter.VExit(Sender: TObject);
begin
  CarregaValores;
  HSVToRGB;
  RGBToCMYK;
end;

procedure Tfcolorconverter.YExit(Sender: TObject);
begin
  CarregaValores;
  CMYKToRGB;
  RGBToHSV;
end;

end.
