
--
-- Name: destino; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.destino (
    id bigint NOT NULL,
    nome character varying(255)
);


--
-- Name: destino_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.destino ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.destino_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pacote; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pacote (
    id bigint NOT NULL,
    descricao character varying(255),
    img_url character varying(255),
    nome character varying(255),
    preco double precision
);


--
-- Name: pacote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.pacote ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.pacote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pagamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pagamento (
    moment timestamp without time zone,
    pedido_id bigint NOT NULL
);


--
-- Name: pedido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pedido (
    id bigint NOT NULL,
    momento timestamp without time zone,
    pedido_status integer,
    cliente_id bigint
);


--
-- Name: pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.pedido ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pedido_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pedido_item (
    preco double precision,
    quantidade integer,
    pacote_id bigint NOT NULL,
    pedido_id bigint NOT NULL
);


--
-- Name: tb_pacote_destino; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_pacote_destino (
    pacote_id bigint NOT NULL,
    destino_id bigint NOT NULL
);


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario (
    id bigint NOT NULL,
    email character varying(255),
    nome character varying(255),
    senha character varying(255),
    telefone character varying(255)
);


--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.usuario ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: destino destino_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.destino
    ADD CONSTRAINT destino_pkey PRIMARY KEY (id);


--
-- Name: pacote pacote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pacote
    ADD CONSTRAINT pacote_pkey PRIMARY KEY (id);


--
-- Name: pagamento pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (pedido_id);


--
-- Name: pedido_item pedido_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedido_item
    ADD CONSTRAINT pedido_item_pkey PRIMARY KEY (pacote_id, pedido_id);


--
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);


--
-- Name: tb_pacote_destino tb_pacote_destino_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_pacote_destino
    ADD CONSTRAINT tb_pacote_destino_pkey PRIMARY KEY (pacote_id, destino_id);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: pedido fk37ms39e5dvx6m05hftvx9uavk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk37ms39e5dvx6m05hftvx9uavk FOREIGN KEY (cliente_id) REFERENCES public.usuario(id);


--
-- Name: tb_pacote_destino fk3d1buqt3viumacg8exsjivh55; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_pacote_destino
    ADD CONSTRAINT fk3d1buqt3viumacg8exsjivh55 FOREIGN KEY (destino_id) REFERENCES public.destino(id);


--
-- Name: tb_pacote_destino fk980dc1o91td91ejh35i9tx9lu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_pacote_destino
    ADD CONSTRAINT fk980dc1o91td91ejh35i9tx9lu FOREIGN KEY (pacote_id) REFERENCES public.pacote(id);


--
-- Name: pedido_item fkeyouxfvoi291lpo5168e6wpej; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedido_item
    ADD CONSTRAINT fkeyouxfvoi291lpo5168e6wpej FOREIGN KEY (pedido_id) REFERENCES public.pedido(id);


--
-- Name: pedido_item fkkblnb9cg179nge00adtfdabdw; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedido_item
    ADD CONSTRAINT fkkblnb9cg179nge00adtfdabdw FOREIGN KEY (pacote_id) REFERENCES public.pacote(id);


--
-- Name: pagamento fkthad9tkw4188hb3qo1lm5ueb0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT fkthad9tkw4188hb3qo1lm5ueb0 FOREIGN KEY (pedido_id) REFERENCES public.pedido(id);


--
-- PostgreSQL database dump complete
--

