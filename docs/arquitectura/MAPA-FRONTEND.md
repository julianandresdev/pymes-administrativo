# ByteLab — Mapa de Frontend (pantallas MVP)

## Autenticación
| Ruta | Pantalla |
|:---|:---|
| `/login` | Inicio de sesión |

## Dashboard
| Ruta | Pantalla |
|:---|:---|
| `/dashboard` | Resumen general (ventas del día, stock bajo, pedidos pendientes) |

## Productos
| Ruta | Pantalla |
|:---|:---|
| `/products` | Listado con búsqueda y filtros |
| `/products/new` | Formulario crear producto |
| `/products/:id` | Detalle y editar producto |

## Inventario
| Ruta | Pantalla |
|:---|:---|
| `/inventory/stock` | Stock actual por producto |
| `/inventory/movements` | Kardex / listado de movimientos |
| `/inventory/movements/new` | Crear movimiento (entrada/salida/ajuste) |

## Precios y Costos
| Ruta | Pantalla |
|:---|:---|
| `/pricing` | Lista de precios y costos por producto |
| `/pricing/:productId/edit` | Editar precio/costo de un producto |

## Pedidos / Ventas
| Ruta | Pantalla |
|:---|:---|
| `/orders` | Listado de pedidos con filtro por estado |
| `/orders/new` | Crear pedido (seleccionar productos/cantidades) |
| `/orders/:id` | Detalle del pedido + cambiar estado |

## Reportes
| Ruta | Pantalla |
|:---|:---|
| `/reports/sales` | Reporte de ventas por rango de fechas |
| `/reports/inventory` | Reporte de inventario valorizado |

## Usuarios (solo admin)
| Ruta | Pantalla |
|:---|:---|
| `/users` | Listado de usuarios |
| `/users/new` | Crear usuario y asignar rol |
