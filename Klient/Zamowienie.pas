unit Zamowienie;

interface
uses
Data.DB,UData,dialogs,Pozycja;

type
  TZamowienie = class

  public
   Data_zamowienia : string;
   idzamowienia : Integer;
   iduzytkownicy: Integer;
   idstatusy: Integer;
   numer_zamowienia : Integer;
   pozycje : array of TPozycja;




  constructor Create(Data_zamowienia : string; idzamowienia: Integer; iduzytkownicy:Integer; idstatusy: integer; numer_zamowienia:Integer); overload;
  procedure Insert(Poz : TPozycja);
  procedure Update;
  procedure Delete;
  procedure DodajPozycje(Poz : TPozycja);
  procedure UsunPozycje(Id: Integer);

end;

implementation
constructor TZamowienie.Create(Data_zamowienia : string; idzamowienia: Integer; iduzytkownicy:Integer; idstatusy: integer; numer_zamowienia:Integer);
begin
   Self.Data_zamowienia := Data_zamowienia;
   Self.idzamowienia := idzamowienia;
   Self.iduzytkownicy := iduzytkownicy;
   Self.idstatusy := idstatusy;
   Self.numer_zamowienia := numer_zamowienia;
end;


procedure TZamowienie.Update;
begin
  with DataModule1.zqryinsert, SQL do
  begin
      Close;
      Clear;
      Add('UPDATE zamowienia SET idstatusy=:idstat where numer_zamowienia=:num');
      ParamByName('idstat').AsInteger:=Self.idstatusy;
      ParamByName('num').AsInteger:=Self.numer_zamowienia;
      ExecSQL;
      Close;
  end;
end;

procedure TZamowienie.Delete;
begin
   with DataModule1.zqryinsert, SQL do
  begin
      Close;
      Clear;
      Add('Delete From zamowienia where numer_zamowienia=:numer');
      ParamByName('numer').AsInteger:=Self.numer_zamowienia;
      ExecSQL;
      Close;
  end;
end;

procedure TZamowienie.DodajPozycje(Poz : TPozycja);
var i : Integer;
    flaga : Boolean;
begin
  flaga:=True;
  for I := 0 to Length(Self.pozycje)-1 do
    begin
      flaga:=True;
      if (self.pozycje[i]<>nil) AND (self.pozycje[i].nazwa = Poz.nazwa) then
      begin
        flaga := False;
        Self.pozycje[i].ilosc := Self.pozycje[i].ilosc + Poz.ilosc;
        Self.pozycje[i].AktualizujWartosc;
        Break;
      end;
    end;
    if flaga then
    begin
      SetLength(Self.pozycje,Length(self.pozycje)+1);
      Self.pozycje[Length(self.pozycje)-1] := Poz;
    end;

end;

procedure TZamowienie.UsunPozycje(Id: Integer);
var i : Integer;
begin
  for I := 0 to Length(Self.pozycje)-1 do
  begin
    if (self.pozycje[i]<>nil) AND (self.pozycje[i].idpozycje = Id) then
    begin
      if Self.pozycje[i].ilosc>1 then
      begin
          self.pozycje[i].DeleteNumer(self.numer_zamowienia);
          Self.pozycje[i].ilosc := Self.pozycje[i].ilosc -1;
          Self.pozycje[i].AktualizujWartosc;
          Break;
      end
      else
      begin;
         self.pozycje[i].DeleteNumer(self.numer_zamowienia);
         Self.pozycje[i] := nil;
         Break;
      end;
    end;
    
  end;

end;

procedure TZamowienie.Insert(Poz : TPozycja);
var i,j : Integer;
    flagaplus,flaganowy : Boolean;
begin
  flagaplus:=True;
  flaganowy:=True;
  for I := 0 to Length(Self.pozycje)-1 do
    begin
      flagaplus:=True;
      if (self.pozycje[i]<>nil) and (self.pozycje[i].nazwa = Poz.nazwa) then
      begin
        try
        for j := 1 to Poz.ilosc do
        begin
          Self.pozycje[i].Insert(Self.iduzytkownicy,Self.idstatusy,Self.numer_zamowienia,Self.Data_zamowienia);
        end;
        flagaplus := False;
        Self.pozycje[i].ilosc := Self.pozycje[i].ilosc + poz.ilosc;
        self.pozycje[i].idpozycje := Poz.idpozycje;
        self.pozycje[i].AktualizujWartosc();
        finally

        end;
         Break;
      end ;
    end;

    if flagaplus=true then
    begin
      for I := 0 to Length(Self.pozycje)-1 do
      begin
        if (self.pozycje[i]=nil) then
        begin
          flaganowy := False;
          try
            Self.pozycje[i] := Poz;
            for j := 1 to Poz.ilosc do
            begin
            Self.pozycje[i].Insert(Self.iduzytkownicy,Self.idstatusy,Self.numer_zamowienia,Self.Data_zamowienia);
            end;
          except
           Self.pozycje[i] := nil;
          end;
          Break;

          if flagaplus then
          begin
            Break;
          end;
        end;
      end;

    if flaganowy = True then
    begin
      try
        for j := 1 to Poz.ilosc do
        begin
          Poz.Insert(Self.iduzytkownicy,Self.idstatusy,Self.numer_zamowienia,Self.Data_zamowienia);
        end;
        SetLength(Self.pozycje,Length(self.pozycje)+1);
        Self.pozycje[Length(self.pozycje)-1] := Poz;
      finally
      end;
    end;
    end;



end;
end.
