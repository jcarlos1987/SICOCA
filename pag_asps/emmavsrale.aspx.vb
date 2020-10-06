Public Class emmavsrale
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GVDeudas_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GVDeudas.PreRender
        GVDeudas.Caption = GVDeudas.Rows.Count
    End Sub

    Protected Sub GVNotRale_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GVNotRale.PreRender
        GVNotRale.Caption = GVNotRale.Rows.Count
    End Sub

    Protected Sub BActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BActualizar.Click
        
        SqlDataSourceDeudas.SelectCommand = consultaDeuda()
        SqlDataSourceDeudas.DataBind()
        GVDeudas.DataBind()

        SqlDataSourceNotRale.SelectCommand = consultaNotRale()
        SqlDataSourceNotRale.DataBind()
        GVNotRale.DataBind()
    End Sub
    Function consultaDeuda() As String
        Dim vsubdel As String = DDLSubdel.SelectedValue
        Dim vperiodo As String = DDLPeriodo.SelectedValue
        Dim vrale As String = DDLRale.SelectedValue
        Dim vanio As String = "0"
        Dim vmes As String = "0"
        If vperiodo.Length = 5 Then
            vanio = vperiodo.Substring(1, 4)
            vmes = vperiodo.Substring(0, 1)
        Else
            vanio = vperiodo.Substring(2, 4)
            vmes = "0" & vperiodo.Substring(0, 2)
        End If

        Dim consulta As String = " drop table [sireca].[dbo].[patrones33" & vsubdel & "]"
        consulta += " SELECT * INTO [sireca].[dbo].[patrones33" & vsubdel & "]"
        If vmes.Length = 1 Then
            consulta += " FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'D:\CDDATA\0" & vmes & "" & vanio.Substring(2, 2) & "\EMIS33" & vsubdel & ".mdb';'Admin';'', 'SELECT * FROM cdempa0" & vmes & "" & vanio & "')"
        Else
            consulta += " FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'D:\CDDATA\" & vmes & "" & vanio.Substring(2, 2) & "\EMIS33" & vsubdel & ".mdb';'Admin';'', 'SELECT * FROM cdempa" & vmes & "" & vanio & "')"
        End If

        consulta += " AS EMA3333"
        consulta += " SELECT distinct(replace(rale.REGPATR,'-','')) AS [REG_PATRONAL],[PERIODO],[IMPORTE] AS [IMPORTE_RALE]"
        consulta += " ,("
        consulta += " Select eco2.incidencia"
        consulta += " from [sireca].[dbo].[eco] AS eco2"
        consulta += " where eco2.[reg#patronal] like replace(rale.REGPATR,'-','')+'%'"
        consulta += " and eco2.fechaEco='" & vperiodo & "' and eco2.subdel='" & vsubdel & "'"
        consulta += " )  as incidencia"
        consulta += " FROM"
        consulta += " [rale].[dbo].[" & vrale & "] AS rale"
        consulta += " WHERE"
        consulta += " ("
        consulta += " Select substring(emma2.[EMIP_PATRON], 2, 10)"
        consulta += " from [sireca].[dbo].[patrones33" & vsubdel & "] AS emma2 "
        consulta += " where substring(emma2.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))"
        consulta += " ) is null"
        consulta += " and rale.[TD] in ('02')"
        consulta += " and year(rale.[PERIODO])='" & vanio & "'"
        consulta += " and month(rale.[PERIODO])='" & vmes & "'"
        consulta += " group by rale.REGPATR,[PERIODO],[IMPORTE]"
        Return consulta
    End Function

    Function consultaNotRale() As String
        Dim vsubdel As String = DDLSubdel.SelectedValue
        Dim vperiodo As String = DDLPeriodo.SelectedValue
        Dim vrale As String = DDLRale.SelectedValue
        Dim vanio As String = "0"
        Dim vmes As String = "0"
        If vperiodo.Length = 5 Then
            vanio = vperiodo.Substring(1, 4)
            vmes = vperiodo.Substring(0, 1)
        Else
            vanio = vperiodo.Substring(2, 4)
            vmes = "0" & vperiodo.Substring(0, 2)
        End If

        Dim consulta As String = " drop table [sireca].[dbo].[patrones33" & vsubdel & "]"
        consulta += " SELECT * INTO [sireca].[dbo].[patrones33" & vsubdel & "]"
        If vmes.Length = 1 Then
            consulta += " FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'D:\CDDATA\0" & vmes & "" & vanio.Substring(2, 2) & "\EMIS33" & vsubdel & ".mdb';'Admin';'', 'SELECT * FROM cdempa0" & vmes & "" & vanio & "')"
        Else
            consulta += " FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'D:\CDDATA\" & vmes & "" & vanio.Substring(2, 2) & "\EMIS33" & vsubdel & ".mdb';'Admin';'', 'SELECT * FROM cdempa" & vmes & "" & vanio & "')"
        End If
        consulta += " AS EMA3333"
        consulta += " SELECT distinct(replace(rale.REGPATR,'-','')) AS [REG_PATRONAL],[PERIODO],[IMPORTE] AS [IMPORTE_RALE]"
        consulta += " ,("
        consulta += " Select eco2.incidencia"
        consulta += " from [sireca].[dbo].[eco] AS eco2"
        consulta += " where eco2.[reg#patronal] like replace(rale.REGPATR,'-','')+'%'"
        consulta += " and eco2.fechaEco='" & vperiodo & "' and eco2.subdel='" & vsubdel & "'"
        consulta += " )  as incidencia"
        consulta += " FROM"
        consulta += " [rale].[dbo].[" & vrale & "] AS rale"
        consulta += " WHERE"
        consulta += " ("
        consulta += " Select substring(emma2.[EMIP_PATRON], 2, 10)"
        consulta += " from [sireca].[dbo].[patrones33" & vsubdel & "] AS emma2 "
        consulta += " where substring(emma2.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))"
        consulta += " ) is not null"
        consulta += " and rale.[TD] in ('02')"
        consulta += " and year(rale.[PERIODO])='" & vanio & "'"
        consulta += " and month(rale.[PERIODO])='" & vmes & "'"
        consulta += " group by rale.REGPATR,[PERIODO],[IMPORTE]"
        Return consulta
    End Function
End Class