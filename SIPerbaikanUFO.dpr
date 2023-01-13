program SIPerbaikanUFO;

uses
  Forms,
  menu in 'menu.pas' {home},
  Ubarang in 'Ubarang.pas' {barang},
  Ukonsumen in 'Ukonsumen.pas' {konsumen},
  Uteknisi in 'Uteknisi.pas' {teknisi},
  Uservis in 'Uservis.pas' {servis},
  Upembayaran in 'Upembayaran.pas' {pembayaran},
  Usparepart in 'Usparepart.pas' {part},
  Uuser in 'Uuser.pas' {user},
  Ulaporan in 'Ulaporan.pas' {laporan},
  dm in 'dm.pas' {dm1: TDataModule},
  Ulogin in 'Ulogin.pas' {login},
  USplash in 'USplash.pas' {FSplash},
  Uorder in 'Uorder.pas' {order},
  Ureturbeli in 'Ureturbeli.pas' {returbeli},
  Ureturjual in 'Ureturjual.pas' {returjual},
  Upart2 in 'Upart2.pas' {partmasuk};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFSplash, FSplash);
  Application.CreateForm(Thome, home);
  Application.CreateForm(Tlogin, login);
  Application.CreateForm(Tpart, part);
  Application.CreateForm(Tlaporan, laporan);
  Application.CreateForm(Tservis, servis);
  Application.CreateForm(Tbarang, barang);
  Application.CreateForm(Tteknisi, teknisi);
  Application.CreateForm(Tkonsumen, konsumen);
  Application.CreateForm(Tpembayaran, pembayaran);
  Application.CreateForm(Tuser, user);
  Application.CreateForm(Tdm1, dm1);
  Application.CreateForm(Torder, order);
  Application.CreateForm(Treturbeli, returbeli);
  Application.CreateForm(Treturjual, returjual);
  Application.CreateForm(Tpartmasuk, partmasuk);
  Application.Run;
end.
