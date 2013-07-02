{*******************************************************}
{                                                       }
{                       Coding v1.0                     }
{                   Кодирование ключа                   }
{                                                       }
{            Copyright (c) 2005 by Langolier            }
{                                                       }
{*******************************************************}


unit Coding;

interface

uses
  SysUtils;    // NPN sliced spare modules

const
  A: array[0..35] of char = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var
  i: Integer;

function Code(Incom: String): String;

implementation

function Code(Incom: String): String;
var
  k: Integer;
begin
  Result := '';
  Incom := Trim(Incom);
  if (Length(Incom) = 10) or (Length(Incom) = 12) then
  begin
    if Length(Incom) = 10 then
      Incom := Incom + '00';
    i := (StrToInt(Incom[1] + Incom[2]) + StrToInt(Incom[1] + Incom[2])) mod 36;
    Result := Result + A[i];
    i := (StrToInt(Incom[1] + Incom[2]) + StrToInt(Incom[3] + Incom[4])) mod 36;
    Result := Result + A[i];
    i := (StrToInt(Incom[1] + Incom[2]) + StrToInt(Incom[5] + Incom[6])) mod 36;
    Result := Result + A[i];
    i := (StrToInt(Incom[1] + Incom[2]) + StrToInt(Incom[7] + Incom[8])) mod 36;
    Result := Result + A[i];
    i := (StrToInt(Incom[1] + Incom[2]) + StrToInt(Incom[9] + Incom[10])) mod 36;
    Result := Result + A[i];
    i := (StrToInt(Incom[1] + Incom[2]) + StrToInt(Incom[11] + Incom[12])) mod 36;
    Result := Result + A[i];

    Incom := Trim(Incom);
    if (Incom[11] = '0') and (Incom[12] = '0') then
      Incom := '00' + Copy(Incom, 1, 10);
    i := (StrToInt(Incom[11] + Incom[12]) + StrToInt(Incom[11] + Incom[12])) mod 36;
    Result := Result + A[i];
    i := (StrToInt(Incom[11] + Incom[12]) + StrToInt(Incom[9] + Incom[10])) mod 36;
    Result := Result + A[i];
    i := (StrToInt(Incom[11] + Incom[12]) + StrToInt(Incom[7] + Incom[8])) mod 36;
    Result := Result + A[i];
    i := (StrToInt(Incom[11] + Incom[12]) + StrToInt(Incom[5] + Incom[6])) mod 36;
    Result := Result + A[i];
    i := (StrToInt(Incom[11] + Incom[12]) + StrToInt(Incom[3] + Incom[4])) mod 36;
    Result := Result + A[i];
    i := (StrToInt(Incom[11] + Incom[12]) + StrToInt(Incom[1] + Incom[2])) mod 36;
    Result := Result + A[i];
  end
  else
  begin
    Randomize;
    for k := 1 to 12 do
    begin
      i := Random(35);
      Result := Result + A[i];
    end;
  end;
end;

end.
