-- ByteLab - PostgreSQL schema inicial (MVP)
-- Ejecutar sobre base de datos: pymes_db

-- Enum de roles
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'role_type') THEN
    CREATE TYPE role_type AS ENUM ('admin', 'vendedor', 'bodeguero');
  END IF;
END$$;

-- Usuarios del sistema
CREATE TABLE IF NOT EXISTS users (
  id             SERIAL PRIMARY KEY,
  email          VARCHAR(255) UNIQUE NOT NULL,
  password_hash  VARCHAR(255) NOT NULL,
  role           role_type NOT NULL DEFAULT 'vendedor',
  active         BOOLEAN NOT NULL DEFAULT TRUE,
  created_at     TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Categorías de productos
CREATE TABLE IF NOT EXISTS categories (
  id          SERIAL PRIMARY KEY,
  name        VARCHAR(120) NOT NULL,
  created_at  TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Catálogo de productos
CREATE TABLE IF NOT EXISTS products (
  id           SERIAL PRIMARY KEY,
  sku          VARCHAR(60) UNIQUE NOT NULL,
  name         VARCHAR(200) NOT NULL,
  category_id  INTEGER REFERENCES categories(id) ON DELETE SET NULL,
  unit         VARCHAR(30) NOT NULL DEFAULT 'unidad',
  active       BOOLEAN NOT NULL DEFAULT TRUE,
  created_at   TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Historial de precios y costos
CREATE TABLE IF NOT EXISTS pricing (
  id           SERIAL PRIMARY KEY,
  product_id   INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  buy_price    NUMERIC(12,2) NOT NULL CHECK (buy_price >= 0),
  sell_price   NUMERIC(12,2) NOT NULL CHECK (sell_price >= 0),
  valid_from   DATE NOT NULL,
  created_by   INTEGER REFERENCES users(id),
  created_at   TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Movimientos de inventario (kardex)
CREATE TABLE IF NOT EXISTS inventory_movements (
  id             SERIAL PRIMARY KEY,
  product_id     INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  movement_type  VARCHAR(20) NOT NULL
                   CHECK (movement_type IN ('entrada','salida','ajuste','devolucion')),
  quantity       NUMERIC(12,3) NOT NULL CHECK (quantity > 0),
  unit_cost      NUMERIC(12,2),
  notes          TEXT,
  created_by     INTEGER REFERENCES users(id),
  created_at     TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Pedidos / Ventas
CREATE TABLE IF NOT EXISTS orders (
  id            SERIAL PRIMARY KEY,
  order_number  VARCHAR(50) UNIQUE NOT NULL,
  client_name   VARCHAR(200),
  client_phone  VARCHAR(30),
  status        VARCHAR(20) NOT NULL DEFAULT 'pendiente'
                  CHECK (status IN ('pendiente','procesando','entregado','anulado')),
  created_by    INTEGER REFERENCES users(id),
  created_at    TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at    TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Items de cada pedido
CREATE TABLE IF NOT EXISTS order_items (
  id          SERIAL PRIMARY KEY,
  order_id    INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  product_id  INTEGER NOT NULL REFERENCES products(id),
  quantity    NUMERIC(12,3) NOT NULL CHECK (quantity > 0),
  unit_price  NUMERIC(12,2) NOT NULL CHECK (unit_price >= 0)
);

-- Índices para mejorar consultas frecuentes
CREATE INDEX IF NOT EXISTS idx_products_sku
  ON products(sku);

CREATE INDEX IF NOT EXISTS idx_inventory_product_created
  ON inventory_movements(product_id, created_at);

CREATE INDEX IF NOT EXISTS idx_orders_status_created
  ON orders(status, created_at);

CREATE INDEX IF NOT EXISTS idx_pricing_product_valid
  ON pricing(product_id, valid_from DESC);
