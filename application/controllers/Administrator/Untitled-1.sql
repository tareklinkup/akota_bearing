--- Check Stock Difference ---
select * from (
    select
        p.Product_Name,
        p.Product_SlNo,
        p.Product_Code,

        pc.ProductCategory_Name,
            (select sdd.AddTime  from tbl_saledetails sdd where p.Product_SlNo=sdd.Product_IDNo order by SaleDetails_SlNo DESC LIMIT 1) as getsaleupdate,
            (select pdd.AddTime  from  tbl_purchasedetails pdd where p.Product_SlNo=pdd.Product_IDNo order by PurchaseDetails_SlNo DESC LIMIT 1) as getpurchaseupdate,
            (select GREATEST(getsaleupdate,getpurchaseupdate) ) as lastupdate, 
        b.brand_name,
        u.Unit_Name,
        
        (select ifnull(sum(pd.PurchaseDetails_TotalQuantity), 0) 
                from tbl_purchasedetails pd 
                where pd.Product_IDNo = p.Product_SlNo
                and pd.PurchaseDetails_branchID = 12
                and pd.Status = 'a') as purchased_quantity,
                
        (select ifnull(sum(prd.PurchaseReturnDetails_ReturnQuantity), 0) 
                from tbl_purchasereturndetails prd 
                where prd.PurchaseReturnDetailsProduct_SlNo = p.Product_SlNo
                and prd.PurchaseReturnDetails_brachid = 12) as purchase_returned_quantity,
                
        (select ifnull(sum(sd.SaleDetails_TotalQuantity), 0) 
                from tbl_saledetails sd
                where sd.Product_IDNo = p.Product_SlNo
                and sd.SaleDetails_BranchId  = 12
                and sd.Status = 'a') as sold_quantity,
                
        (select ifnull(sum(srd.SaleReturnDetails_ReturnQuantity), 0)
                from tbl_salereturndetails srd 
                where srd.SaleReturnDetailsProduct_SlNo = p.Product_SlNo
                and srd.SaleReturnDetails_brunchID = 12) as sales_returned_quantity,
                
        (select ifnull(sum(dmd.DamageDetails_DamageQuantity), 0) 
                from tbl_damagedetails dmd
                join tbl_damage dm on dm.Damage_SlNo = dmd.Damage_SlNo
                where dmd.Product_SlNo = p.Product_SlNo
                and dm.Damage_brunchid = 12) as damaged_quantity,
    
        (select ifnull(sum(trd.quantity), 0)
                from tbl_transferdetails trd
                join tbl_transfermaster tm on tm.transfer_id = trd.transfer_id
                where trd.product_id = p.Product_SlNo
                and tm.transfer_from = 12) as transfered_from_quantity,

        (select ifnull(sum(trd.quantity), 0)
                from tbl_transferdetails trd
                join tbl_transfermaster tm on tm.transfer_id = trd.transfer_id
                where trd.product_id = p.Product_SlNo
                and tm.transfer_to = 12) as transfered_to_quantity,
                
        (select (purchased_quantity + sales_returned_quantity + transfered_to_quantity) - (sold_quantity + purchase_returned_quantity + damaged_quantity + transfered_from_quantity)) as current_quantity,
        (
            select
                ((ci.purchase_quantity + ci.sales_return_quantity + ci.transfer_to_quantity) - (ci.sales_quantity + ci.purchase_return_quantity + ci.damage_quantity + ci.transfer_from_quantity) )
            from tbl_currentinventory ci 
            where ci.product_id = p.Product_SlNo 
            and ci.branch_id = 12
        ) as inv_qty,
        (select p.Product_Purchase_Rate * current_quantity) as stock_value
    from tbl_product p
    left join tbl_productcategory pc on pc.ProductCategory_SlNo = p.ProductCategory_ID
    left join tbl_brand b on b.brand_SiNo = p.brand
    left join tbl_unit u on u.Unit_SlNo = p.Unit_ID
    where p.status = 'a' and p.is_service = 'false' 
) as tbl 
where current_quantity != inv_qty;

--- Update current inventory ---
drop table temp_stock;
create table temp_stock(
    pid int not null,
    p float not null,
    pr float not null,
    s float not null,
    sr float not null,
    d float not null,
    tf float not null,
    tt float not null,
    bid int not null
);
insert into temp_stock (
    pid, p, pr, s, sr, d, tf, tt, bid
)
select Product_SlNo, purchased_quantity, purchase_returned_quantity, sold_quantity, sales_returned_quantity, damaged_quantity, transfered_from_quantity, transfered_to_quantity, 12 from (
    select
        p.Product_Name,
        p.Product_SlNo,
        p.Product_Code,
        pc.ProductCategory_Name,
            (select sdd.AddTime  from tbl_saledetails sdd where p.Product_SlNo=sdd.Product_IDNo order by SaleDetails_SlNo DESC LIMIT 1) as getsaleupdate,
            (select pdd.AddTime  from  tbl_purchasedetails pdd where p.Product_SlNo=pdd.Product_IDNo order by PurchaseDetails_SlNo DESC LIMIT 1) as getpurchaseupdate,
            (select GREATEST(getsaleupdate,getpurchaseupdate) ) as lastupdate, 
        b.brand_name,
        u.Unit_Name,
        
        (select ifnull(sum(pd.PurchaseDetails_TotalQuantity), 0) 
                from tbl_purchasedetails pd 
                where pd.Product_IDNo = p.Product_SlNo
                and pd.PurchaseDetails_branchID = 12
                and pd.Status = 'a') as purchased_quantity,
                
        (select ifnull(sum(prd.PurchaseReturnDetails_ReturnQuantity), 0) 
                from tbl_purchasereturndetails prd 
                where prd.PurchaseReturnDetailsProduct_SlNo = p.Product_SlNo
                and prd.PurchaseReturnDetails_brachid = 12) as purchase_returned_quantity,
                
        (select ifnull(sum(sd.SaleDetails_TotalQuantity), 0) 
                from tbl_saledetails sd
                where sd.Product_IDNo = p.Product_SlNo
                and sd.SaleDetails_BranchId  = 12
                and sd.Status = 'a') as sold_quantity,
                
        (select ifnull(sum(srd.SaleReturnDetails_ReturnQuantity), 0)
                from tbl_salereturndetails srd 
                where srd.SaleReturnDetailsProduct_SlNo = p.Product_SlNo
                and srd.SaleReturnDetails_brunchID = 12) as sales_returned_quantity,
                
        (select ifnull(sum(dmd.DamageDetails_DamageQuantity), 0) 
                from tbl_damagedetails dmd
                join tbl_damage dm on dm.Damage_SlNo = dmd.Damage_SlNo
                where dmd.Product_SlNo = p.Product_SlNo
                and dm.Damage_brunchid = 12) as damaged_quantity,
    
        (select ifnull(sum(trd.quantity), 0)
                from tbl_transferdetails trd
                join tbl_transfermaster tm on tm.transfer_id = trd.transfer_id
                where trd.product_id = p.Product_SlNo
                and tm.transfer_from = 12) as transfered_from_quantity,

        (select ifnull(sum(trd.quantity), 0)
                from tbl_transferdetails trd
                join tbl_transfermaster tm on tm.transfer_id = trd.transfer_id
                where trd.product_id = p.Product_SlNo
                and tm.transfer_to = 12) as transfered_to_quantity,
        (
            select
                ((ci.purchase_quantity + ci.sales_return_quantity + ci.transfer_to_quantity) - (ci.sales_quantity + ci.purchase_return_quantity + ci.damage_quantity + ci.transfer_from_quantity) )
            from tbl_currentinventory ci 
            where ci.product_id = p.Product_SlNo 
            and ci.branch_id = 12
        ) as inv_qty,
        (select (purchased_quantity + sales_returned_quantity + transfered_to_quantity) - (sold_quantity + purchase_returned_quantity + damaged_quantity + transfered_from_quantity)) as current_quantity,
        (select p.Product_Purchase_Rate * current_quantity) as stock_value
    from tbl_product p
    left join tbl_productcategory pc on pc.ProductCategory_SlNo = p.ProductCategory_ID
    left join tbl_brand b on b.brand_SiNo = p.brand
    left join tbl_unit u on u.Unit_SlNo = p.Unit_ID
    where p.status = 'a' and p.is_service = 'false' 

) as tbl 
where current_quantity != inv_qty;

update tbl_currentinventory ci, temp_stock ts
set ci.purchase_quantity = ts.p,
ci.purchase_return_quantity = ts.pr,
ci.sales_quantity = s,
ci.sales_return_quantity = sr,
ci.damage_quantity = d,
ci.transfer_from_quantity = tf,
ci.transfer_to_quantity = tt
where ci.product_id = ts.pid
and ci.branch_id = ts.bid
