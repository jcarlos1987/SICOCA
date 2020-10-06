Public Class cobrosPorAsignados
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.RedirectPermanent("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString <> "00") And Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod1").ToString.Equals("x") Then
                cargarSiguientes()
                LNombre1.Text = Request.QueryString("nombre").ToString
                LNombre2.Text = Request.QueryString("nombre").ToString
            Else
                Response.RedirectPermanent("~/Login.aspx")
            End If
        End If

    End Sub
    Protected Sub cargarSiguientes()
        Dim consulta As String = "SELECT ptn.razonSocial AS NOMBRE_O_RAZON_SOCIAL, eco.tipoECO AS tipoEco, eco.clave, eco.REG#PATRONAL, ptn.dom AS EMIP_DOM, ptn.loc AS EMIP_LOC, eco.TP, eco.CREDITO, eco.COTIZ, eco.DIAS, eco.CL, eco.ACT#, eco.PRIMA, eco.OMISION, eco.[COP/ACT], eco.RECARGOS, eco.MULTA, eco.TOTAL, eco.fechaEco , eco.sector AS emi_sec FROM sireca.dbo.eco AS eco INNER JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10) "
        consulta += " WHERE ( eco.sector = null "
        Dim st() As String = Request.QueryString("sectores").ToString.Split("-")    
        For Each valor In st           
            If IsNumeric(valor) Then
                consulta += " OR eco.sector = '" & valor & "'"
            End If
        Next
        consulta += " )  AND (eco.subdel = ?) AND (eco.cambiarIncidencia = ?) ORDER BY eco.clave, emi_sec, EMIP_DOM "
        'MsgBox(consulta)
        SqlDataSource2.SelectCommand = consulta
        SqlDataSource2.DataBind()
        'GridView1.DataSourceID = "SqlDataSource2"
    End Sub

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        GridView1.Caption = "<h2>Factura(s): " & GridView1.Rows.Count & "</h2>"
    End Sub
End Class