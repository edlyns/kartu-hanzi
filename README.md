# Flashcard Hanzi

Web flashcard kosakata Mandarin yang **kata-katanya diisi sendiri**, untuk persiapan ujian HSK.

Dibuat untuk teman saya dan saya yang sedang belajar HSK. Aplikasi flashcard yang ada biasanya memakai daftar kata yang sudah paten dan tidak bisa diubah. Kita ingin menghafal kata-kata pilihannya sendiri.

🔗 **Coba web-nya:** _(https://flashcardhanzi.netlify.app)_

## Fitur

- **Kata buatan sendiri:** tambah, ubah, dan hapus kata (hanzi, pinyin, arti Indonesia, contoh kalimat).
- **Saran hanzi dari pinyin:** ketik `bijiao` atau `bi3jiao4`, lalu pilih 比较 dari kamus sekitar 11.800 kata HSK 1–7.
- **Pinyin otomatis:** angka nada diubah jadi tanda nada (`li4ru2` → lìrú).
- **Mode belajar:** kartu bisa dibalik dan diacak, ada tanda "sudah hafal / belum", dan pelafalan suara.
- **Login:** kata-kata tersimpan di akun, jadi bisa dibuka dari HP maupun laptop.
- **Cadangan:** export dan import kata dalam bentuk file.
- Tampilan berbahasa Indonesia, nyaman di HP, dan mendukung mode gelap.

## Teknologi

- HTML, CSS, dan JavaScript biasa (tanpa framework)
- [Supabase](https://supabase.com) untuk login dan database, dengan Row Level Security supaya setiap pengguna hanya bisa melihat kata miliknya sendiri
- [Netlify](https://netlify.com) untuk hosting

## Struktur file

| File                 | Isi                                                          |
| -------------------- | ------------------------------------------------------------ |
| `index.html`         | Seluruh tampilan dan logika aplikasi                         |
| `config.js`          | Alamat dan kunci publik Supabase                             |
| `hsk.txt`            | Kamus HSK untuk saran hanzi                                  |
| `supabase-setup.sql` | Perintah untuk membuat tabel dan aturan keamanan di Supabase |
| `PANDUAN.md`         | Panduan langkah demi langkah untuk meng-online-kan web ini   |

## Menjalankan sendiri

1. Buat project di Supabase, lalu jalankan `supabase-setup.sql` di SQL Editor.
2. Isi `config.js` dengan Project URL dan publishable/anon key milikmu.
3. Buka `index.html` lewat server lokal (misalnya Live Server di VS Code), atau upload ke Netlify.

Panduan lengkapnya ada di [PANDUAN.md](PANDUAN.md).

## Sumber data

Kamus HSK berasal dari [complete-hsk-vocabulary](https://github.com/drkameleon/complete-hsk-vocabulary) (lisensi MIT). Arti bahasa Inggrisnya berasal dari [CC-CEDICT](https://www.mdbg.net/chinese/dictionary?page=cedict) (lisensi CC BY-SA 4.0).
