<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ResumenEmas2.aspx.vb" Inherits="WebSIRECA.ResumenEmas2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            Caption="PAGADOS" DataSourceID="SqlDataSourcePagados">
            <Columns>
                <asp:BoundField DataField="PATRONES" HeaderText="PATRONES" ReadOnly="True" 
                    SortExpression="PATRONES" />
                <asp:BoundField DataField="COTIZANTES" HeaderText="COTIZANTES" ReadOnly="True" 
                    SortExpression="COTIZANTES" />
                <asp:BoundField DataField="MONTO" HeaderText="MONTO" ReadOnly="True" 
                    SortExpression="MONTO" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcePagados" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMaster %>" 
            
            
            ProviderName="<%$ ConnectionStrings:ConnectionStringMaster.ProviderName %>" SelectCommand="SELECT 
count([EMIP_PATRON]) as [PATRONES]
,sum([EMIP_NUM_TRAB_COT]) as [COTIZANTES]
,sum([EMIP_IMP_EYM_FIJA] + EMIP_IMP_EYM_EXCE + EMIP_IMP_EYM_PRED + EMIP_IMP_EYM_PREE + EMIP_IMP_INV_VIDA + EMIP_IMP_RIES_TRA + EMIP_IMP_GUAR + EMIP_IMP_INV_VIDA_O + EMIP_IMP_EYM_EXCE_O + EMIP_IMP_EYM_PRED_O + EMIP_IMP_EYM_PREE_O)  as [MONTO]
FROM [sireca].[dbo].[patrones3301]
where 
(
select
replace(rale2.REGPATR,'-','')
from [rale].[dbo].[3301ACOP240712] AS rale2
where
replace(rale2.REGPATR,'-','')=substring([EMIP_PATRON],2,10)
and rale2.[TD] in ('02')
and year(rale2.[PERIODO])='2012'
and month(rale2.[PERIODO])='5'
) is null

and [EMIP_SUB]='01'
group by [EMIP_SUB]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
