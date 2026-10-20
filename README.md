# flowmind-labs-share

Bahan gratis yang dibagikan dari konten Instagram [@flowmind.labs](https://instagram.com/flowmind.labs), disajikan di https://labs.flowmind.my.id.

## Struktur

- `public/`: situs statis yang di-deploy Vercel (tanpa build). Satu folder per bahan, misalnya `public/hyperframes/`.
- `starters/`: sumber starter project. Ini versi yang dibagikan; ubah di sini, bukan di folder produksi.
- `bangun.sh`: bungkus `starters/` jadi zip di `public/`. Jalankan setiap kali isi starter berubah, lalu commit zip-nya.

## Menambah bahan baru

1. Buat `public/<nama>/index.html` (salin pola `public/hyperframes/index.html`).
2. Tambahkan kartunya di `public/index.html`.
3. Push ke `main`. Vercel men-deploy otomatis.

## Bahan

| Alamat | Isi | Kata CTA |
|---|---|---|
| `/hyperframes` | Starter project HyperFrames: video 8 detik dari satu file HTML + prompt | VIDEO |
