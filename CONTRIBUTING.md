# ByteLab — Guía de Contribución

## 1. Estructura de ramas
```
main              → producción (PROTEGIDA, solo merge vía PR)
develop           → integración continua (PROTEGIDA, solo merge vía PR)
feature/<id>-<desc> → nueva funcionalidad
fix/<id>-<desc>     → corrección de bug
hotfix/<desc>       → corrección urgente a producción
```

## 2. Convención de commits (OBLIGATORIO)
```
feat:     nueva funcionalidad
fix:      corrección de bug
docs:     cambios en documentación
chore:    tareas de configuración/mantenimiento
refactor: refactorización sin cambio funcional
test:     agregar o modificar pruebas
style:    formato de código (sin cambio lógico)
```

Ejemplos:
```
feat: add product CRUD endpoints
fix: correct inventory stock calculation
docs: update schema with pricing table
```

## 3. Flujo de trabajo
```
1. Tomar issue del tablero → asignarse
2. Crear branch: feature/<id>-<descripcion> desde develop
3. Desarrollar → commit con convención
4. Crear PR de feature → develop
5. Code review (mínimo 1 aprobación)
6. Merge → delete branch → cerrar issue
```

## 4. Reglas de Pull Request
- PR siempre hacia `develop` (nunca directo a `main`)
- Mínimo **1 aprobación** antes de merge
- PRs pequeños y enfocados (máximo ~200 líneas)
- Descripción clara: qué hace, qué módulo afecta
- Linked issue: `Closes #<número>`

## 5. Estándares de código

### Backend (NestJS)
- DTOs con validaciones (`class-validator`)
- Lógica de negocio solo en Services
- Controllers solo hacen routing
- Nombres: `camelCase` variables, `PascalCase` clases
- Sin `console.log` → usar `Logger` de NestJS

### Frontend (React)
- Componentes funcionales + hooks
- TypeScript estricto (sin `any`)
- Nombres: `PascalCase` componentes, `camelCase` props/variables
- Responsive-first con Tailwind

## 6. Definition of Done (DoD)
```
☐ PR creado y aprobado (≥1 review)
☐ Build sin errores
☐ Lint sin errores
☐ Flujo afectado probado manualmente
☐ Docs actualizadas si cambia arquitectura o endpoints
```
