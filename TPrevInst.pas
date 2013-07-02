unit TPrevInst;

interface

uses Forms, Windows, Dialogs, SysUtils;

function InitInstance : Boolean;

implementation

const
  UniqueAppStr : PChar = 'IBStore';   // –азличное дл€ каждого приложени€
                                      // Ќо одинаковое дл€ каждой копии программы
var
  MessageId : Integer;
  OldWProc : TFNWndProc = Nil;
  MutHandle : THandle = 0;
  SecondExecution : Boolean = False;

function NewWndProc(Handle: HWND; Msg: Integer; wParam, lParam: Longint): Longint; StdCall;
begin
  //- ≈сли это - сообщение о регистрации... }
  if (Msg = MessageID) then
    begin
      //- если основна€ форма минимизирована
      if IsIconic(Application.Handle) then
        begin
          //- восстанавливаем ее
          Application.Restore;
        end
      else
        begin
          //- вытаскиваем на перед
          ShowWindow(Application.Handle, SW_SHOW);
          SetForegroundWindow(Application.Handle);
          Application.BringToFront;
      end;
      Result := 0;
    end
  else
    // ¬ противном случае посылаем сообщение предыдущему окну }
    Result := CallWindowProc(OldWProc, Handle, Msg, wParam, lParam);
end;

function InitInstance : Boolean;
var
  BSMRecipients: DWORD;
begin
  Result := False;
  //- пробуем открыть MUTEX созданный предыдущей копией программы
  MutHandle := CreateMutex(Nil, True, UniqueAppStr);
  //- ћутекс уже был создан ?
  SecondExecution := (GetLastError = ERROR_ALREADY_EXISTS);
  if (MutHandle = 0) then
    begin
      ShowMessage('ќшибка создани€ Mutex.');
      Exit;
    end;
  if Not (SecondExecution) then
    begin
      //- назначаем новый обработчик сообщений приложени€, а старый сохран€ем
      OldWProc := TFNWndProc(SetWindowLong(Application.Handle, GWL_WNDPROC, Longint(@NewWndProc)));
      //- если обработчик не найден устанавливаем ошибку
      if (OldWProc = Nil) then
        begin
          ShowMessage('ќшибка поиска стандартного обработчика сообщений приложени€.');
          Exit;
        end;
      //- ”становить "нормальный" статус основного окна приложени€
      ShowWindow(Application.Handle, SW_Show);
      //- покажем основную форму приложени€
      Application.ShowMainForm := True;
      //- все нормально мама трын тин тин тин тири тын тын
      Result := True;
    end
  else
    begin
      //- установить статус окна приложени€ "невидимый"
      ShowWindow(Application.Handle, SW_Hide);
      //- Ќе покажем основную форму приложени€
      Application.ShowMainForm := False;
      //- ѕосылаем другому приложению сообщение и информируем о
      // необходимости перевести фокус на себ€
      BSMRecipients := BSM_APPLICATIONS;
      BroadCastSystemMessage(BSF_IGNORECURRENTTASK or BSF_POSTMESSAGE, @BSMRecipients, MessageID, 0, 0);
      //ShowMessage('ѕриложение уже запущено!!!');
    end;
end;

initialization
begin
  //- —оздать ункальную строку дл€ опознани€ приложени€
  //UniqueAppStr := PChar('YoungHackerNetworkDataBaseProgramm');
  //- «арегистрировать в системе уникальное сообщение
  MessageID := RegisterWindowMessage(UniqueAppStr);
end;

finalization
begin
  if (OldWProc <> Nil) then
    { ѕриводим приложение в исходное состо€ние }
    SetWindowLong(Application.Handle, GWL_WNDPROC, LongInt(OldWProc));
end;

end.
