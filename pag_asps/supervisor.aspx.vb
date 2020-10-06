Imports System.IO
Imports System.Data.OleDb

Public Class supervisor
    Inherits System.Web.UI.Page
    Dim fechaGlobal As String = ""
    Dim anioInicio As Int32 = Convert.ToInt32(ConfigurationSettings.AppSettings("anioInicio"))
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString <> "00") And Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod7").ToString.Equals("x") Then
                'If Session.Item("SIRECA2chmod10").ToString.Equals("SUP") Then
                'Else
                'Response.Redirect("~/accesoDenegado.aspx")
                'End If
                Try
                    'cargarTotalSectores()
                    'cargarTotalSectoresLibres()
                    'cargarTotalSectoresFaltantes()
                    'HLFaltantes.NavigateUrl = "~/pag_asps/Faltantes.aspx?periodo=" & VXPeriodo.SelectedValue
                Catch ex As Exception
                    'MsgBox(ex.StackTrace)
                    'MsgBox(ex.ToString())
                End Try
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub    
    
    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton3.Click
        SqlDataSourceNL.DataBind()
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        GridView1.Caption = "" & GridView1.Rows.Count & " Caso(s) del periodo " & DDLMes.SelectedValue & "/" & DDLAnio.SelectedValue
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

    Protected Sub ImageButton6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton6.Click
        ExportToExcel("doc", GridView2)
    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        ExportToExcel("doc", GridView1)
    End Sub


    Protected Sub ImageButton8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton8.Click
        ExportToExcel("docD", GridView5)
    End Sub

    Protected Sub GridView5_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView5.RowCreated
        GridView5.Caption = "" & GridView5.Rows.Count & " Depurados del periodo " & DDLMes.SelectedValue & "/" & DDLAnio.SelectedValue
    End Sub

    Protected Sub MenuSupervisor_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles MenuSupervisor.MenuItemClick

        If MenuSupervisor.SelectedValue.Equals("notificadores") Then
            panel2.Visible = False
            panel3.Visible = False
            panel4.Visible = False
            panel5.Visible = False

            panel1.Visible = True
            GridView2.DataBind()
        ElseIf MenuSupervisor.SelectedValue.Equals("autodeterminar") Then
            panel1.Visible = False
            panel2.Visible = False
            panel3.Visible = False
            panel5.Visible = False

            panel4.Visible = True
        ElseIf MenuSupervisor.SelectedValue.Equals("no localizados") Then
            panel1.Visible = False
            panel2.Visible = False
            panel4.Visible = False
            panel5.Visible = False

            panel3.Visible = True
            GridView1.DataSourceID = "SqlDataSourceNL"
            GridView1.DataBind()
        ElseIf MenuSupervisor.SelectedValue.Equals("autodeterminados") Then
            panel1.Visible = False
            panel2.Visible = False
            panel4.Visible = False
            panel5.Visible = False

            panel3.Visible = True
            GridView1.DataSourceID = "SqlDataSourceAuto"
            GridView1.DataBind()
        ElseIf MenuSupervisor.SelectedValue.Equals("notificados") Then
            panel1.Visible = False
            panel2.Visible = False
            panel4.Visible = False
            panel5.Visible = False

            panel3.Visible = True
            GridView1.DataSourceID = "SqlDataSourceNotificados"
            GridView1.DataBind()
        ElseIf MenuSupervisor.SelectedValue.Equals("depurados") Then
            panel1.Visible = False
            panel2.Visible = False
            panel3.Visible = False
            panel4.Visible = False

            panel5.Visible = True
            GridView5.DataBind()
        ElseIf MenuSupervisor.SelectedValue.Equals("busqueda") Then
            panel1.Visible = False
            panel3.Visible = False
            panel4.Visible = False
            panel5.Visible = False

            panel2.Visible = True
            GridView3.DataBind()
        ElseIf MenuSupervisor.SelectedValue.Equals("depurar") Then
        ElseIf MenuSupervisor.SelectedValue.Equals("reportes") Then

        End If
    End Sub

    Protected Sub GridView2_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView2.PreRender
        GridView2.Caption = "" & GridView2.Rows.Count & " Inspectores del Periodo: " & DDLMes.SelectedValue & "/" & DDLAnio.SelectedValue
    End Sub

    Protected Sub ImageButton9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton9.Click
        If CheckBox1.Checked Then
            If VARegPat.Text.Length = 10 Then
                Label15.Text = ""
                Dim con As New OleDbConnection(cadenaconexion)
                Dim cmd As New OleDbCommand()
                cmd.Connection = con
                Dim myInsertQuery As String = "INSERT INTO [sireca].[dbo].[autodeterminados] ([regpat],[tipoEco],[periodo],[fechaRegistro],[idRegistro],[subdel])"
                myInsertQuery += " values(?, ?, ?, ?, ?, ?)"
                cmd.CommandText = myInsertQuery

                'cmd.Parameters.Add("@id", OleDbType.Double).Value = 1
                cmd.Parameters.Add("@regpat", OleDbType.VarChar).Value = VARegPat.Text.ToUpper
                cmd.Parameters.Add("@tipoEco", OleDbType.VarChar).Value = VATipo.Text
                cmd.Parameters.Add("@periodo", OleDbType.Double).Value = Convert.ToDouble(VAMes.Text & VAAnio.Text)
                cmd.Parameters.Add("@fechaRegistro", OleDbType.Date).Value = Now
                cmd.Parameters.Add("@idRegistro", OleDbType.Integer).Value = Convert.ToInt32(Session.Item("SIRECAid").ToString)
                cmd.Parameters.Add("@subdel", OleDbType.VarChar).Value = Session.Item("SIRECAsubdel").ToString

                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
                GridView6.DataBind()
                CheckBox1.Checked = False
            Else
                Label15.Text = "Ingrese un Registro Patronal Valido"
            End If
        Else
            Label15.Text = "Confirme el registro"
        End If
    End Sub

    Protected Sub GridView3_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView3.PreRender
        GridView3.Caption = "" & GridView3.Rows.Count & " Resultados del periodo " & DDLMes.SelectedValue & "/" & DDLAnio.SelectedValue
        If VXRegPat.Text.Equals("%") Then
            VXRegPat.Text = ""
        End If
        If VXRaSocial.Text.Equals("%") Then
            VXRaSocial.Text = ""
        End If
        If VXSectores.Text.Equals("%") Then
            VXSectores.Text = ""
        End If
        If VXCreditos.Text.Equals("%") Then
            VXCreditos.Text = ""
        End If
        If VXIncidencia.Text.Equals("%") Then
            VXIncidencia.Text = ""
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        If Session.Item("SIRECAchmod4").ToString.Equals("x") Then        
            Try
                'Asignacion de casos
                'If IsNothing(TBFecha.Text.Replace(" ", "")) Then
                'Else

                If IsDate(TBFecha.Text) Then
                    fechaGlobal = TBFecha.Text
                    Dim longitud As Int32 = (GridView2.Rows.Count - 1)
                    Dim datos As String = ""

                    For i As Int16 = 0 To (longitud)
                        'GridView2.Rows(i).Cells(9).Visible = True
                        Dim idUser As String = GridView2.Rows(i).Cells(9).Text
                        Dim casosMaximos As Int32 = GridView2.Rows(i).Cells(7).Text
                        Dim sectoresMaximos As String = GridView2.Rows(i).Cells(2).Text
                        datos += idUser & "_" & casosMaximos & "_" & sectoresMaximos & "-9999" & "="
                        'GridView2.Rows(i).Cells(9).Visible = False
                    Next
                    Dim dato As String() = datos.Split("=")
                    For i As Int16 = 0 To (dato.Length - 2)
                        Dim valor As String() = dato(i).Split("_")
                        asignarCobro(valor(0).ToString, valor(0).ToString, Convert.ToInt32(valor(1)), valor(2).ToString)
                    Next
                    GridView2.DataBind()
                    GridView7.DataBind()
                End If
                'End If
            Catch ex As Exception
                'MsgBox(ex.StackTrace)
            End Try
        Else
            Server.Transfer("~/accesoDenegado.aspx")
        End If
    End Sub

    Function casosExistente(ByVal sectores As String) As Int32
        Dim facturasExistentes As Int32 = 0
        Try
            Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textCon As String = " SELECT COUNT (*) "
            textCon += " FROM sireca.dbo.eco AS eco "
            textCon += " WHERE eco.validacion in ('SIN PAGO','LGP PARCIAL','PROCESAR PARCIAL') "
            textCon += " and not exists(SELECT pa.[regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] as pa where pa.subdel='" + Session.Item("SIRECAsubdel").ToString + "' and pa.[regpatr]=substring(reg#patronal,1,10) and aplica like 'NOT%') "
            textCon += " and fechaeco = '" & Convert.ToInt32(DDLMes.SelectedValue & DDLAnio.SelectedValue) & "' "
            textCon += " and (eco.sector = '9999' "
            Dim st() As String = sectores.Split("-")
            For Each valor In st
                textCon += " OR eco.sector = '" & valor & "' "
            Next
            textCon += ") AND (eco.subdel = '" & Session.Item("SIRECAsubdel").ToString & "') AND (eco.cambiarIncidencia = '9')  /*and eco.TP not in ('0*','1*','2*','3*','4*','5*','6*','7*','8*','9*')*/ AND (eco.incidencia is null) " & DDLTipoEco.SelectedValue
            catCMD.CommandText = textCon
            nwindConn.Open()
            Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
            Do While myReader.Read()
                If IsNumeric(myReader.GetValue(0).ToString) Then
                    facturasExistentes = Convert.ToInt32(myReader.GetValue(0).ToString)
                Else
                    facturasExistentes = 0
                End If
            Loop
            myReader.Close()
            nwindConn.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
        Return facturasExistentes
    End Function
    Function cantidadCasos(ByVal valorUser As String) As Int32
        Dim nwindConnx As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMDx As OleDbCommand = nwindConnx.CreateCommand()
        Dim textConx As String = "SELECT COUNT(DISTINCT(eco.[REG#PATRONAL])) as total"
        textConx += " FROM [sireca].[dbo].[eco] as eco "
        textConx += " where (eco.responsable = '" & valorUser & "')"
        textConx += " and tipoeco in ('COP','COMP','RCV','RCVCOMP') "
        textConx += " AND eco.cambiarIncidencia in ('0','1') AND convert(datetime,eco.fechaSeleccion,103) = convert(datetime,'" & fechaGlobal & "',103) "
        'textConx += " GROUP BY eco.responsable"
        'MsgBox(valorUser)
        'MsgBox(textConx)
        catCMDx.CommandText = textConx
        nwindConnx.Open()
        Dim myReaderx As OleDbDataReader = catCMDx.ExecuteReader()
        Dim cantidadx As Integer = 0
        Do While myReaderx.Read()
            Dim vvx As Object = myReaderx.GetValue(0)
            If IsNumeric(vvx) Then
                cantidadx = Convert.ToInt32(vvx)
            Else
                cantidadx = 0
            End If
        Loop
        myReaderx.Close()
        nwindConnx.Close()

        Return cantidadx
    End Function
    Protected Sub asignarCobro(ByVal valorNombre As String, ByVal valorUser As String, ByVal facturasMax As Int32, ByVal sectores As String)
        Try
        'busqueda--------------------------------------------------------------------
            Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textCon As String = " "
            textCon += " select prioridad,totalxsector,REGPAT,muni,cp,dom "
            textCon += " from ( "
            textCon += " SELECT substring(eco.REG#PATRONAL,1,2) as cv "
            textCon += " ,eco.incidenciarale "
            textCon += " ,eco.REG#PATRONAL as REGPAT "
            textCon += " ,eco.tipoECO "
            textCon += " ,eco.id "
            textCon += " ,eco.COTIZ "
            textCon += " ,ptn.lng "
            textCon += " ,ptn.lat "
            textCon += " ,eco.sector "
            textCon += " ,ptn.dom "
            textCon += " ,eco.omision   "
            textCon += " ,substring(ptn.loc,1,6) as muni  "
            textCon += " ,substring(ptn.loc,len(ptn.loc)-5,6) as cp  "
            textCon += " ,(case when eco.tipoeco in ('COP','COMP') then 2 else ( "
            textCon += " select count(*) from sireca.dbo.eco AS eco2  "
            textCon += " where eco2.subdel = eco.subdel  "
            textCon += " AND eco2.cambiarIncidencia = eco.cambiarIncidencia  "
            textCon += " AND (eco2.incidencia is null)  "
            textCon += " and eco2.reg#patronal=eco.reg#patronal "
            textCon += " and eco2.fechaeco=eco.fechaeco "
            textCon += " ) end) as prioridad  "

            textCon += " ,(SELECT SUM(ecox.OMISION) "
            textCon += " FROM sireca.dbo.eco AS ecox "
            textCon += " WHERE "
            textCon += " ecox.cambiarIncidencia = '9' /*and eco.TP not in ('0*','1*','2*','3*','4*','5*','6*','7*','8*','9*')*/ AND ecox.incidencia is null "
            textCon += " and not exists(SELECT pa.[regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] as pa where pa.subdel='" + Session.Item("SIRECAsubdel").ToString + "' and pa.[regpatr]=substring(ecox.reg#patronal,1,10) and aplica like 'NOT%') "
            textCon += " and ecox.validacion in ('SIN PAGO','LGP PARCIAL','PROCESAR PARCIAL') "
            textCon += " and ecox.fechaeco='" & Convert.ToInt32(DDLMes.SelectedValue & DDLAnio.SelectedValue).ToString & "' "
            textCon += " and ecox.SECTOR=eco.SECTOR "            
            textCon += "  AND ecox.subdel = '" & Session.Item("SIRECAsubdel").ToString & "' and ecox.TIPOECO IN ('COP','COMP') ) as totalxsector "


            textCon += " FROM sireca.dbo.eco AS eco LEFT JOIN sireca.dbo.patrones AS ptn ON ptn.regpat=SUBSTRING(eco.REG#PATRONAL,1,10)  "
            textCon += " WHERE  "
            textCon += " eco.cambiarIncidencia = '9' /*and eco.TP not in ('0*','1*','2*','3*','4*','5*','6*','7*','8*','9*')*/ AND eco.incidencia is null "
            textCon += " and not exists(SELECT pa.[regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] as pa where pa.subdel='" + Session.Item("SIRECAsubdel").ToString + "' and pa.[regpatr]=substring(reg#patronal,1,10) and aplica like 'NOT%') "
            textCon += " AND eco.validacion in ('SIN PAGO','LGP PARCIAL','PROCESAR PARCIAL') "
            textCon += " and fechaeco='" & Convert.ToInt32(DDLMes.SelectedValue & DDLAnio.SelectedValue).ToString & "' "
            textCon += " and (eco.sector='9999999' "
            Dim st() As String = sectores.Split("-")
            For Each valor In st
                textCon += " OR eco.sector='" & valor & "' "
            Next
            textCon += " ) AND eco.subdel = '" & Session.Item("SIRECAsubdel").ToString & "'  " & DDLTipoEco.SelectedValue
            textCon += " ) as resultado "
            textCon += " group by prioridad,totalxsector,REGPAT,muni,cp,dom "
            textCon += " order by prioridad desc,totalxsector desc,muni,cp,dom "
            'MsgBox(textCon)
        catCMD.CommandText = textCon
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Dim vid As String = ""
        Dim cont As Int32 = 0
        Dim facturasExistentes As Int32 = 0
        Do While myReader.Read()
                vid = myReader.GetValue(2).ToString
                cont = cantidadCasos(valorUser)
                facturasExistentes = casosExistente(sectores)
                If ((cont < facturasMax) And (facturasExistentes > 0)) Then
                    cont += 1
                    Dim con As New OleDbConnection(cadenaconexion)
                    Dim cmd As New OleDbCommand()
                    cmd.Connection = con
                    Dim myInsertQuery As String = " update [sireca].[dbo].[eco] set [nomResponsable]=?,[cambiarIncidencia]=?,[responsable] = ? ,[fechaSeleccion] = ?,[diasDisponibles]=?, [grado1]=?, [grado2]=? "
                    myInsertQuery += " WHERE "
                    myInsertQuery += " eco.cambiarIncidencia = '9' /*and eco.TP not in ('0*','1*','2*','3*','4*','5*','6*','7*','8*','9*')*/ AND eco.incidencia is null "
                    myInsertQuery += " and not exists(SELECT pa.[regpatr] FROM [sirecacobros].[dbo].[patronesAlianza] as pa where pa.subdel='" & Session.Item("SIRECAsubdel").ToString & "' and pa.[regpatr]=substring(reg#patronal,1,10) and aplica like 'NOT%') "
                    myInsertQuery += " and eco.validacion in ('SIN PAGO','LGP PARCIAL','PROCESAR PARCIAL') "
                    myInsertQuery += " and eco.subdel = '" & Session.Item("SIRECAsubdel").ToString & "' and tipoeco in ('COP','COMP','RCV','RCVCOMP') "
                    myInsertQuery += " and convert(datetime,( "
                    myInsertQuery += " case len(fechaeco) "
                    myInsertQuery += " when 5 then '01/0'+substring(convert(varchar(6),fechaeco),1,1)+'/'+substring(convert(varchar(6),fechaeco),2,4) "
                    myInsertQuery += " else '01/'+substring(convert(varchar(6),fechaeco),1,2)+'/'+substring(convert(varchar(6),fechaeco),3,4) "
                    myInsertQuery += " end "
                    myInsertQuery += " ),103)<='01/" & DDLMes.SelectedValue & "/" & DDLAnio.SelectedValue & "' "
                    myInsertQuery += " and reg#patronal=? "
                    cmd.CommandText = myInsertQuery

                    cmd.Parameters.Add("@nomResponsable", OleDbType.VarChar).Value = valorNombre
                    cmd.Parameters.Add("@cambiarIncidencia", OleDbType.Double).Value = 0
                    cmd.Parameters.Add("@responsable", OleDbType.VarChar).Value = valorUser
                    cmd.Parameters.Add("@fechaSeleccion", OleDbType.Date).Value = fechaGlobal
                    cmd.Parameters.Add("@diasDisponibles", OleDbType.Double).Value = 0
                    cmd.Parameters.Add("@grado1", OleDbType.VarChar).Value = "6666"
                    cmd.Parameters.Add("@grado2", OleDbType.VarChar).Value = "SIN ATENDER"
                    cmd.Parameters.Add("@regpat", OleDbType.VarChar).Value = vid
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                Else
                    cont = cantidadCasos(valorUser)
                    'facturasExistentes = casosExistente(sectores)
                    If cont = facturasMax Then
                        Exit Do
                        'Else
                        '   If facturasMax < facturasExistentes Then
                        'asignarCobro(valorNombre, valorUser, facturasMax, sectores)
                        'Else
                        'Exit Do
                        'End If
                    End If
                End If
            'fin asignar cobro---------------------------------------------------------------
        Loop
        myReader.Close()
        nwindConn.Close()
            'GridView2.DataBind()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
    End Sub

    Protected Sub HLFaltantes_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles HLFaltantes.PreRender
        HLFaltantes.NavigateUrl = "~/pag_asps/Faltantes.aspx?periodo=" & DDLMes.SelectedValue & DDLAnio.SelectedValue
    End Sub

    Protected Sub DDLMes_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLMes.Init
        DDLMes.SelectedIndex = (Month(DateAdd(DateInterval.Month, -1, Now)) - 1)
    End Sub

    Protected Sub DDLAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            DDLAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next
        DDLAnio.SelectedIndex = DDLAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub

    Protected Sub VAAnio_Init(ByVal sender As Object, ByVal e As EventArgs) Handles VAAnio.Init
        For i As Int32 = 0 To (Year(Now) - anioInicio)
            VAAnio.Items.Add(New ListItem((Year(Now) - i), (Year(Now) - i)))
        Next        
        VAAnio.SelectedIndex = VAAnio.Items.IndexOf(New ListItem(Year(DateAdd(DateInterval.Month, -1, Now)).ToString, Year(DateAdd(DateInterval.Month, -1, Now)).ToString))
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        VXRegPat.Text = VXRegPat.Text.Replace(" ", "")
        'VXRaSocial.Text = VXRaSocial.Text.Replace(" ", "")
        VXSectores.Text = VXSectores.Text.Replace(" ", "")
        VXCreditos.Text = VXCreditos.Text.Replace(" ", "")
        VXIncidencia.Text = VXIncidencia.Text.Replace(" ", "")

        If VXRegPat.Text.Equals("") Then
            VXRegPat.Text = "%"
        End If
        If VXRaSocial.Text.Equals("") Then
            VXRaSocial.Text = "%"
        End If
        If VXSectores.Text.Equals("") Then
            VXSectores.Text = "%"
        End If
        If VXCreditos.Text.Equals("") Then
            VXCreditos.Text = "%"
        End If
        If VXIncidencia.Text.Equals("") Then
            VXIncidencia.Text = "%"
        End If
        If VXIncidencia.Text.Equals("%") Then
            GridView3.DataSourceID = "SqlDataSourcePatronesScan0"
            'SqlDataSourcePatronesScan0.DataBind()
        Else
            GridView3.DataSourceID = "SqlDataSourcePatronesScan"
            'SqlDataSourcePatronesScan.DataBind()
        End If
        GridView3.DataBind()
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton2.Click
        ExportToExcel("doc", GridView3)
    End Sub
End Class