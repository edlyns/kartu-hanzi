-- Tempel semua isi file ini di Supabase > SQL Editor, lalu klik "Run".
-- Ini membuat tabel "words" untuk kata-kata, dan aturan supaya
-- setiap orang hanya bisa melihat dan mengubah kata miliknya sendiri.

create table if not exists public.words (
  user_id uuid not null default auth.uid() references auth.users (id) on delete cascade,
  id text not null,
  hanzi text not null,
  pinyin text default '',
  arti text not null,
  contoh text default '',
  hafal boolean not null default false,
  dibuat bigint,
  updated_at timestamptz not null default now(),
  primary key (user_id, id)
);

alter table public.words enable row level security;

create policy "lihat kata sendiri" on public.words
  for select using (auth.uid() = user_id);
create policy "tambah kata sendiri" on public.words
  for insert with check (auth.uid() = user_id);
create policy "ubah kata sendiri" on public.words
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "hapus kata sendiri" on public.words
  for delete using (auth.uid() = user_id);
