-- Klinik Budiman V5 PostgreSQL schema
create table if not exists users (
  id uuid primary key default gen_random_uuid(),
  username text unique not null,
  password_hash text not null,
  full_name text not null,
  role text not null check (role in ('Admin','Clinician')),
  active boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists patients (
  id uuid primary key default gen_random_uuid(),
  mrn text unique,
  name text not null,
  dob date,
  sex text,
  phone text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists visits (
  id uuid primary key default gen_random_uuid(),
  patient_id uuid not null references patients(id) on delete cascade,
  visit_date date not null,
  doctor text,
  clinical_data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists audit_log (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references users(id),
  action text not null,
  detail text,
  created_at timestamptz not null default now()
);

create index if not exists idx_patients_name on patients(name);
create index if not exists idx_visits_patient on visits(patient_id);
create index if not exists idx_visits_date on visits(visit_date);
