Imports System.Data.OleDb

Public Class asignacionautomatica
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
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

    Protected Sub BActualizarRGeneral_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BActualizarRGeneral.Click
        GridViewInspectores.DataBind()
    End Sub

    Protected Sub BActualizarRGeneral0_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BActualizarRGeneral0.Click
        GridViewSinAccion.DataBind()
    End Sub

    Protected Sub TBFDiliSSP_Init(ByVal sender As Object, ByVal e As EventArgs)
        CType(sender, TextBox).Text = Now.ToShortDateString
    End Sub

    Protected Sub LBGuardar_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim sectoresv As String = CType(GridViewInspectores.Rows(CInt(CType(sender, LinkButton).CommandArgument)).Cells(3).FindControl("TBSectores"), TextBox).Text
        Dim idinspectorv As String = CType(GridViewInspectores.Rows(CInt(CType(sender, LinkButton).CommandArgument)).Cells(3).FindControl("HFIdInspector"), HiddenField).Value
        setSectores(sectoresv, idinspectorv)
        GridViewInspectores.DataBind()
    End Sub
    Protected Sub LBGSSP_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim gv As GridView = CType(GridViewSinAccion.Rows(CInt(CType(sender, LinkButton).CommandArgument)).Cells(8).FindControl("GridViewCredSAsig"), GridView)
        For i As Int32 = 0 To (gv.Rows.Count - 1)
            Dim id_siv As String = (CType(gv.Rows(i).Cells(0).FindControl("HFIdSiv"), HiddenField).Value)
            Dim dili As String = (CType(gv.Rows(i).Cells(6).FindControl("DDLDiliSSP"), DropDownList).SelectedValue)
            Dim fechaDili As String = (CType(gv.Rows(i).Cells(6).FindControl("TBFDiliSSP"), TextBox).Text)
            Dim obser As String = (CType(gv.Rows(i).Cells(6).FindControl("TBObservacion"), TextBox).Text)
            Dim confirmado As Boolean = (CType(gv.Rows(i).Cells(7).FindControl("CBConfirm"), CheckBox).Checked)
            If confirmado Then
                setDiligencia(id_siv, dili, fechaDili, obser)
            End If
            GridViewSinAccion.DataBind()
        Next
    End Sub
    Protected Sub setAsignacionAutomatica(ByVal subdel As String, ByVal sectores As String, ByVal id_inspector As String, ByVal fech_ini As String, ByVal fech_fin As String)
        'MsgBox("setAsignacionAutomatica")
        'MsgBox(DDLAnuExtOpor.SelectedValue)
        'MsgBox(DDLCopRcv.SelectedValue)
        Try
            Dim nwindConn As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim myInsertQuery As String = " SELECT "
            myInsertQuery += " (select upper(nombre) from fiscamovil.dbo.usuarios where id = max(CPSV_INSPEC)) as INSPECTOR "
            myInsertQuery += " ,[SV_REG_PATRONAL] AS REGPAT "
            myInsertQuery += " ,COUNT([SV_CREDITO]) AS CREDITO "
            myInsertQuery += " ,MAX([SV_COTIZ]) AS COTIZ "
            myInsertQuery += " ,SUM([SV_EMI_REAL]) as ADEUDO "
            myInsertQuery += " ,SECTOR "
            myInsertQuery += " ,SUM([SV_RECAUDACION]) AS PAGO "
            myInsertQuery += " ,SUM([SV_DIFERENCIA]) AS SALDO "
            myInsertQuery += " FROM [sirecasivepas].[dbo].[SV_BASE] "
            myInsertQuery += " left join "
            myInsertQuery += " sirecasivepas.dbo.SV_CPATRONAL on CPSV_REGPAT=[SV_REG_PATRONAL] "
            myInsertQuery += " left join "
            myInsertQuery += " sireca.dbo.patrones on regpat=substring(sv_reg_patronal,1,10) "
            myInsertQuery += " where [SV_CREDITO] is not null "
            myInsertQuery += " and [SV_SUBDEL]='" & subdel & "' "
            myInsertQuery += " and SV_TIPO like '" & DDLAnuExtOpor.SelectedValue & "' "
            myInsertQuery += " and SV_SIVEPA like '" & DDLCopRcv.SelectedValue & "' "
            myInsertQuery += " AND NOT EXISTS(SELECT [SVD_SV_ID] FROM [sirecasivepas].[dbo].[SV_DILI_BASE] WHERE [SVD_SV_ID]=[SV_ID]) "
            myInsertQuery += " and CONVERT(VARCHAR(10),[SV_FECHA],103) BETWEEN CONVERT(DATETIME,'" & fech_ini & "',103) AND CONVERT(DATETIME,'" & fech_fin & "',103) "
            myInsertQuery += " and CPSV_INSPEC is null "
            myInsertQuery += " and sector in (" & sectores.Replace("-", ",") & ") "
            myInsertQuery += " GROUP BY SECTOR,[SV_REG_PATRONAL] "
            myInsertQuery += " order by SECTOR,SALDO desc "
            catCMD.CommandText = myInsertQuery
            nwindConn.Open()
            Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
            Dim cobrosAsignados As Int32 = 0
            Do While myReader.Read()
                'MsgBox("ok")
                If cobrosAsignados < DDLPatAsignar.SelectedValue Then
                    'MsgBox((myReader.GetValue(1).ToString) & "," & id_inspector)
                    cargarCargaAseptada1(myReader.GetValue(1).ToString, id_inspector)
                    cargarCargaAseptada2(myReader.GetValue(1).ToString, id_inspector)
                Else
                    Exit Do
                End If
                cobrosAsignados += 1
            Loop
            myReader.Close()
            nwindConn.Close()
        Catch ex As Exception
            Response.Write(ex.StackTrace)
        End Try
    End Sub

    Protected Sub cargarCargaAseptada1(ByVal regpat As String, ByVal inspector As String)
        'MsgBox("cargarCargaAseptada1")
        Try
            'LError.Text = ""
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22

            Dim myInsertQuery22 As String = " UPDATE [sirecasivepas].[dbo].[SV_CPATRONAL] "
            myInsertQuery22 += " SET [CPSV_HOST] ='" & Request.UserHostAddress & "' "
            myInsertQuery22 += " ,[CPSV_FECH_SISTEM] = getdate() "
            myInsertQuery22 += " ,[CPSV_ID_SUPER] = " & Session.Item("SIRECAid").ToString
            myInsertQuery22 += " ,[CPSV_FECH_ASIG] = getdate() "
            myInsertQuery22 += " ,[CPSV_INSPEC] =  " & inspector
            myInsertQuery22 += " WHERE [CPSV_SUBDEL]='" & DDLSubdel.SelectedValue & "' and substring([CPSV_REGPAT],1,10)=substring('" & regpat & "',1,10) "

            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
        Catch ex As Exception
            Response.Write(ex.StackTrace)
        End Try
    End Sub

    Protected Sub cargarCargaAseptada2(ByVal regpat As String, ByVal inspector As String)
        'MsgBox("cargarCargaAseptada2")
        Try
            'LError.Text = ""
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = " UPDATE [sirecasivepas].[dbo].[SV_BASE] "
            myInsertQuery22 += " SET [SV_ASIG_INSPECTOR] = " & inspector
            myInsertQuery22 += " ,[SV_ASIG_INSPECTOR_FECHA] = getdate() "
            myInsertQuery22 += " ,[SV_ASIG_ID_SUPER] = " & Session.Item("SIRECAid").ToString
            myInsertQuery22 += " ,[SV_ASIG_FECHA] = getdate() "
            myInsertQuery22 += " ,[SV_ASIG_IP] =  '" & Request.UserHostAddress & "'"
            myInsertQuery22 += " WHERE [SV_REG_PATRONAL]='" & regpat & "' and [SV_SUBDEL]='" & DDLSubdel.SelectedValue & "' and [SV_ASIG_INSPECTOR] is null "
            myInsertQuery22 += " and SV_TIPO like '" & DDLAnuExtOpor.SelectedValue & "' "
            myInsertQuery22 += " and SV_SIVEPA like '" & DDLCopRcv.SelectedValue & "' "
            'Dim myInsertQuery22 As String = " UPDATE [sirecasivepas].[dbo].[SV_CPATRONAL] "
            'myInsertQuery22 += " SET [CPSV_HOST] ='" & Request.UserHostAddress & "' "
            'myInsertQuery22 += " ,[CPSV_FECH_SISTEM] = getdate() "
            'myInsertQuery22 += " ,[CPSV_ID_SUPER] = " & Session.Item("SIRECAid").ToString
            'myInsertQuery22 += " ,[CPSV_FECH_ASIG] = getdate() "
            'myInsertQuery22 += " ,[CPSV_INSPEC] =  " & inspector
            'myInsertQuery22 += " WHERE [CPSV_SUBDEL]='" & DDLSubdel.SelectedValue & "' and substring([CPSV_REGPAT],1,10)=substring('" & regpat & "',1,10)"

            cmd22.CommandText = myInsertQuery22
            con22.Open()
            cmd22.ExecuteNonQuery()
            con22.Close()
        Catch ex As Exception
            Response.Write(ex.StackTrace)
        End Try
    End Sub

    Protected Sub setSectores(ByVal sectorv As String, ByVal idinspectorv As String)
        Try
            Dim con As New OleDbConnection(cadenaconexion)
            Dim cmd As New OleDbCommand()
            cmd.Connection = con

            Dim myInsertQuery As String = " UPDATE [sireca].[dbo].[usuarios] "
            myInsertQuery += " SET [sectores] = '" & sectorv & "' "
            myInsertQuery += " WHERE [id]= " & idinspectorv

            cmd.CommandText = myInsertQuery
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
        Catch ex As Exception

        End Try
    End Sub
    Protected Sub setDiligencia(ByVal idSivepa As String, ByVal diligenia As String, ByVal fecha As String, ByVal observacion As String)
        Try
            Dim con As New OleDbConnection(cadenaconexion)
            Dim cmd As New OleDbCommand()
            cmd.Connection = con

            Dim myInsertQuery As String = " INSERT INTO [sirecasivepas].[dbo].[SV_DILI_BASE] "
            myInsertQuery += " ([SVD_IP] "
            myInsertQuery += " ,[SVD_FECH_SYSTEM] "
            myInsertQuery += " ,[SVD_USUARIO] "
            myInsertQuery += " ,[SVD_FECH_DILI] "
            myInsertQuery += " ,[SVD_DILI] "
            myInsertQuery += " ,[SVD_OBSERV] "
            myInsertQuery += " ,[SVD_SV_ID]) "
            myInsertQuery += " VALUES "
            myInsertQuery += " ('" + Request.UserHostAddress + "'"
            myInsertQuery += " ,getdate() "
            myInsertQuery += " ,'" + Session.Item("SIRECAid").ToString + "'"
            myInsertQuery += " ,convert(datetime,'" + fecha + "',103)"
            myInsertQuery += " ,'" + diligenia + "'"
            myInsertQuery += " ,'" + observacion + "' "
            myInsertQuery += " ," + idSivepa + ") "

            cmd.CommandText = myInsertQuery
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LBAsingAutomat_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBAsingAutomat.Click
        For i As Int32 = 0 To (GridViewInspectores.Rows.Count - 1)
            Dim subdel As String = DDLSubdel.SelectedValue
            Dim sectores As String = GridViewInspectores.Rows(i).Cells(1).Text
            Dim idinspector As String = CType(GridViewInspectores.Rows(i).Cells(4).FindControl("HFIdUser"), HiddenField).Value
            Dim fech_ini As String = DDLFSIni.SelectedValue
            Dim fech_fin As String = DDLFSFin.SelectedValue
            'MsgBox(subdel & "," & sectores & "," & idinspector & "," & fech_ini & "," & fech_fin)
            setAsignacionAutomatica(subdel, sectores, idinspector, fech_ini, fech_fin)
        Next
        DDLFechIni.DataBind()
        DDLFechFin.DataBind()
        GridViewInspectores.DataBind()
        GridViewSinAccion.DataBind()
    End Sub
End Class