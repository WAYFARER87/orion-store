unit ssdefines;

interface

{
если ругается на IpHlpApi и IpTypes, добавь в Tools\Environment Options\Library\LibraryPath
путь d:\c\petr\dlib\net
}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Buttons, Db, DBTables, mstring, Math, StrUtils, rxDateUtil,
  ComCtrls, Gauges, Menus, ExtCtrls, IpHlpApi, IpTypes, MMSystem;


type
  Language = (lgRus, lgEng);            //waiting() ss.dll(delphi->lib->type->wait.pas)

  TModeAEC = (mAdd, mEdit, mCopy);

  TQMode = (qmChange, qmNew, qmIgnore); // projects->ndfl_b->unitqst;journal7->ufaevisit, umessage

  TModeFilter = (mIsp, mKln, mDate);

  TModeAdd = (mFirst, mNext);

  TModeNU = (mNac, mUd, mDop, mSpec, mSpecV); //mNac->1-98, mUd->101-198, mDop->202-...,
                                              //mSpec->99,100,200,201
                                              //mSpecV->199

  T_ = array [1..2] of currency;
  T_Arr = array [1..12] of T_;

  TRecAddr = record
    Kod    : string;
    Index  : string;
    Reg    : string;
    RegK   : string;
    Rn     : string;
    RnK    : string;
    Town   : string;
    TownK  : string;
    Point  : string;
    PointK : string;
    Street : string;
    StreetK: string;
    Dom    : string;
    Korp   : string;
    Kv     : string;
  end;

  TRecFind = record
    DataSet: TDataSet;
    Field  : string;
    Value  : variant;
    LocOpt : TLocateOptions;
  end;

  TR = record
    KodV: integer;
    Vych: currency;
  end;
  TArStV = array of TR;

  TR1 = record
    KodD: integer;
    Doh : currency;
    KodV: integer;
    Vych: currency;
    Ost : currency;
  end;
  TArV = array of TR1;

// Journal SF
  TRecSF = record
    Num  : integer;
    Date : TDateTime;
    NCust: integer;
    Cust : string;
    SWNDS: currency;
  end;
  TRecSFData = record
    Goods: string;
    EdIzm: string;
    Qnty : currency;
    SWNDS: currency;
  end;
  TArRecSFData = array of TRecSFData;

// WZAR
  TRecLK = record
    MG     : integer;
    NU     : integer;
    Summ   : currency;
    EdIz   : integer;
    DBit   : integer;
    kodIncl: array of integer;
    Graf   : integer;
    AVGDays: currency;
    PMonth : integer;
    DnCh   : integer;
  end;
  TArRecLK = array of TRecLK;

  TRecNU = record
    NU     : integer;
    Summ   : currency;
    Dn     : currency;
    Ch     : currency;
    Proc   : integer;
    DBit   : integer;
    KodIncl: array of integer;
    Graf   : integer;
    AVGDays: currency;
    PMonth : integer;
  end;
  TRecNac =record
    MG: integer;
    NU: array of TRecNU;
  end;
  TArRecNac = array of TRecNac;
  TArRecNU  = array of TRecNU;
  TRecSG = record
    NU     : integer;
    Summ   : currency;
    Dn     : currency;
    Ch     : currency;
  end;
  TArRecSG = array of TRecSG;
{
  TRInsBuf = record
    Kod: integer;
    Tov: string;
    EI : string;
    Qty: currency;
    Prc: currency;
    smm: currency;
  end;
}

  TAcYear = array of string;

  PNetResourceArray = ^TNetResourceArray;
  TNetResourceArray = array[0..MaxInt div SizeOf(TNetResource) - 1] of TNetResource;

var
  cUDL: string;

const
  _DBW =  1;  // Базы данных бухучет журналы выписка
  _NXW =  2;  // Indices for DBW
  _DBT =  3;  // Базы данных временные
  _BIF =  7;  // Данные для зарплаты                     V
  _BRT =  9;  // Справочники для зарплаты                V
  _BDF = 11;  // Справочники Предприятий, людей          V
  _BRF = 13;  // Справочники бухучет
  _BRD = 15;  // Справочники склад
  _BRA = 17;  // Справочники бухучет, склад
  _KLN = 22;  // Наименование организации

  acMonth : array[1..12] of string = ('Январь','Февраль','Март',
                                      'Апрель','Май','Июнь','Июль',
                                      'Август','Сентябрь','Октябрь',
                                      'Ноябрь','Декабрь');
  acMonth1: array[1..12] of string = ('Января','Февраля','Марта',
                                      'Апреля','Мая','Июня','Июля',
                                      'Августа','Сентября','Октября',
                                      'Ноября','Декабря');
  aEI     : array [1..8] of string = ('руб/мес','руб/час',
                                      'руб/день','%','льгота',
                                      'часть','доп.льг.1',
                                      'доп.льг.2');
  aDniCh  : array [0..15] of string = ('без табеля','рабочие дни',
                              'рабочие часы','больничные дни',
                              'больничные часы','отпускные дни',
                              'отпускные часы',
                              'св.уроч.1 часы','св.уроч.2 часы',
                              'выходные дни','выходные часы',
                              'праздничные дни','праздничные часы',
                              'ночные часы','совместит. дни',
                              'совместит. часы');
  acKodPN : array [1..10] of string = ('Совокупный доход','Дивиденды, не резидент',
                              'Материальная помощь','Мин. льгота/иждивенцы',
                              'Пенсионный фонд','ПН с совок.дохода','ПН с дивидендов',
                              'Вычеты по документам','Материальная выгода',
                              'ПН с мат.выгоды в т.ч.');
{  aSignProc: array [0..2] of string = ('ручн.ввод н/о','программа',
                                      'ручн.ввод обр.');}
  aSignProc: array [0..2] of string = ('ручн.н/обр','программа',
                                      'ручн.обр.');

//procedure Waiting(msec: integer; title, mess: string; Lang: Language); far; external 'ss';
//function Run(h: HWND; X, Y, hght, wght: dword; App: String): TProcessInformation; far; external 'ss';
//procedure DefaultGridTitleColor(Gr: TDBGrid); far; external 'ss';
//procedure SetDelete(oTable:TTable; Value: Boolean); far; external 'ss';

function acMonthScan(s: string): Integer;
function FIO(cFIO: string): string;
function ArVscanRec(aArr: TArV; nI: integer): Integer;
function ArStVScan(aArr: TArStV; nI: integer): Integer;
function FindAvailYears(cPath: string): TAcYear;
function IfEx(m: boolean; r1: variant; r2: variant): variant;
function IsBit(n: word; i: byte): boolean;
function Ulica(s: string): string;
function DecToBase(Decimal: LongInt; const Base: Byte): String;
function CharMirr(s: string): string;
function BinToInt(Value: String): LongInt;
function SetBit(n: word; i: byte; v: char): word;
function CodeX(value: string; key: string): string;
function DeCodeX(value: string; key: string): string;
function PADL(value: string; newlength: word; key: char): string;
function PADR(value: string; newlength: word; key: char): string;
function Replicate(SSS: string; R: word): string;
function Space(R: word): string;
function GetCorrectWayToIBDB(SS: string): string;
function HostName: string;
function CVPath(Qry: TDataSet; int: integer; cdir: string): string;
function SerialNo(RootPathName: string): string;
function CASDown : Boolean; // State = [vk_Shift, vk_Menu, vk_Control]
function GetDataBaseDir(const Alias : string): String; // for *.dbf
function soundCardExists:boolean;
function SetFByte(dbFile: String; Pos: byte; Value: byte): byte;
function IsPF(ISBN: String): Boolean;

procedure BlueColorF(GB: TGroupBox; SetCol: boolean);
procedure GetFullNetName(var SS: string);
Procedure EnumResources(LpNR: PNetResource; List: TStrings);

implementation

function IsPF(ISBN: String): Boolean;
var
  Number, CheckDigit: String;
  CheckValue, CheckSum, Err, check: Integer;
  i, Cnt: Word;
begin
  CheckDigit := Copy(ISBN, Length(ISBN)-1, 2);
  checksum:=0;
  Number := Copy(ISBN, 1, Length(ISBN) - 3);
  if (Length(Number) = 11) then
    begin
      Val(CheckDigit, Check, Err);
      if err<>0 then
        begin
          result:=false;
          exit;
        end;
      Cnt := 1;
      for i := 1 to 12 do
        begin
          if (Pos(Number[i], '0123456789') > 0) then
            begin
              Val(Number[i], CheckValue, Err);
              CheckSum := CheckSum + CheckValue * (10 - Cnt);
              Inc(Cnt);
              if err<>0 then
                begin
                  result:=false;
                  exit;
                end;
            end;
        end;
      while (checksum>100) do checksum:=checksum-101;
      result := (CheckSum = check);
    end
  else
    result := False;
end;

function SetFByte(dbFile: String; Pos: byte; Value: byte): byte;
var
  F: File of byte;
begin
  AssignFile(F, dbFile);
  Reset(F);
  Seek(F,Pos);
  Read(F,result);
  if result <> Value then
    begin
      Reset(F);
      Seek(F,Pos);
      Write(F,Value);
    end;
  CloseFile(F);
end;

function soundCardExists:boolean;
begin
  result:=(WaveOutGetNumDevs>0);
end;

function GetDataBaseDir(const Alias : string): String; // for *.dbf
{var
  sp  : PChar;
  Res : pDBDesc;}
begin
  {try
    New(Res);
    sp := StrAlloc(length(Alias)+1);
    StrPCopy(sp,Alias);
    if DbiGetDatabaseDesc(sp,Res)=0 then
      Result := StrPas(Res^.szPhyName)
    else
      Result := '';
  finally
    StrDispose(sp);
    Dispose(Res);
  end; }
end;

procedure BlueColorF(GB: TGroupBox; SetCol: boolean);
begin
  if setcol then
    begin
      GB.Font.Color:=clBlue;
      GB.Color:=clMoneyGreen;
    end
  else
    begin
      GB.Font.Color:=clWindowText;
      GB.Color:=clBtnFace;
    end;
end;

function CASDown : Boolean;
var
  State : TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[vk_Control] And 128) <> 0)
            and((State[vk_Shift] And 128) <> 0)
            and((State[vk_Menu] And 128) <> 0);
end;

function SerialNo(RootPathName: string): string;
var
  VolumeName,
  FileSystemName : array [0..MAX_PATH-1] of Char;
  VolumeSerialNo : DWord;
  MaxComponentLength,
  FileSystemFlags : dword;
begin
  GetVolumeInformation(PChar(RootPathName),VolumeName,MAX_PATH,@VolumeSerialNo,
    MaxComponentLength,FileSystemFlags,
    FileSystemName,MAX_PATH);
  result:=IntToHex(VolumeSerialNo,8);
end;

function CVPath(Qry: TDataSet; int: integer; cdir: string): string;
begin
  result:='';
  if not qry.Active then qry.Open;
  if qry.IsEmpty or (int > qry.RecordCount) then Exit;
  qry.First;
  qry.MoveBy(int-1);
  if int = _KLN then
    begin
      result:=trim(qry.Fieldbyname('f01').asstring);
      if length(result)<1 then result:='" "';
      Exit;
    end
  else
    result:=excludetrailingbackslash(qry.Fieldbyname('f01').asstring);
// like ..\buh\dbw\ or buh\dbw\
  if (result[1] = '.') or ((result[1] <> '\') and (result[2] <> drivedelim)) then
    result:=includetrailingbackslash(cdir)+result
// like \buh\dbw\
  else if result[1] = '\' then
    result:=extractfiledrive(cdir)+drivedelim+result;
// like c:\buh\dbw\ =result    
end;

procedure GetFullNetName(var SS: string);
var
  cBuf, cHost: string;
begin
  cBuf:= trim(SS);
  if (pos(cBuf,'\\')=1) and fileexists(SS) then
    exit;
  cHost:=HostName();
  if cHost <> 'Error' then
    cbuf:='\\'+cHost+'\'+copy(cbuf,1,1)+copy(cbuf,3,length(cbuf)-2);
  if fileexists(cbuf) then
    SS:=cbuf;
end;

function HostName: string;
var
 FixedInfoSize, Err:DWORD;
 pFixedInfo:PFIXED_INFO;
begin
 FixedInfoSize:=0;
 Err:=GetNetworkParams(nil, FixedInfoSize);
 if (Err<>0) and (Err<>ERROR_BUFFER_OVERFLOW) then
  begin
   HostName:='Error';
   exit;
  end;
 pFixedInfo:=PFIXED_INFO(GlobalAlloc(GPTR, FixedInfoSize));
 GetNetworkParams(pFixedInfo, FixedInfoSize);
 HostName:=StrPas(pFixedInfo.HostName);
end;

function GetCorrectWayToIBDB(SS: string): string;
var
  cBuf, cServ, cPath: string;
  n: integer;
begin
  cBuf:=trim(SS);
  if pos('\\',cBuf)=1 then
    begin
      cbuf:=copy(cbuf,3,length(cbuf)-2);
      n:=pos('\',cbuf);
      cServ:=copy(cbuf,1,n-1)+':';
      cbuf:=copy(cbuf,n+1,length(cbuf)-n);
      cpath:=copy(cbuf,1,1)+':'+copy(cbuf,2,length(cbuf)-1);
      cbuf:=cserv+cpath;
    end;
  result:=cbuf;
end;

function Replicate(SSS: string; R: word): string;
var
  i: integer;
begin
  result:='';
  if R<1 then exit;
  for i:=1 to R do
    result:=result+SSS;
end;

function Space(R: word): string;
begin
  result:=replicate(' ',R);
end;

function PADR(value: string; newlength: word; key: char): string;
var
  old, i, j: integer;
begin
  result:=value;
  old:=length(result);
  setlength(result,newlength);
  i:=length(result)-old;
  if i > 0 then
    for j:=old+1 to length(result) do
      result[j]:=key;
end;

function PADL(value: string; newlength: word; key: char): string;
var
  old, i, j: integer;
begin
  result:='';
  old:=length(value);
  i:=newlength-old;
  if i > 0 then
    begin
      for j:=1 to i do
        result:=result+key;
      result:=result+value;
    end
  else
    begin
      result:=value;
      setlength(result,newlength);
    end;
end;

function CodeX(value: string; key: string): string;
var
  i: integer;
  longkey: string;
begin
  result:='';
  for i := 0 to (length(value) div length(key)) do
    longkey:=longkey+key;
  for i := 1 to length(value) do
    result := result+chr(ord(value[i]) XOR ord(longkey[i]));
end;

function DeCodeX(value: string; key: string): string;
begin
  result:=CodeX(value, key);
end;

function BinToInt(Value: String): LongInt;
var
  i: Integer;
begin
  Result:=0;
// перевернем строку, чтобы i принимало значения действительно от младшего разряда к старшему
  value:=charmirr(value);
  for i:=1 to Length(Value) do
    if Copy(Value,i,1)='1' then
      Result:=Result+(1 shl (i-1));
end;

function DecToBase(Decimal: LongInt; const Base: Byte): String;
const
  Symbols: String[16] = '0123456789ABCDEF';
var
  remainder: Byte;
begin
  result := '';
  repeat
    remainder := Decimal mod Base;
    result := Symbols[remainder + 1] + result;
    Decimal := Decimal div Base;
  until (Decimal = 0);
end;

function CharMirr(s: string): string;
var
  i: integer;
begin
  result:='';
  for i:=length(s) downto 1 do
    result:=result+copy(s, i, 1);
end;

function IsBit(n: word; i: byte): boolean;
var
  s: string;
begin
  s:=charmirr(dectobase(n,2));
  result:=(s[i] = '1');
end;

function SetBit(n: word; i: byte; v: char): word;
var
  s: string;
  j: integer;
begin
  if not(v in ['0','1']) then v:='0';
  s:=charmirr(dectobase(n,2));
  if i>length(s) then
    for j:=length(s)+1 to i do
      s:=s+'0';
  s[i]:=v;
  s:=charmirr(s);
  result:=bintoint(s);
end;

function Ulica(s: string): string;
var
  i: integer;
begin
  result:=s;
  if length(s)<3 then exit;
  i:=pos('МКРН',ansiuppercase(s));
  if i>0 then
    result:=copy(s,1,i-2)+'-й мкр';
  if ansiuppercase(copy(s,length(s)-2,3))=' УЛ' then
    result:=copy(s,1,length(s)-3);
end;

function IfEx(m: boolean; r1: variant; r2: variant): variant;
begin
  if m then
    result:=r1
  else
    result:=r2;
end;

function acMonthScan(s: string): Integer;
var
  i: integer;
begin
  result := -1;
  for i:=low(acmonth) to high(acmonth) do
    begin
      if acmonth[i] = s then
        begin
          result:=i;
          Exit;
        end;
    end;
end;

function FIO(cFIO: string): string;
var
  nFio, nProbel: integer;
  cFam, cName, cOtch: string;
begin
  cFIO:=Trim(cFIO);
  if length(cfio)<1 then
    begin
      result:=',,';
      exit;
    end;
  nFIO:=Length(cFIO);
  nprobel:=Pos(' ',cfio);
  if nprobel=0 then
    begin
      result:=cfio+','+',';
      exit;
    end;
  cfam:=copy(cFio,1,nprobel-1);
  cFio:=copy(cFio,nprobel+1,nFio-nprobel);
  cfio:=Trim(cFio);
  nprobel:=pos(' ',cFio);
  if nprobel=0 then
    begin
      result:=cfam+','+cfio+',';
      exit;
    end;
  nFIO:=Length(cFio);
  cName:=copy(cFio,1,nprobel-1);
  cotch:=copy(cFio,nprobel+1,nfio-nprobel);
  result:=ansiuppercase(cfam+','+cName+','+cotch);
end;

function ArVscanRec(aArr: TArV; nI: integer): Integer ;
var
  i: integer;
begin
  Result := -1;
  for i:=Low(aArr) to High(aArr) do
    begin
      if aArr[i].KodD = nI then
        begin
          Result:=i;
          Exit;
        end;
    end;
end;

function ArStVscan(aArr: TArStV; nI: integer): Integer ;
var
  i: integer;
begin
  Result := -1;
  if High(aArr) < 0 then exit;
  for i:=Low(aArr) to High(aArr) do
    begin
      if aArr[i].KodV = nI then
        begin
          Result:=i;
          Exit;
        end;
    end;
end;

{
****************************************************************
Определение расчетных периодов(год), за которые
  имеются зарплатные данные.
    cPath  - полный путь (c:\buh\zar\tn__??.db?)
    result - дин.массив строк ( ['2004','1983','2001','2005'] )
    SET EPOCH TO 1980
****************************************************************
}
function FindAvailYears(cPath: string): TAcYear;
var
  aY: TAcYear;
  SR: TSearchRec;
  i : integer;
begin
  i:=1;
  if FindFirst(cPath, faAnyfile, SR) = 0 then
    begin
      SetLength(aY,i);
      if strtoint(copy(sr.Name,5,2)) > 80 then
        aY[i-1]:='19'+copy(sr.Name,5,2)
      else
        aY[i-1]:='20'+copy(sr.Name,5,2);
      while FindNext(SR) = 0 do
        begin
          inc(i);
          SetLength(aY,i);
          if strtoint(copy(sr.Name,5,2)) > 80 then
            aY[i-1]:='19'+copy(sr.Name,5,2)
          else
            aY[i-1]:='20'+copy(sr.Name,5,2);
        end;
      FindClose(SR);
    end;
  result:=aY;
end;

Procedure EnumResources(LpNR: PNetResource; List: TStrings);
Var
  NetHandle: DWORD;
  BufSize: DWORD;
  Size:DWORD;
  NetResources: PNetResourceArray;
  Count: DWORD;
  NetResult:Integer;
  I: Integer;
//  NewItem:TListItem;
Begin
  If WNetOpenEnum(RESOURCE_GLOBALNET, RESOURCETYPE_ANY,0,LpNR,NetHandle) <> NO_ERROR then
    Exit;
  Try
    BufSize := 50 * SizeOf(TNetResource);
    GetMem(NetResources, BufSize);
    Try
      while True do
        begin
          Count := 1;
          Size := BufSize;
          NetResult := WNetEnumResource(NetHandle, Count, NetResources, Size);
          If NetResult = ERROR_MORE_DATA then
            begin
              BufSize := Size;
              ReallocMem(NetResources, BufSize);
              Continue;
            end;
          if NetResult <> NO_ERROR then
            Exit;
          For I := 0 to Count-1 do
            Begin
              With NetResources^[I] do
                Begin
                  If RESOURCEUSAGE_CONTAINER =(DwUsage and RESOURCEUSAGE_CONTAINER) then
                    EnumResources(@NetResources^[I], List);
                  If dwDisplayType = RESOURCEDISPLAYTYPE_SERVER Then
// ^^^^^^^^^^^^^^^^^^^^^^^^^ - ресурс
// RESOURCEDISPLAYTYPE_SHARE - диски
// RESOURCEDISPLAYTYPE_SERVER - компьютер
// RESOURCEDISPLAYTYPE_DOMAIN - рабочая группа
// RESOURCEDISPLAYTYPE_GENERIC - сеть
                    Begin
                      {NewItem:= Form1.ListView1.Items.Add;
                      NewItem.Caption:=LpRemoteName;}
                      List.Add(copy(LpRemoteName,3,length(LpRemoteName)-2));
                    End;
                End;
            End;
        End;
    finally
      FreeMem(NetResources, BufSize);
    end;
  finally
    WNetCloseEnum(NetHandle);
  end;
End;

end.
