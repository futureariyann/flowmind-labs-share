# Prompt

Semua prompt di bawah ditulis untuk AI agent yang bisa menjalankan perintah di terminal, misalnya Claude Code. Salin isi kotak kode, tempel ke agent, lalu biarkan agent bekerja.

Kalau kamu pakai Claude Code, jalankan sekali dulu supaya agent membaca aturan HyperFrames:

```bash
npx hyperframes skills update
```

## Prompt utama: buat video ini dari nol

Jalankan di folder kosong.

```text
Buat proyek video HyperFrames baru di folder ini. Mulai dengan:
npx hyperframes init video-saya --example blank --resolution portrait --non-interactive

Spesifikasi video:
- Kanvas 1080x1920, durasi 8 detik.
- 3 scene berurutan, masing-masing sekitar 2,7 detik:
  1. Label kecil "01 · Tulis HTML", kartu kode gelap berisi potongan HTML pendek yang muncul baris demi baris, lalu judul besar "Video ini dibuat dari HTML."
  2. Label "02 · Gerakkan dengan GSAP", layar mini 9:16 berisi teks "Halo, video." yang naik kata demi kata dan sebuah bola yang bergeser, di bawahnya garis timeline dengan playhead yang berjalan, lalu judul "Animasi dikunci ke timeline."
  3. Label "03 · Render jadi MP4", angka persen dari 0 ke 100 bersamaan dengan progress bar, chip "video.mp4 · 1080×1920" dengan tanda centang, lalu judul "Dirender di laptopmu, bisa offline."
- Scene 1 dan 2 keluar dengan fade dan naik sedikit sebelum scene berikutnya masuk.
- Gaya: latar terang netral #f4f3ee, teks hampir hitam #141414, satu warna aksen biru #2b59e8. Simpan semua warna sebagai CSS variable di :root.
- Font: Inter untuk teks, JetBrains Mono untuk kode dan label. Unduh file font-nya ke assets/fonts beserta file lisensi OFL-nya, pasang dengan @font-face. Jangan ambil dari Google Fonts saat render.
- Simpan gsap.min.js di assets/vendor dan panggil dari sana, supaya render tidak butuh internet.

Aturan HyperFrames yang wajib dipatuhi:
- Root <div> dengan data-composition-id="main", data-width="1080", data-height="1920", data-duration="8".
- Setiap scene adalah <section class="clip"> dengan data-start dan data-duration.
- Satu timeline GSAP dengan paused: true, didaftarkan di window.__timelines["main"]. Jangan panggil tl.play().
- Deterministik: tanpa Math.random(), Date.now(), atau fetch.
- Jangan animasikan visibility atau display pada elemen .clip. Animasikan elemen di dalamnya.
- Jangan pasang transform di CSS pada elemen yang juga digerakkan GSAP. Pakai fromTo.

Setelah selesai:
1. Jalankan npx hyperframes check sampai 0 error.
2. Ambil snapshot: npx hyperframes snapshot --at 1.6,4.3,7.6, lihat gambarnya, dan perbaiki kalau ada teks terpotong atau bertabrakan.
3. Beri tahu aku cara preview dan render.
```

## Variasi 1: ganti teks

Jalankan di folder starter ini.

```text
Ubah teks video di index.html untuk topik: [TULIS TOPIKMU, misalnya "3 langkah bikin konten mingguan"].
- Ganti label dan judul di ketiga scene sesuai topik itu. Judul maksimal 6 kata supaya muat dua baris.
- Ganti isi kartu kode di scene 1 dan teks di layar mini scene 2 supaya nyambung dengan topiknya.
- Pertahankan durasi, warna, font, dan semua animasi.
Lalu jalankan npx hyperframes check sampai 0 error dan ambil snapshot di 1.6, 4.3, 7.6 untuk memastikan tidak ada teks yang terpotong.
```

## Variasi 2: ganti warna

```text
Ubah index.html ke mode gelap. Ganti hanya variabel warna di :root:
--bg #0f1012, --ink #f2f2ee, --accent #22c55e, --card #1c1d22.
Sesuaikan juga warna abu-abu terang yang tertulis langsung di CSS (.track dan .bar, nilainya #d9d8d1) supaya tetap terlihat di latar gelap, dan pindahkan warna itu ke variabel baru di :root.
Jangan ubah teks, layout, atau animasi.
Lalu jalankan npx hyperframes check. Pastikan 0 error dan semua cek kontras lolos.
```

## Variasi 3: tambah scene

```text
Tambahkan scene ke-4 di index.html, setelah scene 3:
- Mulai di detik 8, durasi 2,5 detik. Ubah data-duration root dari 8 menjadi 10.5.
- Isinya: label "04 · Giliranmu" dan judul besar "Ubah satu baris, render lagi."
- Ikuti pola scene lain: <section class="clip"> dengan data-start dan data-duration, isi di dalam .stack, animasi masuk memakai objek rise yang sudah ada.
- Scene 3 sekarang perlu animasi keluar (fade dan naik sedikit) seperti scene 1 dan 2, sekitar 0,35 detik sebelum scene 3 berakhir.
Lalu jalankan npx hyperframes check sampai 0 error dan ambil snapshot di 7.6 dan 9.5 untuk mengecek perpindahannya.
```
