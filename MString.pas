{*******************************************************}
{                                                       }
{                      MString v1.0                     }
{                 Вывод суммы прописью                  }
{                                                       }
{       Copyright (c) 1998-2003 by Miha Tyulenev        }
{                                                       }
{*******************************************************}


unit MString;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, StdCtrls;

function IndNum(Ch: Char): Integer;
function Upper(Ch: Char): Char;
procedure UpperPChar(P: PChar);
function CurrToCB(Sum: Currency; DecSep: Char): String;
function MoneyStr(Sum: Currency): String;
function ShortMoneyStr(Sum: Currency): String;
function InpCurr(Ed: TEdit): Currency;
function InpCurrKv(Ed: TEdit): Currency;
function CurrToStrKv(Sum: Currency): String;

var
  AVal    :array[0..5] of string = ('рубль','рубля','рублей',
                       'копейка','копейки','копеек');
  A1_19   :array[0..18] of string = ( 'один', 'два', 'три', 'четыре', 'пять',
                       'шесть', 'семь', 'восемь', 'девять', 'десять',
                       'одиннадцать', 'двенадцать', 'тринадцать',
                       'четырнадцать', 'пятнадцать', 'шестнадцать',
                       'семнадцать', 'восемнадцать', 'девятнадцать');
  A1_2    :array[0..1] of string = ('одна','две');
  A20_90  :array[0..7] of string = ('двадцать','тридцать','сорок','пятьдесят',
                       'шестьдесят','семьдесят','восемьдесят','девяносто');
  A100_900:array[0..8] of string = ('сто','двести','триста','четыреста',
                       'пятьсот','шестьсот','семьсот','восемьсот','девятьсот');
  ABig    :array[0..11] of string = ('тысяча','тысячи','тысяч',
                       'миллион','миллиона','миллионов',
                       'миллиард','миллиарда','миллиардов',
                       'триллион','триллиона','триллионов');

implementation

function IndNum(Ch: Char): Integer;
begin
  case Ch of
    '1'      : Result := 0;
    '2'..'4' : Result := 1;
  else
    Result := 2;
  end;
end;

function Upper(Ch: Char): Char;
begin
  case Ch of
    'a'..'z', 'а'..'я' : Result := Chr(Integer(Ch) - 32);
    'ё'                : Result := 'Ё';
  else
    Result := Ch;
  end;
end;

procedure UpperPChar(P: PChar);
var
  S: PChar;
begin
  S := P;
  while S^ <> #0 do
  begin
    case S^ of
      'a'..'z', 'а'..'я' : S^ := Chr(Integer(S^) - 32);
      'ё'                : S^ := 'Ё';
    end;
    S := S + 1
  end;
end;

function MoneyStr(Sum: Currency): String;
var
  sCB: String;
  Len, fTrio, nTrio, i: Integer;
  pCB: PChar;
  const nilTrio: PChar = '000';
begin
  i := -1;
  sCB := CurrToCB(Sum, '-'); //сумма в формате ЦБ ('9..9-99')
  Len := Length(sCB);
  nTrio := Len div 3 - 1; //количество триад
  fTrio := Len mod 3;     //если есть еще не полная первая триада
  if fTrio > 0 then
    nTrio := nTrio + 1;
  if (nTrio = 1) and (fTrio = 1) and (sCB[1] = '0') then
  begin
    Result := 'ноль ';
    i := 2;
    pCB := PChar(sCB) + 2;
  end
  else
  begin
    Result := '';
    if fTrio = 1 then
      sCB := '00' + sCB
    else
    if fTrio = 2 then
      sCB := '0' + sCB;
    pCB := PChar(sCB);
    while nTrio > 0 do
    begin
      if StrLComp(pCB, nilTrio, 3) <> 0 then
      begin
        if pCB[0] > '0' then
        begin
          i := -1;
          Result := Result + A100_900[Integer(pCB[0]) - 49] + ' '
        end;
        if pCB[1] = '1' then
        begin
          i := Integer(pCB[2]) - 39;
          Result := Result + A1_19[i] + ' '
        end;
        if pCB[1] >= '2' then
        begin
          i := -1;
          Result := Result + A20_90[Integer(pCB[1]) - 50] + ' '
        end;
        if (pCB[2] > '0') and (pCB[1] <> '1') then
        begin
          i := Integer(pCB[2]) - 49;
          if (nTrio = 2) and (i < 2) then
            Result := Result +A1_2[i] + ' '
          else
            Result := Result + A1_19[i] + ' ';
        end;
        case i of
          0    : i := 0;
          1..3 : i := 1;
        else
          i := 2;
        end;
        if nTrio > 1 then
        begin
          Result := Result + ABig[(nTrio - 2) * 3 + i] + ' ';
        end;
      end
      else
      begin
        i := 2;
      end;
      nTrio := nTrio - 1;
      pCB := pCB + 3
    end;
    pCB := pCB + 1;
  end;
  Result := Result + AVal[i] + ' ' + StrPas(pCB) + ' ';
  i := IndNum(pCB[1]);
  if pCB[0] = '1' then
    i := 2;
  Result := Result + AVal[i + 3];
  Result[1] := Upper(Result[1]);
end;

function ShortMoneyStr(Sum: Currency): String;
begin
  Result := Format('%0:.0n', [Int(Sum)]) + ' руб. ';
  if Round(Frac(Sum) * 100) < 10 then
    Result := Result + '0';
  Result := Result + FloatToStr(Round(Frac(Sum) * 100)) + ' коп.';
end;

function CurrToCB(sum :currency; DecSep:char): String;
var
  savCurrencyString: String;
  savCurrencyFormat: Byte;
  savNegCurrFormat: Byte;
  savThousandSeparator: Char;
  savDecimalSeparator: Char;
  savCurrencyDecimals: Byte;
  i, j, max: Integer;
begin
  savCurrencyString   := CurrencyString;
  savCurrencyFormat   := CurrencyFormat;
  savNegCurrFormat    := NegCurrFormat;
  savThousandSeparator:= ThousandSeparator;
  savDecimalSeparator := DecimalSeparator;
  savCurrencyDecimals := CurrencyDecimals;

  CurrencyString    := '';
  CurrencyFormat    := 0;
  NegCurrFormat     := 12;
  ThousandSeparator := ' ';
  DecimalSeparator  := DecSep;
  CurrencyDecimals  := 2;
  Result := Format('%.2m', [Sum]);
  CurrencyString    := savCurrencyString;
  CurrencyFormat    := savCurrencyFormat;
  NegCurrFormat     := savNegCurrFormat;
  ThousandSeparator := savThousandSeparator;
  DecimalSeparator  := savDecimalSeparator;
  CurrencyDecimals  := savCurrencyDecimals;
  Max := Length(Result);
  i := 1;
  j := 1;
  while j <= Max do
  begin
    if Result[j] = ' ' then
      j := j + 1;
    Result[i] := Result[j];
    i := i + 1;
    j := j + 1
  end;
  SetLength(Result, i - 1);
end;

function InpCurr(Ed: TEdit): Currency;
var
  S, Buf: String;
  i, j, Max, d: Integer;
begin
  S := Ed.Text;
  i := 1;
  j := 1;
  d := 1;
  Max := Length(S);
  SetLength(Buf, Max + 1);
  while i <= Max do
  begin
    if (S[i] = ' ') or (S[i] = '+') then
    begin
      i:=i+1;
      Continue
    end;
    if (S[i] = '-') and (j = 1) then
    begin
      Buf[j] := S[i];
      i := i + 1;
      j := j + 1;
      Continue
    end;
    if (S[i]>='0') and (S[i]<='9') then
    begin
      Buf[j] := S[i];
      i := i + 1;
      j := j + 1;
      Continue
    end;
    Break
  end;
  if (j = 1) or ((j = 2) and (Buf[1] = '-')) then
  begin
    Buf[j] := '0';
    j := j + 1
  end;
  while (i <= Max) and (d < 100) do
  begin
    if (S[i] >= '0') and (S[i] <= '9') then
    begin
      Buf[j] := S[i];
      i := i + 1;
      j := j + 1;
      d := d * 10
    end
    else
      i := i + 1;
  end;
  SetLength(Buf, j - 1);
  Result := StrToCurr(Buf) / d;
  Ed.Text := CurrToCB(Result, '-');
end;

function InpCurrKv(Ed: TEdit): Currency;
var
  S, Buf: String;
  i, j, Max, d: Integer;
begin
  S := Ed.Text;
  i := 1;
  j := 1;
  d := 1;
  Max := Length(S);
  SetLength(Buf, Max + 1);
  while i <= Max do
  begin
    if (S[i] = ' ') or (S[i]='+') then
    begin
      i := i + 1;
      Continue
    end;
    if (S[i] = '-') and (j = 1) then
    begin
      Buf[j] := S[i];
      i := i + 1;
      j := j + 1;
      Continue
    end;
    if (S[i] >= '0') and (S[i] <= '9') then
    begin
      Buf[j] := S[i];
      i := i + 1;
      j := j + 1;
      Continue
    end;
    Break
  end;
  if (j = 1) or ((j = 2) and (Buf[1] = '-')) then
  begin
    Buf[j] := '0';
    j := j + 1
  end;
  while (i <= Max) and (d < 100) do
  begin
    if (S[i] >= '0') and (S[i] <= '9') then
    begin
      Buf[j] := S[i];
      i := i + 1;
      j := j + 1;
      d := d * 10
    end
    else
      i := i + 1;
  end;
  SetLength(Buf, j - 1);
  Result := StrToCurr(Buf) / d;
  Buf := CurrToStrKv(Result);
  Ed.Text := Buf;
end;

function CurrToStrKv(Sum: Currency): String;
var
  i, Max: Integer;
begin
  Result := CurrToCB(Sum, '-');
  i := 1;
  Max := Length(Result);
  while i <= Max do
  begin
    if i <> 1 then   //потому что падла отрицательные суммы не считала...
    begin
      if Result[i] = '-' then
      begin
        Result[i] := '.';
        Break
      end;
    end;
    i := i + 1
  end;
  if Result[Max] = '0' then
  begin
    Max := Max - 1;
    if Result[max] = '0' then
      Max := Max - 2;
    SetLength(Result, Max)
  end;
  Result := Result + 'р.'
end;

end.
