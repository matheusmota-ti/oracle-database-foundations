-- OBL - Oracle Baseball League
-- Oracle Database. Execute em um schema de teste vazio.
-- Tipos/tamanhos propostos; consulte docs/dicionario-de-dados.md.

CREATE TABLE sales_representatives (
    id              VARCHAR2(4)   CONSTRAINT pk_sales_representatives PRIMARY KEY,
    email           VARCHAR2(100) NOT NULL CONSTRAINT uk_sales_rep_email UNIQUE,
    first_name      VARCHAR2(30)  NOT NULL,
    last_name       VARCHAR2(30)  NOT NULL,
    phone_number    VARCHAR2(15)  NOT NULL,
    commission_rate NUMBER(5,2)   NOT NULL,
    supervisor_id   VARCHAR2(4),
    CONSTRAINT fk_sales_rep_supervisor FOREIGN KEY (supervisor_id)
        REFERENCES sales_representatives(id)
);

CREATE TABLE teams (
    id                 VARCHAR2(4)  CONSTRAINT pk_teams PRIMARY KEY,
    name               VARCHAR2(80) NOT NULL CONSTRAINT uk_teams_name UNIQUE,
    number_of_players  NUMBER(3)    NOT NULL,
    discount           NUMBER(5,2),
    sre_id             VARCHAR2(4),
    CONSTRAINT ck_teams_players CHECK (number_of_players >= 0),
    CONSTRAINT ck_teams_discount CHECK (discount IS NULL OR (discount >= 0 AND discount <= 100)),
    CONSTRAINT fk_teams_sales_rep FOREIGN KEY (sre_id)
        REFERENCES sales_representatives(id)
);

CREATE TABLE inventory_list (
    id            VARCHAR2(10) CONSTRAINT pk_inventory_list PRIMARY KEY,
    unit_cost     NUMBER(8,2)  NOT NULL,
    units_on_hand NUMBER(8)    NOT NULL,
    CONSTRAINT ck_inventory_cost CHECK (unit_cost >= 0),
    CONSTRAINT ck_inventory_units CHECK (units_on_hand >= 0)
);

CREATE TABLE items (
    itm_number VARCHAR2(10)  CONSTRAINT pk_items PRIMARY KEY,
    name       VARCHAR2(80)  NOT NULL,
    description VARCHAR2(250) NOT NULL,
    category   VARCHAR2(40)  NOT NULL,
    color      VARCHAR2(30),
    size       VARCHAR2(10),
    ilt_id     VARCHAR2(10)  NOT NULL,
    CONSTRAINT fk_items_inventory FOREIGN KEY (ilt_id)
        REFERENCES inventory_list(id)
);

CREATE TABLE customers (
    ctr_number         VARCHAR2(6)  CONSTRAINT pk_customers PRIMARY KEY,
    email              VARCHAR2(50) NOT NULL CONSTRAINT uk_customers_email UNIQUE,
    first_name         VARCHAR2(20) NOT NULL,
    last_name          VARCHAR2(30) NOT NULL,
    phone_number       VARCHAR2(11) NOT NULL,
    current_balance    NUMBER(6,2)  NOT NULL,
    loyalty_card_number VARCHAR2(6) CONSTRAINT uk_customers_loyalty UNIQUE,
    tem_id             VARCHAR2(4),
    sre_id             VARCHAR2(4),
    CONSTRAINT fk_customers_team FOREIGN KEY (tem_id) REFERENCES teams(id),
    CONSTRAINT fk_customers_sales_rep FOREIGN KEY (sre_id) REFERENCES sales_representatives(id)
);

CREATE TABLE customers_addresses (
    id             VARCHAR2(6)   CONSTRAINT pk_customers_addresses PRIMARY KEY,
    address_line_1 VARCHAR2(100) NOT NULL,
    address_line_2 VARCHAR2(100),
    city           VARCHAR2(60)  NOT NULL,
    postal_code    VARCHAR2(12)  NOT NULL,
    ctr_number     VARCHAR2(6)   NOT NULL,
    CONSTRAINT fk_cust_addr_customer FOREIGN KEY (ctr_number) REFERENCES customers(ctr_number)
);

CREATE TABLE sales_representatives_address (
    id             VARCHAR2(6)   CONSTRAINT pk_sales_rep_address PRIMARY KEY,
    address_line_1 VARCHAR2(100) NOT NULL,
    address_line_2 VARCHAR2(100),
    city           VARCHAR2(60)  NOT NULL,
    postal_code    VARCHAR2(12)  NOT NULL,
    sre_id         VARCHAR2(4)   NOT NULL,
    CONSTRAINT fk_sra_sales_rep FOREIGN KEY (sre_id) REFERENCES sales_representatives(id)
);

CREATE TABLE orders (
    id              VARCHAR2(10) CONSTRAINT pk_orders PRIMARY KEY,
    order_date      DATE          NOT NULL,
    number_of_units NUMBER(6)     NOT NULL,
    ctr_number      VARCHAR2(6)   NOT NULL,
    CONSTRAINT ck_orders_units CHECK (number_of_units >= 0),
    CONSTRAINT fk_orders_customer FOREIGN KEY (ctr_number) REFERENCES customers(ctr_number)
);

CREATE TABLE ordered_items (
    odr_id             VARCHAR2(10) NOT NULL,
    itm_number         VARCHAR2(10) NOT NULL,
    quantity_ordered   NUMBER(6)    NOT NULL,
    quantity_shipped   NUMBER(6)    NOT NULL,
    CONSTRAINT pk_ordered_items PRIMARY KEY (odr_id, itm_number),
    CONSTRAINT ck_ordered_quantity CHECK (quantity_ordered >= 0),
    CONSTRAINT ck_shipped_quantity CHECK (quantity_shipped >= 0 AND quantity_shipped <= quantity_ordered),
    CONSTRAINT fk_oim_order FOREIGN KEY (odr_id) REFERENCES orders(id),
    CONSTRAINT fk_oim_item FOREIGN KEY (itm_number) REFERENCES items(itm_number)
);

CREATE TABLE price_history (
    start_date DATE         NOT NULL,
    start_time VARCHAR2(8)  NOT NULL,
    price      NUMBER(8,2)  NOT NULL,
    end_date   DATE,
    end_time   VARCHAR2(8),
    itm_number VARCHAR2(10) NOT NULL,
    CONSTRAINT pk_price_history PRIMARY KEY (itm_number, start_date, start_time),
    CONSTRAINT ck_price_history_price CHECK (price >= 0),
    CONSTRAINT fk_price_history_item FOREIGN KEY (itm_number) REFERENCES items(itm_number)
);

-- Índices auxiliares para FKs e consultas comuns
CREATE INDEX ix_customers_team ON customers(tem_id);
CREATE INDEX ix_customers_sales_rep ON customers(sre_id);
CREATE INDEX ix_customer_addresses_ctr ON customers_addresses(ctr_number);
CREATE INDEX ix_sra_sre ON sales_representatives_address(sre_id);
CREATE INDEX ix_orders_customer ON orders(ctr_number);
CREATE INDEX ix_oim_item ON ordered_items(itm_number);
CREATE INDEX ix_price_history_item ON price_history(itm_number);
