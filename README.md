# ByteLab

> SaaS administrativo y comercial para pequeños negocios — inventario, precios/costos, pedidos y reportes.

## Stack
| Capa | Tecnología |
|:---|:---|
| Frontend | React + TypeScript (Vite) |
| Backend | NestJS + TypeScript (API REST) |
| Base de datos | PostgreSQL 16 |
| Infra (dev) | Docker Compose |

## Estructura del proyecto
```
pymes-administrativo/
├── backend/          # API REST (NestJS)
├── frontend/         # App web (React + Vite)
├── docs/
│   ├── arquitectura/ # Arquitectura de módulos y mapa de pantallas
│   ├── modelo-datos/ # Schema PostgreSQL
│   └── mockups/      # Diseños y wireframes
├── docker-compose.yml      # Entorno completo
├── docker-compose.dev.yml  # Solo base de datos (dev local)
└── .env.example            # Variables de entorno de referencia
```

## Cómo correr el proyecto

### 1. Clonar el repositorio
```bash
git clone https://github.com/julianandresdev/pymes-administrativo.git
cd pymes-administrativo
```

### 2. Configurar variables de entorno
```bash
cp .env.example .env
# Edita .env con tus valores
```

### 3. Levantar la base de datos (dev)
```bash
docker-compose -f docker-compose.dev.yml up -d
```

### 4. Instalar dependencias y correr
```bash
# Backend
cd backend && npm install && npm run start:dev

# Frontend (en otra terminal)
cd frontend && npm install && npm run dev
```

## Documentación
- [Arquitectura del servicio](./docs/arquitectura/ARQUITECTURA.md)
- [Mapa de pantallas (Frontend)](./docs/arquitectura/MAPA-FRONTEND.md)
- [Schema de base de datos](./docs/modelo-datos/schema.sql)
- [Guía de contribución](./CONTRIBUTING.md)

## Equipo
| Rol | Responsabilidad |
|:---|:---|
| PM / Arquitecto | Planeación, arquitectura, decisiones técnicas |
| Tech Lead / Backend | API REST, base de datos, DevOps |
| Frontend / UX / QA | Interfaz, diseño, pruebas |
