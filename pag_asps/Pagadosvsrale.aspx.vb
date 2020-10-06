Public Class Pagadosvsrale
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else            
            If (Session.Item("SIRECAsubdel").ToString <> "00") And Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod1").ToString.Equals("x") Then
                HFSubdel.Value = Session.Item("SIRECAsubdel").ToString
                SqlDataSourceRale.DataBind()
                DDLTabla.DataBind()
                SqlDataSourcePagVsRale.SelectCommand = cadena()
                SqlDataSourcePagVsRale.DataBind()
                GridView1.DataBind()
            Else
                HFSubdel.Value = "%"
                Response.Redirect("~/Login.aspx")
            End If
        End If

    End Sub
    Function cadena() As String
        Dim cad As String = "Select eco.[id]"
        cad += ",eco.[REG#PATRONAL]"
        cad += ",eco.[TP]"
        cad += ",eco.[NOMBRE O RAZON SOCIAL]"
        cad += ",eco.[CREDITO]"
        cad += ",eco.[COTIZ]"
        cad += ",eco.[DIAS]"
        cad += ",eco.[CL]"
        cad += ",eco.[ACT#]"
        cad += ",eco.[PRIMA]"
        cad += ",eco.[OMISION]"
        cad += ",eco.[COP/ACT]"
        cad += ",eco.[RECARGOS]"
        cad += ",eco.[MULTA]"
        cad += ",eco.[TOTAL]"
        cad += ",eco.[fechaEco]"
        cad += ",eco.[responsable]"
        cad += ",eco.[fechaSeleccion]"
        cad += ",eco.[cambiarIncidencia]"
        cad += ",eco.[tipoECO]"
        cad += ",eco.[diasDisponibles]"
        cad += ",eco.[clave]"
        cad += ",eco.[incidencia]"
        cad += ",eco.[nomResponsable]"
        cad += ",eco.[horaCitatorio]"
        cad += ",eco.[fechaCaptura]"
        cad += ",eco.[ecoOriginal]"
        cad += ",eco.[cobrarMulta]"
        cad += ",eco.[subdel]"
        cad += ",eco.[sector]"
        cad += ",eco.[grado1]"
        cad += ",eco.[grado2]"
        cad += ",eco.[grado3]"
        cad += ",rale.mov as [RALE_MOV]"
        cad += ",rale.fmov as [RALE_FECHA_MOV]"
        cad += ",rale.numcred as [RALE_NUM_CREDITO]"
        cad += ",rale.falta as [RALE_FALTA]"
        cad += ",rale.feinc as [RALE_FECHA_INI]"
        cad += ",rale.importe as [RALE_IMPORTE]"
        cad += ",(convert(varchar,month(rale.[PERIODO]))+convert(varchar,year(rale.[PERIODO])))"
        cad += ",substring(rale.[PERIODO],7,4)"
        cad += " FROM [sireca].[dbo].[eco] as eco,[rale].[dbo].[" & DDLTabla.SelectedValue & "] as rale"
        cad += " WHERE eco.[REG#PATRONAL] like replace(rale.[REGPATR],'-','')+'%'"
        cad += " and eco.fechaEco in ((convert(varchar,month(rale.[PERIODO]))+convert(varchar,year(rale.[PERIODO]))))"
        cad += " and eco.[REG#PATRONAL] like ?+'%'"
        If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
            cad += " and eco.subdel like '%'"
        Else
            cad += " and eco.subdel like '" & Session.Item("SIRECAsubdel").ToString & "%'"
        End If
        cad += " order by eco.[COTIZ] desc"
        Return cad
    End Function

    Protected Sub DDLTabla_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLTabla.SelectedIndexChanged
        If (Session.Item("SIRECAsubdel").ToString <> "00") And Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod1").ToString.Equals("x") Then
            HFSubdel.Value = Session.Item("SIRECAsubdel").ToString
            SqlDataSourceRale.DataBind()
            DDLTabla.DataBind()
            SqlDataSourcePagVsRale.SelectCommand = cadena()
            SqlDataSourcePagVsRale.DataBind()
            GridView1.DataBind()
        Else
            HFSubdel.Value = "%"
            Response.Redirect("~/Login.aspx")
        End If
    End Sub
End Class