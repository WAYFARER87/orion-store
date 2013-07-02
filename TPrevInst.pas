unit TPrevInst;

interface

uses Forms, Windows, Dialogs, SysUtils;

function InitInstance : Boolean;

implementation

const
  UniqueAppStr : PChar = 'IBStore';   // ��������� ��� ������� ����������
                                      // �� ���������� ��� ������ ����� ���������
var
  MessageId : Integer;
  OldWProc : TFNWndProc = Nil;
  MutHandle : THandle = 0;
  SecondExecution : Boolean = False;

function NewWndProc(Handle: HWND; Msg: Integer; wParam, lParam: Longint): Longint; StdCall;
begin
  //- ���� ��� - ��������� � �����������... }
  if (Msg = MessageID) then
    begin
      //- ���� �������� ����� ��������������
      if IsIconic(Application.Handle) then
        begin
          //- ��������������� ��
          Application.Restore;
        end
      else
        begin
          //- ����������� �� �����
          ShowWindow(Application.Handle, SW_SHOW);
          SetForegroundWindow(Application.Handle);
          Application.BringToFront;
      end;
      Result := 0;
    end
  else
    // � ��������� ������ �������� ��������� ����������� ���� }
    Result := CallWindowProc(OldWProc, Handle, Msg, wParam, lParam);
end;

function InitInstance : Boolean;
var
  BSMRecipients: DWORD;
begin
  Result := False;
  //- ������� ������� MUTEX ��������� ���������� ������ ���������
  MutHandle := CreateMutex(Nil, True, UniqueAppStr);
  //- ������ ��� ��� ������ ?
  SecondExecution := (GetLastError = ERROR_ALREADY_EXISTS);
  if (MutHandle = 0) then
    begin
      ShowMessage('������ �������� Mutex.');
      Exit;
    end;
  if Not (SecondExecution) then
    begin
      //- ��������� ����� ���������� ��������� ����������, � ������ ���������
      OldWProc := TFNWndProc(SetWindowLong(Application.Handle, GWL_WNDPROC, Longint(@NewWndProc)));
      //- ���� ���������� �� ������ ������������� ������
      if (OldWProc = Nil) then
        begin
          ShowMessage('������ ������ ������������ ����������� ��������� ����������.');
          Exit;
        end;
      //- ���������� "����������" ������ ��������� ���� ����������
      ShowWindow(Application.Handle, SW_Show);
      //- ������� �������� ����� ����������
      Application.ShowMainForm := True;
      //- ��� ��������� ���� ���� ��� ��� ��� ���� ��� ���
      Result := True;
    end
  else
    begin
      //- ���������� ������ ���� ���������� "���������"
      ShowWindow(Application.Handle, SW_Hide);
      //- �� ������� �������� ����� ����������
      Application.ShowMainForm := False;
      //- �������� ������� ���������� ��������� � ����������� �
      // ������������� ��������� ����� �� ����
      BSMRecipients := BSM_APPLICATIONS;
      BroadCastSystemMessage(BSF_IGNORECURRENTTASK or BSF_POSTMESSAGE, @BSMRecipients, MessageID, 0, 0);
      //ShowMessage('���������� ��� ��������!!!');
    end;
end;

initialization
begin
  //- ������� ��������� ������ ��� ��������� ����������
  //UniqueAppStr := PChar('YoungHackerNetworkDataBaseProgramm');
  //- ���������������� � ������� ���������� ���������
  MessageID := RegisterWindowMessage(UniqueAppStr);
end;

finalization
begin
  if (OldWProc <> Nil) then
    { �������� ���������� � �������� ��������� }
    SetWindowLong(Application.Handle, GWL_WNDPROC, LongInt(OldWProc));
end;

end.
