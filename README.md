# 🌍 EcoTrack

**EcoTrack** es una aplicación móvil desarrollada en **Flutter** que permite a los usuarios registrar y gestionar sus actividades diarias con el fin de calcular su huella de carbono personal.  
El proyecto integra **Supabase** como backend para almacenamiento de datos en la nube y sigue principios de **Clean Architecture** para mantener un código modular, limpio y escalable.

---

## ✨ Características

✅ Registro de actividades con su tipo (ej. transporte, electricidad, alimentación)  
📊 Cálculo de huella de carbono en **kg de CO₂**  
☁️ Almacenamiento seguro en la nube con **Supabase**  
📅 Visualización organizada por fecha  
🔄 Sincronización en tiempo real  
🎨 Interfaz moderna y responsiva en Flutter  
🧩 Arquitectura limpia (separación en capas: domain, data, presentation)  

---

## 🛠️ Tecnologías Utilizadas

- **Flutter**: Framework multiplataforma  
- **Dart**: Lenguaje de programación  
- **Supabase**: Backend (PostgreSQL + API REST)  
- **GetIt**: Inyección de dependencias  
- **BLoC**: Gestión de estado  
- **Dartz**: Manejo funcional de errores  

---

## 🗄️ Configuración de la Base de Datos en Supabase

Ejecuta el siguiente SQL en el **SQL Editor** de Supabase para crear la tabla principal:

```sql
-- Crear la tabla activities
create table if not exists activities (
  id uuid primary key default uuid_generate_v4(),
  type text not null,
  co2Kg float not null,
  date timestamp with time zone default now()
);

-- Índices
create index if not exists idx_activities_type on activities(type);
create index if not exists idx_activities_date on activities(date);

-- Activar Row Level Security
alter table activities enable row level security;

-- Políticas básicas (puedes ajustarlas según la seguridad deseada)
create policy "Allow select" on activities for select using (true);
create policy "Allow insert" on activities for insert with check (true);
