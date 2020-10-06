Imports System.Data.OleDb
Imports System.Globalization
Imports addHistorialAcciones
Imports Ionic.Zip
Imports System.IO

Public Class Ciclo2
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Dim histAcciones As HistorialWeb = New HistorialWeb
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            DDLSubdel.Items.Clear()
            For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
                If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                    DDLSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                Else
                    If Session.Item("SIRECAsubdel").ToString.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                        DDLSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                    End If
                End If
            Next
        End If
    End Sub

    Protected Sub DDLReporte_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLReporte.SelectedIndexChanged
        'MultiViewReportes.ActiveViewIndex = DDLReporte.SelectedIndex
        If DDLReporte.SelectedIndex.Equals(1) Then
            DDLInspector.Visible = True
        Else
            DDLInspector.Visible = False
        End If
    End Sub

    Protected Sub DDLInspector_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInspector.PreRender
        If IO.File.Exists(Server.MapPath("~") & "/imagenes/usuarios/" & DDLInspector.SelectedValue & ".jpg") Then
            IBFoto.ImageUrl = "~/imagenes/usuarios/" & DDLInspector.SelectedValue & ".jpg"
        Else
            IBFoto.ImageUrl = "~/imagenes/usuarios/usuarioSireca.jpg"
        End If
    End Sub

    Protected Sub DDLInspector_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLInspector.SelectedIndexChanged
        If IO.File.Exists(Server.MapPath("~") & "/imagenes/usuarios/" & DDLInspector.SelectedValue & ".jpg") Then
            IBFoto.ImageUrl = "~/imagenes/usuarios/" & DDLInspector.SelectedValue & ".jpg"
        Else
            IBFoto.ImageUrl = "~/imagenes/usuarios/usuarioSireca.jpg"
        End If
    End Sub

    Protected Sub BComentar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BComentar.Click
        LError.Text = ""
        If TBObservacion.Text.Replace(" ", "").Length > 1 Then
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " INSERT INTO [sirecaObservaciones].[dbo].[ObservacionInspector]([id_inspector],[id_observo],[fecha_observacion],[observacion],[ip_host]) "
            myInsertQuery22 += " VALUES(?,?,getdate(),?,?) "
            cmd22.CommandText = myInsertQuery22

            cmd22.Parameters.Add("@id_inspector", OleDbType.VarChar).Value = DDLInspector.SelectedValue
            cmd22.Parameters.Add("@id_observo", OleDbType.VarChar).Value = Session.Item("SIRECAid").ToString
            cmd22.Parameters.Add("@observacion", OleDbType.VarChar).Value = TBObservacion.Text
            cmd22.Parameters.Add("@ip_host", OleDbType.VarChar).Value = Request.UserHostAddress()

            con22.Open()
            If cmd22.ExecuteNonQuery() = 0 Then
                LError.Text = "Error al Comentar"
            Else
                Repeater1.DataBind()
            End If
            con22.Close()
        End If
    End Sub

    Protected Sub DVInspector_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles DVInspector.PreRender
        If DVInspector.Rows.Count = 0 Then
            PObservaciones.Visible = False
        Else
            PObservaciones.Visible = True
        End If
    End Sub

    Protected Sub TBFechIni_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechIni.Init
        TBFechIni.Text = DateAdd("d", (1 - Day(Now)), Now).ToShortDateString
    End Sub

    Protected Sub TBFechFin_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFechFin.Init
        TBFechFin.Text = Now.ToShortDateString
    End Sub

    Protected Sub GridViewCuatriSaldo0_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewCuatriSaldo0.PreRender
        Try
            'GridView1.Caption = "INCIDENCIA EN SIRECA: " & tipoIncidenciaSireca 
            'GridView1.FooterRow.Cells(0).Text = "0"
            GridViewCuatriSaldo0.FooterRow.Cells(2).Text = "0"
            GridViewCuatriSaldo0.FooterRow.Cells(3).Text = "0"
            GridViewCuatriSaldo0.FooterRow.Cells(4).Text = "0"
            GridViewCuatriSaldo0.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GridViewCuatriSaldo0.Rows.Count - 1)
                'Dim hl1 As HyperLink = GridViewCuatriSaldo0.Rows(i).FindControl("HyperLink1")
                'GridView1.FooterRow.Cells(0).Text = Convert.ToDouble(GridView1.Rows(i).Cells(0).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(0).Text.Replace(",", ""))
                'GridViewCuatriSaldo0.FooterRow.Cells(3).Text = Convert.ToDouble(hl1.Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewCuatriSaldo0.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridViewCuatriSaldo0.Rows(i).Cells(2).FindControl("HyperLink4"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewCuatriSaldo0.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewCuatriSaldo0.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewCuatriSaldo0.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewCuatriSaldo0.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewCuatriSaldo0.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewCuatriSaldo0.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView1.FooterRow.Cells(0).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(0).Text))
            GridViewCuatriSaldo0.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(2).Text))
            GridViewCuatriSaldo0.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(3).Text))
            GridViewCuatriSaldo0.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(4).Text))
            GridViewCuatriSaldo0.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewCuatriSaldo0.FooterRow.Cells(5).Text))

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewRCuatriOri_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewRCuatriOri.PreRender
        Try
            'GridView1.Caption = "INCIDENCIA EN SIRECA: " & tipoIncidenciaSireca 
            'GridView1.FooterRow.Cells(0).Text = "0"
            GridViewRCuatriOri.FooterRow.Cells(2).Text = "0"
            GridViewRCuatriOri.FooterRow.Cells(3).Text = "0"
            GridViewRCuatriOri.FooterRow.Cells(4).Text = "0"
            GridViewRCuatriOri.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GridViewRCuatriOri.Rows.Count - 1)
                'Dim hl1 As HyperLink = GridViewRCuatriOri.Rows(i).FindControl("HyperLink1")
                'GridView1.FooterRow.Cells(0).Text = Convert.ToDouble(GridView1.Rows(i).Cells(0).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(0).Text.Replace(",", ""))
                'GridViewRCuatriOri.FooterRow.Cells(3).Text = Convert.ToDouble(hl1.Text.Replace(",", "")) + Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewRCuatriOri.FooterRow.Cells(2).Text = Convert.ToDouble(GridViewRCuatriOri.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewRCuatriOri.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewRCuatriOri.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewRCuatriOri.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewRCuatriOri.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewRCuatriOri.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewRCuatriOri.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView1.FooterRow.Cells(0).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(0).Text))
            GridViewRCuatriOri.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(2).Text))
            GridViewRCuatriOri.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(3).Text))
            GridViewRCuatriOri.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(4).Text))
            GridViewRCuatriOri.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewRCuatriOri.FooterRow.Cells(5).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewCuatriSaldo_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewCuatriSaldo.PreRender
        Try
            'GridView1.Caption = "INCIDENCIA EN SIRECA: " & tipoIncidenciaSireca 
            'GridView1.FooterRow.Cells(0).Text = "0"
            GridViewCuatriSaldo.FooterRow.Cells(2).Text = "0"
            GridViewCuatriSaldo.FooterRow.Cells(3).Text = "0"
            GridViewCuatriSaldo.FooterRow.Cells(4).Text = "0"
            GridViewCuatriSaldo.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GridViewCuatriSaldo.Rows.Count - 1)
                'Dim hl1 As HyperLink = GridViewCuatriSaldo.Rows(i).FindControl("HyperLink1")
                'GridView1.FooterRow.Cells(0).Text = Convert.ToDouble(GridView1.Rows(i).Cells(0).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(0).Text.Replace(",", ""))
                'GridViewCuatriSaldo.FooterRow.Cells(3).Text = Convert.ToDouble(hl1.Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewCuatriSaldo.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridViewCuatriSaldo.Rows(i).Cells(2).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewCuatriSaldo.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewCuatriSaldo.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewCuatriSaldo.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewCuatriSaldo.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewCuatriSaldo.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewCuatriSaldo.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView1.FooterRow.Cells(0).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(0).Text))
            GridViewCuatriSaldo.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(2).Text))
            GridViewCuatriSaldo.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(3).Text))
            GridViewCuatriSaldo.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(4).Text))
            GridViewCuatriSaldo.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(5).Text))





            '--------------------------------------------------
            

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewGrupoDili_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewGrupoDili.PreRender
        Try
            'GridView1.Caption = "INCIDENCIA EN SIRECA: " & tipoIncidenciaSireca 
            'GridView1.FooterRow.Cells(0).Text = "0"
            GridViewGrupoDili.FooterRow.Cells(2).Text = "0"
            GridViewGrupoDili.FooterRow.Cells(3).Text = "0"
            GridViewGrupoDili.FooterRow.Cells(4).Text = "..."
            GridViewGrupoDili.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GridViewGrupoDili.Rows.Count - 1)
                'Dim hl1 As HyperLink = GridViewGrupoDili.Rows(i).FindControl("HyperLink1")
                'GridView1.FooterRow.Cells(0).Text = Convert.ToDouble(GridView1.Rows(i).Cells(0).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(0).Text.Replace(",", ""))
                'GridViewGrupoDili.FooterRow.Cells(3).Text = Convert.ToDouble(hl1.Text.Replace(",", "")) + Convert.ToDouble(GridViewGrupoDili.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewGrupoDili.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridViewGrupoDili.Rows(i).Cells(2).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewGrupoDili.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewGrupoDili.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewGrupoDili.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewGrupoDili.FooterRow.Cells(3).Text.Replace(",", ""))
                'GridViewGrupoDili.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewGrupoDili.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridViewGrupoDili.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewGrupoDili.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewGrupoDili.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewGrupoDili.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView1.FooterRow.Cells(0).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(0).Text))
            GridViewGrupoDili.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGrupoDili.FooterRow.Cells(2).Text))
            GridViewGrupoDili.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGrupoDili.FooterRow.Cells(3).Text))
            'GridViewGrupoDili.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewGrupoDili.FooterRow.Cells(4).Text))
            GridViewGrupoDili.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewGrupoDili.FooterRow.Cells(5).Text))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Wizard1_ActiveStepChanged(ByVal sender As Object, ByVal e As EventArgs) Handles Wizard1.ActiveStepChanged
        If Wizard1.ActiveStep.Name.Equals("GENERAL") Then

        ElseIf Wizard1.ActiveStep.Name.Equals("GRUPOS") Then

        ElseIf Wizard1.ActiveStep.Name.Equals("RECAUDACIÓN") Then
            GridViewGrupoDili0.DataBind()
        ElseIf Wizard1.ActiveStep.Name.Equals("CUATRIMESTRE") Then

        End If
    End Sub


    Protected Sub GridViewCuatriSaldo1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewCuatriSaldo1.PreRender
        Try
            'GridView1.Caption = "INCIDENCIA EN SIRECA: " & tipoIncidenciaSireca 
            'GridView1.FooterRow.Cells(0).Text = "0"
            GridViewCuatriSaldo1.FooterRow.Cells(2).Text = "0"
            GridViewCuatriSaldo1.FooterRow.Cells(3).Text = "0"
            GridViewCuatriSaldo1.FooterRow.Cells(4).Text = "0"
            GridViewCuatriSaldo1.FooterRow.Cells(5).Text = "0"
            For i As Int32 = 0 To (GridViewCuatriSaldo1.Rows.Count - 1)
                'Dim hl1 As HyperLink = GridViewCuatriSaldo.Rows(i).FindControl("HyperLink1")
                'GridView1.FooterRow.Cells(0).Text = Convert.ToDouble(GridView1.Rows(i).Cells(0).Text.Replace(",", "")) + Convert.ToDouble(GridView1.FooterRow.Cells(0).Text.Replace(",", ""))
                'GridViewCuatriSaldo.FooterRow.Cells(3).Text = Convert.ToDouble(hl1.Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewCuatriSaldo1.FooterRow.Cells(2).Text = Convert.ToDouble(CType(GridViewCuatriSaldo1.Rows(i).Cells(2).FindControl("HyperLink3"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo1.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewCuatriSaldo1.FooterRow.Cells(3).Text = Convert.ToDouble(GridViewCuatriSaldo1.Rows(i).Cells(3).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo1.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewCuatriSaldo1.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewCuatriSaldo1.Rows(i).Cells(4).Text.Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo1.FooterRow.Cells(4).Text.Replace(",", ""))
                GridViewCuatriSaldo1.FooterRow.Cells(5).Text = Convert.ToDouble(GridViewCuatriSaldo1.Rows(i).Cells(5).Text.Replace("$", "").Replace(",", "")) + Convert.ToDouble(GridViewCuatriSaldo1.FooterRow.Cells(5).Text.Replace("$", "").Replace(",", ""))
            Next
            'GridView1.FooterRow.Cells(0).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridView1.FooterRow.Cells(0).Text))
            GridViewCuatriSaldo1.FooterRow.Cells(2).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo1.FooterRow.Cells(2).Text))
            GridViewCuatriSaldo1.FooterRow.Cells(3).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo1.FooterRow.Cells(3).Text))
            GridViewCuatriSaldo1.FooterRow.Cells(4).Text = String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewCuatriSaldo1.FooterRow.Cells(4).Text))
            GridViewCuatriSaldo1.FooterRow.Cells(5).Text = String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewCuatriSaldo1.FooterRow.Cells(5).Text))
            '--------------------------------------------------


        Catch ex As Exception

        End Try
    End Sub

    Protected Sub CBDel_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs) Handles CBDel.CheckedChanged
        If CBDel.Checked Then
            HiddenFieldDel.Value = "%"
        Else
            HiddenFieldDel.Value = "subdel"
        End If
        GridViewRCuatriOri.DataBind()
        GridViewCuatriSaldo0.DataBind()
        GridViewCuatriSaldo.DataBind()
        GridViewCuatriSaldo1.DataBind()
    End Sub

    Protected Sub BActualizarRGeneral_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BActualizarRGeneral.Click
        If DDLReporte.SelectedIndex.Equals("1") Then
            Wizard1.DataBind()
        Else
            Wizard2.DataBind()
        End If
    End Sub

    Protected Sub BExportar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BExportar.Click
        Try
            If Not Directory.Exists(Server.MapPath("~/descargas/diligenciasC2/")) Then
                Directory.CreateDirectory(Server.MapPath("~/descargas/diligenciasC2/"))
            End If
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim nomFile As String = Server.MapPath("~/descargas/diligenciasC2/") + Session.Item("SIRECAid").ToString + ".csv"
            Dim myInsertQueryNomTable As String = ""
            Dim myInsertQueryDatosTable As String = ""
            Dim myInsertQuery22 As String = ""
            myInsertQueryNomTable = " SELECT ''SUBDEL'',''REG_PATRONAL'',''RAZON_SOCIAL'',''COTIZANTES'',''IMPORTE'',''PERIODO'',''CREDITOS'',''DOC_ENTRGADO'',''DILIGENCIA'',''ASIGNADO'',''INSPECTOR'',''TIPO'' "
            myInsertQueryDatosTable += " SELECT "
            myInsertQueryDatosTable += " [CP_SUBDEL] as SUBDEL "
            myInsertQueryDatosTable += " ,[CP_REGPAT] as PATRONES "
            myInsertQueryDatosTable += ",''""""''+razonSocial+''""""'' as RAZON_SOCIAL "
            myInsertQueryDatosTable += " ,convert(varchar(15),(ptn.cotiz)) as COTIZANTES "
            myInsertQueryDatosTable += " ,convert(varchar(15),(RA_IMPORTE)) as IMPORTE "
            myInsertQueryDatosTable += " ,substring(RA_PERIODO,4,7) as PERIODO "
            myInsertQueryDatosTable += " ,(RA_NUMCRED) as CREDITOS "
            myInsertQueryDatosTable += " ,( "
            myInsertQueryDatosTable += " select dili.desc_tipo from sirecacobros.dbo.cae_tipodoc as dili where dili.id_tipo=(select top 1 AC_DOC_ENTRGADO from sirecacobros.dbo.CO_ACCIONES where AC_RA_REGPATR=[CP_REGPAT] and AC_RA_NUMCRED=RA_NUMCRED order by [AC_FECH_DILIGENCIA] desc) "
            myInsertQueryDatosTable += " ) as DOC_ENTRGADO "
            myInsertQueryDatosTable += " ,( "
            myInsertQueryDatosTable += " select replace(dili.desc_diligencia,''> seleccione'',''CITATORIO'') from sirecacobros.dbo.cae_diligencia as dili where dili.id_diligencia=(select top 1 AC_DILIGENCIA from sirecacobros.dbo.CO_ACCIONES where AC_RA_REGPATR=[CP_REGPAT] and AC_RA_NUMCRED=RA_NUMCRED order by [AC_FECH_DILIGENCIA] desc) "
            myInsertQueryDatosTable += " ) as DILIGENCIA "
            myInsertQueryDatosTable += " ,convert(nvarchar(10),CP_FECH_ASIG,103) as ASIGNADO "
            myInsertQueryDatosTable += " ,(select upper(nombre) from fiscamovil.dbo.usuarios as uf where uf.id=CP_INSPEC) as INSPECTOR "
            myInsertQueryDatosTable += " ,RA_TIPO as TIPO "
            myInsertQueryDatosTable += " FROM [sirecacobros].[dbo].[CO_CPATRONAL] inner join sirecacobros.dbo.CO_RALE on RA_REGPATR=CP_REGPAT "
            myInsertQueryDatosTable += " left join sireca.dbo.eco on substring(REG#PATRONAL,1,10)=RA_REGPATR and CREDITO=RA_NUMCRED and tipoeco in (''COP'',''COMP'',''RCV'',''RCVCOMP'') "
            myInsertQueryDatosTable += " left join sireca.dbo.patrones as ptn on regpat=RA_REGPATR "
            myInsertQueryDatosTable += " WHERE  "
            myInsertQueryDatosTable += " [CP_INSPEC] is not null "
            myInsertQueryDatosTable += " and cp_subdel=''" + DDLSubdel.SelectedValue + "'' "
            myInsertQueryDatosTable += " and ra_subdel=''" + DDLSubdel.SelectedValue + "'' "
            myInsertQueryDatosTable += " and RA_TIPO like ''" + DDLEco.SelectedValue + "'' "
            myInsertQueryDatosTable += " and [CP_FECH_ASIG] between ''" + TBFechIni.Text + "'' and ''" + TBFechFin.Text + "'' "
            myInsertQueryDatosTable += " and RA_VIVO=''SI'' and RA_INC in (''01'',''02'',''31'',''32'',''43'') "
            myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomFile + """ -T -c -C -q -t"","" -r""\n""' "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()

            Response.Clear()
            Response.BufferOutput = False
            Response.ContentType = "application/zip"
            Response.AddHeader("content-disposition", "filename=DiligenciasCiclo2" + Now.ToShortDateString.Replace("/", "-") + ".zip")
            Using zip As ZipFile = New ZipFile
                zip.AddFile(nomFile, "")
                zip.Save(Response.OutputStream)
                'zip.Save(Server.MapPath("~/descargas/diligenciasC2/") + Session.Item("SIRECAid").ToString + nomRale + ".zip")
            End Using
            Response.Close()
        Catch ex As Exception
            'Label24.Text = ex.Message
        End Try
    End Sub
End Class