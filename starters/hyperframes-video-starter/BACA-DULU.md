# Starter project: HTML jadi video

Halo! Ini starter project yang aku janjikan. Isinya satu video pendek (8 detik, 1080x1920, cocok untuk Reels/TikTok) yang seluruhnya dibuat dari satu file HTML, lalu direkam jadi MP4 oleh HyperFrames, framework open source dari HeyGen.

Tujuannya sederhana: kamu bisa lihat sendiri cara kerjanya, lalu ubah pakai AI agent.

## Isi folder

| Berkas | Fungsinya |
|---|---|
| `index.html` | Videonya. 3 scene, teks, warna, dan animasi ada di sini. |
| `PROMPT.md` | Prompt untuk membuat video serupa dari nol, plus 3 variasi. |
| `assets/fonts/` | Font Inter dan JetBrains Mono (lisensi OFL, file lisensinya ada di folder yang sama). |
| `assets/vendor/gsap.min.js` | Library animasi GSAP, disimpan lokal supaya render tidak butuh internet. |
| `package.json`, `hyperframes.json`, `meta.json` | Pengaturan proyek HyperFrames. |
| `CLAUDE.md`, `AGENTS.md` | Petunjuk untuk AI agent (Claude Code, Codex, Cursor) supaya mengikuti aturan HyperFrames. Biarkan saja. |

## Yang kamu butuhkan

- **Node.js versi 22 atau lebih baru.** Cek dengan `node -v`.
- **FFmpeg**, dipakai untuk menyusun MP4.
- **AI agent** yang bisa menjalankan perintah di terminal, misalnya Claude Code. Ini opsional untuk sekadar preview dan render, tapi dipakai kalau mau mengubah video lewat prompt.
- Koneksi internet **untuk pertama kali saja**: `npx` perlu mengunduh HyperFrames dan browser yang dipakai untuk merekam.

Cara paling cepat mengecek semuanya, dari dalam folder ini:

```bash
npx hyperframes doctor
```

Baris Node.js dan FFmpeg perlu bertanda ✓. Kalau baris Chrome belum ✓, unduh dulu dengan `npx hyperframes browser ensure`. Baris Docker, TTS, dan BGM boleh ✗, tidak dipakai di starter ini.

## Cara preview

Buka terminal di folder ini, lalu:

```bash
npx hyperframes preview
```

Browser akan terbuka dan menampilkan videonya dengan timeline. Kamu bisa putar, maju-mundur per frame, dan lihat tiap scene.

## Cara render jadi MP4

```bash
npx hyperframes render
```

Hasilnya masuk ke folder `renders/`. Waktu aku uji di laptop Apple M4, render 8 detik ini selesai sekitar 10 detik. Di laptop lain bisa lebih lama.

Setelah unduhan pertama, render tidak butuh internet: font dan GSAP sudah ada di folder ini, dan `index.html` tidak memanggil alamat luar apa pun.

## Mengubah videonya

Ada dua cara:

1. **Edit langsung `index.html`.** Warna ada di bagian `:root` di atas, teks ada di tiap `<section>`, dan waktu animasi ada di bagian `<script>` paling bawah. Angka terakhir di tiap baris animasi adalah detik mulainya.
2. **Minta AI agent.** Buka AI agent di folder ini, lalu tempel salah satu prompt dari `PROMPT.md`.

Kalau kamu pakai Claude Code, jalankan sekali dulu supaya agent membaca aturan HyperFrames:

```bash
npx hyperframes skills update
```

Setiap selesai mengubah, jalankan:

```bash
npx hyperframes check
```

Yang penting **0 error**. Di starter ini akan muncul 3 peringatan `nested_structure_needs_subcomposition`. Itu saran untuk memecah tiap scene ke file terpisah. Sengaja tidak aku lakukan supaya semua isi video ada di satu file dan mudah dibaca. Aman diabaikan.

## Batasan yang perlu kamu tahu

- **Ini bukan editor drag-and-drop** seperti CapCut atau Canva. Videonya adalah kode. Preview memang bisa dipakai untuk melihat dan menyetel hal kecil, tapi perubahan layout dan animasi tetap lewat kode, ditulis sendiri atau lewat AI agent.
- **Belum ada audio.** Starter ini sengaja tanpa musik dan suara. HyperFrames bisa menambah audio, tapi itu di luar isi starter ini.
- **AI agent bisa salah.** Hasilnya tergantung prompt dan agent yang kamu pakai. Selalu jalankan `npx hyperframes check` dan lihat preview sebelum render.
- **Render butuh ruang disk kosong** untuk file sementara. Kalau muncul pesan `Low disk space`, kosongkan disk dulu, atau arahkan folder sementara ke disk lain, misalnya `TMPDIR=/path/ke/disk/lain npx hyperframes render`.

## Lisensi

- Inter dan JetBrains Mono: SIL Open Font License 1.1 (`assets/fonts/OFL-*.txt`).
- GSAP: tunduk pada ketentuan di https://gsap.com/standard-license.
- HyperFrames: Apache-2.0.

Selamat mencoba. Kalau sudah jadi, aku senang sekali kalau kamu kirim hasilnya.
