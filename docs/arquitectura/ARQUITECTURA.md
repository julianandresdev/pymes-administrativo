# ByteLab — Arquitectura del servicio

## 1. Qué es
ByteLab es un SaaS administrativo/comercial para PYMES (inventario, precios/costos, pedidos/ventas y reportes).

## 2. Stack
| Capa | Tecnología |
|:---|:---|
| Frontend | React + TypeScript (Vite) |
| Backend | NestJS + TypeScript (API REST) |
| Base de datos | PostgreSQL 16 |
| Infra (dev) | Docker Compose |

## 3. Arquitectura (alto nivel)
```
Frontend (React) → API (NestJS) → PostgreSQL
```

## 4. Módulos (Backend NestJS)
Estructura por dominios para separar responsabilidades y permitir trabajo paralelo:

```
src/
├── auth/           # login, JWT, refresh tokens, guards
├── users/          # usuarios del sistema, permisos, roles
├── products/       # catálogo (SKU, categorías, unidades)
├── inventory/      # movimientos (entrada/salida/ajuste), kardex, stock
├── pricing/        # costos/precios, historial, márgenes
├── orders/         # pedidos/ventas, estados, items
├── reports/        # dashboard y reportes básicos
└── common/         # pipes, filters, utils, constantes, interceptors
```

## 5. Reglas de arquitectura
- **Controller**: solo routing, sin lógica de negocio.
- **Service**: todas las reglas de negocio.
- **DTOs**: validación de inputs (CreateDTO / UpdateDTO).
- **Errores**: respuestas consistentes con HttpException (400/401/403/404/409).
- **Auth**: RBAC por roles (admin, vendedor, bodeguero) usando Guards.
- **Sin raw queries**: toda consulta va a través del ORM (TypeORM).

## 6. Autenticación
- JWT (access token)
- Roles: `admin`, `vendedor`, `bodeguero`
- Decorador `@Roles()` + Guard `RolesGuard` + Guard `JwtAuthGuard`

## 7. Endpoints MVP (referencia)
```
POST   /auth/login
GET    /products         GET /products/:id
POST   /products         PUT /products/:id
DELETE /products/:id
GET    /inventory/stock
POST   /inventory/movements
GET    /orders           GET /orders/:id
POST   /orders           PATCH /orders/:id/status
GET    /reports/sales
GET    /reports/inventory
```

## 8. Mapa de pantallas (Frontend)
Ver [MAPA-FRONTEND.md](./MAPA-FRONTEND.md)

## 9. Modelo de datos
Ver [docs/modelo-datos/schema.sql](../modelo-datos/schema.sql)
