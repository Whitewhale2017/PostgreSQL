CREATE FOREIGN TABLE public.ft_uf_fixedassets()
    INHERITS (public.uf_fixedassets) --继承表
    SERVER fs_dataware
    OPTIONS (schema_name 'public', table_name 'uf_fixedassets');

