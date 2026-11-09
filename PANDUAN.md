# Panduan: Jadikan Kartu Hanzi Web Beneran (dengan Login)

Hasil akhirnya: web dengan alamat sendiri, misalnya `kartu-hanzi-isna.netlify.app`. Kak Isna bisa daftar pakai email, dan kata-katanya ikut muncul di HP maupun laptop.

**Yang dipakai (semuanya gratis):**
- **Supabase**: tempat menyimpan akun dan kata-kata (database).
- **Netlify**: tempat menaruh web supaya bisa dibuka siapa saja.

**Yang kamu butuhkan:** laptop (lebih gampang daripada HP), email, dan waktu sekitar 30–45 menit.

> Tampilan Supabase dan Netlify kadang berubah sedikit. Kalau nama tombolnya agak beda dari panduan ini, cari yang paling mirip. Kalau bingung, kirim screenshot ke aku.

---

## Langkah 1: Unduh file web-nya

1. Unduh **kartu-hanzi-web.zip** dari pesanku di thread.
2. Klik kanan → **Extract / Ekstrak**. Hasilnya folder `kartu-hanzi` berisi 4 file:
   - `index.html` → halaman webnya
   - `hsk.txt` → kamus HSK untuk saran hanzi
   - `config.js` → tempat "kunci" Supabase (diisi di Langkah 5)
   - `supabase-setup.sql` → perintah untuk membuat tabel (dipakai di Langkah 3)

## Langkah 2: Buat project di Supabase

1. Buka **https://supabase.com** → klik **Start your project**.
2. Daftar pakai email (atau akun GitHub kalau punya).
3. Klik **New project**, lalu isi:
   - **Name**: `kartu-hanzi`
   - **Database Password**: klik *Generate*, lalu **simpan password ini** di catatanmu.
   - **Region**: pilih **Southeast Asia (Singapore)** supaya cepat dari Indonesia.
4. Klik **Create new project**, lalu tunggu 1–2 menit sampai selesai disiapkan.

## Langkah 3: Buat tabel untuk kata-kata

1. Di menu kiri Supabase, klik **SQL Editor**.
2. Klik **New query**.
3. Buka file `supabase-setup.sql` pakai Notepad (Windows) atau TextEdit (Mac), **salin semua isinya**, lalu tempel di kotak SQL Editor.
4. Klik **Run**.
5. Kalau muncul tulisan **"Success. No rows returned"**, berarti berhasil ✅

Isi file itu juga sudah termasuk aturan keamanan: setiap orang **hanya bisa melihat kata miliknya sendiri**.

## Langkah 4: Atur cara login

1. Menu kiri → **Authentication** → **Sign In / Providers** (kadang namanya **Providers**).
2. Pastikan **Email** dalam keadaan **aktif** (biasanya sudah aktif).
3. **Disarankan:** matikan **Confirm email**, lalu klik **Save**.
   - Kalau dimatikan, Kak Isna bisa langsung masuk setelah daftar, tanpa menunggu email konfirmasi.
   - Kalau tetap dinyalakan, setiap pendaftar harus klik link di email dulu. Email gratis Supabase jumlahnya terbatas per jam dan kadang masuk ke folder spam.

## Langkah 5: Ambil "kunci" Supabase dan isi `config.js`

1. Menu kiri → **Project Settings** (ikon gerigi) → **API** (atau **API Keys**).
2. Salin dua hal ini:
   - **Project URL**, bentuknya seperti `https://abcdefgh.supabase.co`
   - **anon public key** (kadang disebut **publishable key**), berupa teks panjang.
   - ⚠️ **Jangan** pakai yang bernama **service_role** atau **secret**. Itu kunci rahasia.
3. Buka `config.js` pakai Notepad/TextEdit. Ganti teksnya jadi seperti ini (tanda kutipnya tetap ada):
   ```js
   window.KARTU_CONFIG = {
     supabaseUrl: "https://abcdefgh.supabase.co",
     supabaseKey: "eyJhbGciOi...teks-panjang..."
   };
   ```
4. Simpan file (Ctrl+S / Cmd+S).

> Mau gampang? Kirim saja **Project URL** dan **anon public key** ke aku di thread. Kunci *anon* memang aman dibagikan, karena memang dipasang di web. Nanti aku kirim balik `config.js` yang sudah terisi.

## Langkah 6: Upload web ke Netlify

1. Buka **https://app.netlify.com/drop**.
2. Daftar/masuk (bisa pakai email).
3. **Seret (drag) seluruh folder `kartu-hanzi`** ke kotak di halaman itu.
4. Tunggu beberapa detik. Kamu akan dapat alamat acak, misalnya `https://lucky-panda-12345.netlify.app`. Web-mu sudah online! 🎉
5. Ganti namanya biar cantik: buka **Site configuration** → **Change site name** → isi `kartu-hanzi-isna` → **Save**.
   Alamatnya sekarang jadi `https://kartu-hanzi-isna.netlify.app` (kalau nama itu sudah dipakai orang lain, pilih nama lain).

## Langkah 7: Kenalkan alamat web ke Supabase

1. Kembali ke Supabase → **Authentication** → **URL Configuration**.
2. Di **Site URL**, isi alamat Netlify-mu, misalnya `https://kartu-hanzi-isna.netlify.app`.
3. Klik **Save**.

Langkah ini penting supaya link di email (konfirmasi akun, dan lain-lain) mengarah ke web-mu.

## Langkah 8: Coba sendiri dulu

1. Buka alamat web-mu.
2. Di pojok kanan atas ada tombol **Masuk**. Klik, lalu isi email dan kata sandi (minimal 6 karakter), kemudian klik **Daftar akun baru**.
3. Tambah 1–2 kata di tab **Daftar Kata**.
4. Buka web yang sama di HP, lalu masuk dengan email yang sama. Kata-katanya harus muncul ✅
5. Cek di Supabase: **Table Editor** → **words**. Kata-katamu kelihatan di sana.

## Langkah 9: Kirim ke Kak Isna

Kirim alamat web-nya. Kak Isna klik **Masuk**, lalu **Daftar akun baru** pakai emailnya sendiri. Kata-kata dia terpisah dari punyamu.

**Tips untuk Kak Isna:** di HP, buka web-nya lalu pilih **Add to Home Screen / Tambahkan ke layar utama**. Nanti muncul ikon seperti aplikasi.

---

## Kalau nanti ada perubahan dari aku

1. Unduh file baru yang aku kirim, lalu timpa file lama di folder `kartu-hanzi`. **`config.js` jangan ditimpa** kalau sudah kamu isi.
2. Buka Netlify → pilih web-mu → **Deploys**.
3. Seret lagi folder `kartu-hanzi` ke kotak **"Drag and drop your site output folder here"**.
4. Selesai, web langsung terbarui. Kata-kata di akun tidak hilang.

## Kalau ada masalah

| Masalah | Coba ini |
|---|---|
| Tombol **Masuk** tidak muncul | `config.js` belum terisi atau salah ketik. Cek tanda kutipnya, lalu upload ulang. |
| "Email atau kata sandi salah" | Cek ketikan. Kalau belum pernah daftar, klik **Daftar akun baru**. |
| "Email belum dikonfirmasi" | Cek inbox/spam, atau matikan **Confirm email** (Langkah 4). |
| "Gagal menyimpan ke akun" | Cek internet. Kalau tetap gagal, pastikan Langkah 3 berhasil (ada tabel **words** di Table Editor). |
| Saran hanzi tidak muncul | Pastikan file `hsk.txt` ikut ter-upload di folder yang sama. |

**Catatan biaya:** Supabase versi gratis akan "tidur" kalau tidak dipakai sama sekali selama sekitar 1 minggu. Kalau itu terjadi, buka dashboard Supabase dan klik **Restore**. Datanya tidak hilang. Selama Kak Isna rutin belajar, ini tidak akan terjadi.
