USE crudesales;
SELECT
    b.company_name AS Buyer,
    s.company_name AS Supplier,
    t.crude_type,
    t.quantity_mt,
    t.price_per_barrel,
    t.transaction_date,
    b.region AS Buyer_Region,
    s.region AS Supplier_Region
FROM crudesales.transactions t
JOIN crudesales.buyers b
    ON t.buyer_id = b.buyer_id
JOIN crudesales.suppliers s
    ON t.supplier_id = s.supplier_id;