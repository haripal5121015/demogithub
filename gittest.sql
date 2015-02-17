
haripal chuahna
-- Table: "Customer"

-- DROP TABLE "Customer";




-- Table: customer_custom_attributes

-- DROP TABLE customer_custom_attributes;


CREATE TABLE customer_custom_attributes
(
  customer_id bigint NOT NULL,
  billing_start_day character varying(1),
  payment_terms character varying(1) NOT NULL DEFAULT 'Y'::character varying,
  customer_credit_limit bigint,
  customer_credit_status character(1),
  credit_available numeric(10,2),
  payment_mode character varying(1),
  comments character varying(100),
  status character(1) NOT NULL DEFAULT 'i'::bpchar,
  created_by character varying(30) NOT NULL,
  created_date timestamp without time zone,
  last_updated_by character varying(30) NOT NULL,
  last_updated_date timestamp without time zone,
  CONSTRAINT customer_custom_attributes_customer_id PRIMARY KEY (customer_id),
  CONSTRAINT customer_custom_attributes_customer_id_fk FOREIGN KEY (customer_id)
      REFERENCES customer (customer_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);


-- Table: "Customer_Del_Loc"

-- DROP TABLE "Customer_Del_Loc";

CREATE TABLE customer_del_loc
(
  loc_id bigint NOT NULL,
  customer_id bigint NOT NULL,
  short_name character varying(30),
  long_name character varying(60),
  address_id integer,
  referral character varying(30),
  gst_status character(1),
  gst_reference character varying(30),
  status character(1) NOT NULL DEFAULT 'i'::bpchar,
  created_by character varying(30) NOT NULL,
  created_date timestamp without time zone,
  last_updated_by character varying(30) NOT NULL,
  last_updated_date timestamp without time zone,
  CONSTRAINT customer_del_loc_loc_id PRIMARY KEY (loc_id),
  CONSTRAINT customer_del_loc_address_id FOREIGN KEY (address_id)
      REFERENCES addresses (address_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT customer_del_loc_customer_id FOREIGN KEY (customer_id)
      REFERENCES customer (customer_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);



-- Table: sales_order

-- DROP TABLE sales_order;

CREATE TABLE sales_order
(
  so_id bigint NOT NULL,
  customer_id bigint,
  so_date date,
  so_invoice_date date,
  so_print_flg character(1),
  so_print_date date,
  so_payment numeric(10,2),
  status character(1) NOT NULL DEFAULT 'i'::bpchar,
  created_by character varying(30) NOT NULL,
  created_date timestamp without time zone,
  last_updated_by character varying(30) NOT NULL,
  last_updated_date timestamp without time zone,
  CONSTRAINT sales_order_so_id PRIMARY KEY (so_id),
  CONSTRAINT sales_order_customer_id FOREIGN KEY (customer_id)
      REFERENCES customer (customer_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

-- Table: sales_order_lines

-- DROP TABLE sales_order_lines;
CREATE TABLE sales_order_lines
(
  so_id bigint,
  loc_id bigint,
  menu_item_id bigint,
  original_pax bigint,
  original_price numeric(10,2),
  adjusted_pax bigint,
  adjusted_price numeric(10,2),
  status character(1) NOT NULL DEFAULT 'i'::bpchar,
  created_by character varying(30) NOT NULL,
  created_date timestamp without time zone,
  last_updated_by character varying(30) NOT NULL,
  last_updated_date timestamp without time zone,
  CONSTRAINT sales_order_lines_loc_id FOREIGN KEY (loc_id)
      REFERENCES customer_del_loc (loc_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT sales_order_lines_menu_item_id FOREIGN KEY (menu_item_id)
      REFERENCES menu_items (menu_item_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT sales_order_lines_so_id FOREIGN KEY (so_id)
      REFERENCES sales_order (so_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);




-- Table: customer_invoice

-- DROP TABLE customer_invoice;
  
mp without time zone,
  last_updated_by character varying(30) NOT NULL,
  last_updated_date timestamp without time zone,
  CONSTRAINT customer_invoice_customer_invoice_id PRIMARY KEY (customer_invoice_id),
  CONSTRAINT customer_invoice_customer_id FOREIGN KEY (customer_id)
      REFERENCES customer (customer_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);




        -- Table: reference_so

-- DROP TABLE reference_so;

CREATE TABLE reference_so
(
  customer_invoice_id bigint,
  amount numeric(10,2),
  reference_so_date date,
  reference_so_pax bigint,
  reference_so_net_amount numeric(10,2),
  status character(1) NOT NULL DEFAULT 'i'::bpchar,
  created_by character varying(30) NOT NULL,
  created_date timestamp without time zone,
  last_updated_by character varying(30) NOT NULL,
  last_updated_date timestamp without time zone,
  CONSTRAINT reference_so_customer_invoice_id FOREIGN KEY (customer_invoice_id)
      REFERENCES customer_invoice (customer_invoice_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);



-- Table: customer_invoice_payments

-- DROP TABLE customer_invoice_payments;


CREATE TABLE customer_invoice_payments
(
  payment_id bigint NOT NULL,
  invoice_id bigint NOT NULL,
  invoice_amt numeric(10,2) NOT NULL,
  invoice_date date NOT NULL,
  posted_date date NOT NULL,
  paid_amount numeric(10,2) NOT NULL,
  payment_mode character(1) NOT NULL,
  payment_reference_no character varying(30),
  payment_reference_date date,
  payment_reference_2 character varying(30),
  payment_reference_3 character varying(30),
  comments character varying(100),
  status character(1) NOT NULL DEFAULT 'i'::bpchar,
  created_by character varying(30) NOT NULL,
  created_date timestamp without time zone,
  last_updated_by character varying(30) NOT NULL,
  last_updated_date timestamp without time zone,
  CONSTRAINT customer_invoice_payment_payment_id PRIMARY KEY (payment_id)
)
WITH (
  OIDS=FALSE
);

-- Table: follow_up

-- DROP TABLE follow_up;

CREATE TABLE follow_up
(
  follow_up_id bigint NOT NULL,
  follow_up_type character(1),
  follow_up_reference character varying(10),
  follow_up_subject character varying(60),
  follow_up_date date,
  next_follow_up date,
  comments character varying(100),
  status character(1) NOT NULL DEFAULT 'i'::bpchar,
  created_by character varying(30) NOT NULL,
  created_date timestamp without time zone,
  last_updated_by character varying(30) NOT NULL,
  last_updated_date timestamp without time zone,
  
);





