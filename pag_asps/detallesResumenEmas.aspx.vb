Imports System.IO

Public Class detallesResumenEmas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString.Equals("00")) And Session.Item("SIRECAchmod1").ToString.Equals("x") Then
                If Request.QueryString("busqueda") Is Nothing Then
                Else
                    If Request.QueryString("busqueda").ToString.Equals("DETALLES") Then
                        SqlDataSourceDetallesSeleccion.SelectCommand = cargarDetallesDeuda()
                        SqlDataSourceDetallesSeleccion.DataBind()
                    ElseIf Request.QueryString("busqueda").ToString.Equals("TODOS") Then
                        SqlDataSourceDetallesSeleccion.SelectCommand = cargarDeuda()
                        SqlDataSourceDetallesSeleccion.DataBind()
                    ElseIf Request.QueryString("busqueda").ToString.Equals("EMMANO") Then
                        SqlDataSourceDetallesSeleccion.SelectCommand = cargarNoEstanEnEmma()
                        SqlDataSourceDetallesSeleccion.DataBind()
                    End If
                End If
                GridView5.DataBind()
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub
    Function cargarDeuda() As String
        Dim consulta As String = " SELECT "
        consulta += " (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where [CVE DILIG#]=eco.incidencia) as [INCIDENCIA]"
        consulta += " 	  ,eco.[REG#PATRONAL]"
        consulta += "       ,eco.[NOMBRE O RAZON SOCIAL]"
        consulta += "       ,eco.[CREDITO]"
        consulta += "       ,eco.[COTIZ]"
        consulta += "       ,eco.[DIAS]"
        consulta += "       ,eco.[CL]"
        consulta += "       ,eco.[ACT#]"
        consulta += "       ,eco.[PRIMA]"
        consulta += "       ,eco.[OMISION]"
        consulta += "       ,eco.[COP/ACT]"
        consulta += "       ,eco.[RECARGOS]"
        consulta += "       ,eco.[MULTA]"
        consulta += "       ,eco.[TOTAL]"
        consulta += "       ,eco.[fechaEco]"
        consulta += "       ,(select afi.[nombre] from [fiscamovil].[dbo].[Usuarios] as afi where afi.[id]=eco.[responsable]) as [responsable]"
        consulta += "       ,eco.[cambiarIncidencia]"
        consulta += "       ,eco.[tipoECO]"
        consulta += "       ,eco.[subdel]"
        consulta += "       ,eco.[sector]"
        consulta += " FROM "
        consulta += "   [sireca].[dbo].[eco] as eco,[rale].[dbo].[" & Request.QueryString("rale").ToString & "] AS rale inner join [sireca].[dbo].[patrones33" & Request.QueryString("subdel").ToString & "] AS emma"
        consulta += " on ("
        consulta += " substring(emma.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))"
        consulta += " ) "
        consulta += " WHERE"
        consulta += " eco.[REG#PATRONAL] like replace(rale.REGPATR,'-','')+'%'"
        If Request.QueryString("rale").ToString.IndexOf("COP") = -1 Then
            consulta += " and eco.fechaEco='" & Request.QueryString("periodo").ToString & "' and tipoEco in ('RCV','RCVCOMP')"
            consulta += " and rale.[TD] in ('06')"
        Else
            consulta += " and eco.fechaEco='" & Request.QueryString("periodo").ToString & "' and tipoEco in ('COP','COMP')"
            consulta += " and rale.[TD] in ('02')"
        End If
        'consulta += " and eco.fechaEco='" & Request.QueryString("periodo").ToString & "' and tipoEco in ('COP','COMP')"        
        consulta += " and year(rale.[PERIODO])='" & Request.QueryString("anio").ToString & "'"
        consulta += " and month(rale.[PERIODO])='" & Request.QueryString("mes").ToString & "'"

        Return consulta
    End Function
    Function cargarDetallesDeuda() As String
        Dim consulta As String = " SELECT "
        consulta += " (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where [CVE DILIG#]=eco.incidencia) as [INCIDENCIA]"
        consulta += " 	  ,eco.[REG#PATRONAL]"
        consulta += "       ,eco.[NOMBRE O RAZON SOCIAL]"
        consulta += "       ,eco.[CREDITO]"
        consulta += "       ,eco.[COTIZ]"
        consulta += "       ,eco.[DIAS]"
        consulta += "       ,eco.[CL]"
        consulta += "       ,eco.[ACT#]"
        consulta += "       ,eco.[PRIMA]"
        consulta += "       ,eco.[OMISION]"
        consulta += "       ,eco.[COP/ACT]"
        consulta += "       ,eco.[RECARGOS]"
        consulta += "       ,eco.[MULTA]"
        consulta += "       ,eco.[TOTAL]"
        consulta += "       ,eco.[fechaEco]"
        consulta += "       ,(select afi.[nombre] from [fiscamovil].[dbo].[Usuarios] as afi where afi.[id]=eco.[responsable]) as [responsable]"
        consulta += "       ,eco.[cambiarIncidencia]"
        consulta += "       ,eco.[tipoECO]"
        consulta += "       ,eco.[subdel]"
        consulta += "       ,eco.[sector]"
        consulta += " FROM "
        consulta += "  [sireca].[dbo].[eco] as eco, [rale].[dbo].[" & Request.QueryString("rale").ToString & "] AS rale inner join [sireca].[dbo].[patrones33" & Request.QueryString("subdel").ToString & "] AS emma"
        consulta += " on ("
        consulta += " substring(emma.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))"
        consulta += " ) "
        consulta += " WHERE"
        consulta += " eco.[REG#PATRONAL] like replace(rale.REGPATR,'-','')+'%'"
        If Request.QueryString("rale").ToString.IndexOf("COP") = -1 Then
            consulta += " and eco.fechaEco='" & Request.QueryString("periodo").ToString & "' and tipoEco in ('RCV','RCVCOMP')"
            consulta += " and rale.[TD] in ('06')"
        Else
            consulta += " and eco.fechaEco='" & Request.QueryString("periodo").ToString & "' and tipoEco in ('COP','COMP')"
            consulta += " and rale.[TD] in ('02')"
        End If
        consulta += " and year(rale.[PERIODO])='" & Request.QueryString("anio").ToString & "'"
        consulta += " and month(rale.[PERIODO])='" & Request.QueryString("mes").ToString & "'"
        If Request.QueryString("incidenciakey").ToString.Equals("") Then
            consulta += " and eco.incidencia is null "
        Else
            consulta += " and eco.incidencia = '" & Request.QueryString("incidenciakey").ToString & "'"
        End If
        Return consulta
    End Function
    Function cargarNoEstanEnEmma() As String
        Dim consulta As String = " SELECT "
        consulta += " (SELECT [ACTIVIDAD] FROM [sireca].[dbo].[catalogo] where [CVE DILIG#]=eco.incidencia) as [INCIDENCIA]"
        consulta += " 	  ,eco.[REG#PATRONAL]"
        consulta += "       ,eco.[NOMBRE O RAZON SOCIAL]"
        consulta += "       ,eco.[CREDITO]"
        consulta += "       ,eco.[COTIZ]"
        consulta += "       ,eco.[DIAS]"
        consulta += "       ,eco.[CL]"
        consulta += "       ,eco.[ACT#]"
        consulta += "       ,eco.[PRIMA]"
        consulta += "       ,eco.[OMISION]"
        consulta += "       ,eco.[COP/ACT]"
        consulta += "       ,eco.[RECARGOS]"
        consulta += "       ,eco.[MULTA]"
        consulta += "       ,eco.[TOTAL]"
        consulta += "       ,eco.[fechaEco]"
        consulta += "       ,(select afi.[nombre] from [fiscamovil].[dbo].[Usuarios] as afi where afi.[id]=eco.[responsable]) as [responsable]"
        consulta += "       ,eco.[cambiarIncidencia]"
        consulta += "       ,eco.[tipoECO]"
        consulta += "       ,eco.[subdel]"
        consulta += "       ,eco.[sector]"
        consulta += " FROM "
        consulta += "  [sireca].[dbo].[eco] as eco,[rale].[dbo].[" & Request.QueryString("rale").ToString & "] AS rale"
        consulta += " WHERE"
        consulta += " ("
        consulta += " select substring(emma2.[EMIP_PATRON],2,10) "
        consulta += " from [sireca].[dbo].[patrones33" & Request.QueryString("subdel").ToString & "] AS emma2 "
        consulta += " where substring(emma2.[EMIP_PATRON],2,10) in (replace(rale.REGPATR,'-',''))"
        consulta += " ) is null"
        consulta += " and eco.[REG#PATRONAL] like replace(rale.REGPATR,'-','')+'%'"
        If Request.QueryString("rale").ToString.IndexOf("COP") = -1 Then
            consulta += " and eco.fechaEco='" & Request.QueryString("periodo").ToString & "' and tipoEco in ('RCV','RCVCOMP')"
            consulta += " and rale.[TD] in ('06')"
        Else
            consulta += " and eco.fechaEco='" & Request.QueryString("periodo").ToString & "' and tipoEco in ('COP','COMP')"
            consulta += " and rale.[TD] in ('02')"
        End If
        consulta += " and year(rale.[PERIODO])='" & Request.QueryString("anio").ToString & "'"
        consulta += " and month(rale.[PERIODO])='" & Request.QueryString("mes").ToString & "'"

        Return consulta
    End Function
    Protected Sub GridView5_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView5.PreRender
        GridView5.Caption = GridView5.Rows.Count & " PATRONES DE LA EMA"
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        ExportToExcel(GridView5.Caption.ToString, GridView5)
    End Sub
    Private Sub ExportToExcel(ByVal nameReport As String, ByVal gv As GridView)
        Dim responsePage As HttpResponse = Response
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim pageToRender As New Page()
        Dim form As New HtmlForm()

        pageToRender.EnableEventValidation = False
        pageToRender.DesignerInitialize()

        pageToRender.Controls.Add(form)
        form.Controls.Add(gv)

        pageToRender.RenderControl(htw)
        responsePage.Clear()
        responsePage.Buffer = True
        responsePage.ContentType = "application/vnd.ms-excel"
        responsePage.AddHeader("Content-Disposition", "attachment;filename=" & nameReport & ".xls")
        responsePage.Charset = "UTF-8"
        responsePage.ContentEncoding = Encoding.Default
        responsePage.Write(sw.ToString())
        responsePage.End()
    End Sub
End Class