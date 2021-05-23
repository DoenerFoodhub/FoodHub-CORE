CREATE TABLE classes (
    class TEXT PRIMARY KEY
);

CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT NOT NULL UNIQUE,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    password TEXT NOT NULL,
    is_admin INT2 NOT NULL,
    class TEXT NOT NULL,
    FOREIGN KEY(class) REFERENCES classes(class)
);

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created_on DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_id INTEGER NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE restaurants (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    address TEXT,
    phone_number TEXT NOT NULL
);

CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT NOT NULL DEFAULT '',
    price NUMERIC NOT NULL,
    restaurant_id INTEGER NOT NULL,
    FOREIGN KEY(restaurant_id) REFERENCES restaurants(id)
);

CREATE TABLE ingredients (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE addons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price NUMERIC
);

CREATE TABLE product_ingredients (
    order_id INTEGER,
    ingredient_id INTEGER,
    PRIMARY KEY(order_id, ingredient_id),
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(ingredient_id) REFERENCES ingredients(id)
);

CREATE TABLE product_addons (
    order_id INTEGER,
    addon_id INTEGER,
    PRIMARY KEY(order_id, addon_id),
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(addon_id) REFERENCES addons(id)
);

CREATE TABLE product_orders (
    order_id INTEGER,
    product_id INTEGER,
    amount INTEGER NOT NULL DEFAULT 1,
    PRIMARY KEY(order_id, product_id),
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(product_id) REFERENCES products(id)
);