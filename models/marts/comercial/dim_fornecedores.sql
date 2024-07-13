with
    fonte_fornecedores as (
        select *
        from {{ ref('stg_erp__fornecedores') }}
    )

select *
from fonte_fornecedores