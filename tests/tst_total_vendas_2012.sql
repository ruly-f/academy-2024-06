/*  
    Este teste garante que as vendas de 2012 estão
    corretas com o valor auditado da contabilidade.
*/

{{
    config(
        severity = 'error'
    )
}}

with
    vendas_em_2012 as (
        select sum(total_bruto) as total_bruto
        from {{ ref('fct_vendas') }}
        where data_do_pedido between '2012-01-01' and '2012-12-31'
    ) -- R$ 226298.5

select total_bruto
from vendas_em_2012
where total_bruto not between 226298.45 and 226298.55
