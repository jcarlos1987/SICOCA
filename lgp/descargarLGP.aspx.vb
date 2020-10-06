Imports System.IO
Imports Ionic.Zip
Imports System.Data.OleDb

Public Class descargarLGP
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Not (Session.Item("SIRECA2chmod4").ToString.Equals("DL") And Session.Item("SIRECAchmod7").ToString.Equals("x")) Then
                Server.Transfer("~/accesoDenegado.aspx")
            End If
        End If
    End Sub
    
    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        If IsDate(TextBoxFI.Text) And IsDate(TextBoxFF.Text) Then
            LabelError.Text = ""
            'exportacion inicio
            Try
                If Not Directory.Exists(Server.MapPath("~/descargas/lgp/")) Then
                    Directory.CreateDirectory(Server.MapPath("~/descargas/lgp/"))
                End If
                Dim con22 As New OleDbConnection(cadenaconexion)
                Dim cmd22 As New OleDbCommand()
                cmd22.Connection = con22
                Dim nomFile As String = Server.MapPath("~/descargas/lgp/") + Session.Item("SIRECAid").ToString + TextBoxFI.Text.Replace("/", "") + TextBoxFF.Text.Replace("/", "") + ".csv"
                Dim myInsertQueryNomTable As String = ""
                Dim myInsertQueryDatosTable As String = ""
                Dim myInsertQuery22 As String = ""
                myInsertQueryNomTable = " SELECT ''FECHA_MOV'',''REG_PATRONAL'',''MOD'',''PERIODO'',''CREDITO'',''DOC'',''DEL'',''SUBDEL'',''FOLIO'',''OPEN_CAJA'',''CAJA'',''HORA_CAPTURA'',''USUARIO'',''ERROR'',''FEC_CAPTURA'',''DEL_USU'',''SUB_USU'',''IMP_EYM_FIJA'',''IMP_EYM_ADI'',''IMP_EYM_DIN'',''IMP_EYM_PEN'',''IMP_RT'',''IMP_IV'',''IMP_GUAR'',''IMP_TOTAL'',''IMP_ACT'',''IMP_INT'',''IMP_EJE'' "
                myInsertQueryDatosTable = " SELECT convert(varchar(10),[RC_FEC_MOV],103) AS [FECHA_MOV] "
                myInsertQueryDatosTable += ",(SUBSTRING([RC_PATRON],2,8)) AS [REG_PATRONAL] "
                myInsertQueryDatosTable += ",convert(nvarchar(20),[RC_MOD]) as MOD "
                myInsertQueryDatosTable += ",convert(nvarchar(10),[RC_PER],103) AS [PERIODO] "
                myInsertQueryDatosTable += ",convert(nvarchar(20),[RC_CRED]) AS [CREDITO] "
                'myInsertQueryDatosTable += ",''""""''+ptn.razonSocial+''""""'' as NOM_PATRON "
                myInsertQueryDatosTable += ",convert(varchar(10),[RC_DOC]) AS [DOC] "
                myInsertQueryDatosTable += ",convert(varchar(10),[RC_DEL]) AS [DEL] "
                myInsertQueryDatosTable += ",convert(varchar(10),[RC_SUB]) AS [SUBDEL] "
                myInsertQueryDatosTable += ",convert(varchar(10),[RC_NUM_FOL]) AS [FOLIO] "
                myInsertQueryDatosTable += ",convert(varchar(10),[RC_OPE_CAJA]) AS [OPEN_CAJA] "
                myInsertQueryDatosTable += ",convert(varchar(10),[RC_CAJA]) AS [CAJA] "
                myInsertQueryDatosTable += ",convert(varchar(10),[RC_HORA_CAP],108) as [HORA_CAPTURA] "
                myInsertQueryDatosTable += ",convert(varchar(20),RC_USU) as USUARIO "
                myInsertQueryDatosTable += ",convert(varchar(20),RC_ERROR) as ERROR "
                myInsertQueryDatosTable += ",convert(varchar(10),[RC_FEC_CAP],103) as [FEC_CAPTURA] "
                myInsertQueryDatosTable += ",convert(varchar(20),RC_DEL_USU) as DEL_USU "
                myInsertQueryDatosTable += ",convert(varchar(20),RC_SUB_USU) as SUB_USU "
                myInsertQueryDatosTable += ",convert(varchar(20),[RC_IMP_EYM_FIJA]) as [IMP_EYM_FIJA] "
                myInsertQueryDatosTable += ",convert(varchar(20),[RC_IMP_EYM_ADI]) as [IMP_EYM_ADI] "
                myInsertQueryDatosTable += ",convert(varchar(20),[RC_IMP_EYM_DIN]) as [IMP_EYM_DIN] "
                myInsertQueryDatosTable += ",convert(varchar(20),[RC_IMP_EYM_PEN]) as [IMP_EYM_PEN] "
                myInsertQueryDatosTable += ",convert(varchar(20),[RC_IMP_RT]) as [IMP_RT] "
                myInsertQueryDatosTable += ",convert(varchar(20),[RC_IMP_IV]) as [IMP_IV] "
                myInsertQueryDatosTable += ",convert(varchar(20),[RC_IMP_GUAR]) as [IMP_GUAR] "
                myInsertQueryDatosTable += ",convert(varchar(20),[RC_IMP_TOT]) as [IMP_TOTAL] "
                myInsertQueryDatosTable += ",convert(varchar(20),[RC_IMP_ACT]) as [IMP_ACT] "
                myInsertQueryDatosTable += ",convert(varchar(20),[RC_IMP_INT]) as [IMP_INT] "
                myInsertQueryDatosTable += ",convert(varchar(20),[RC_IMP_EJE]) as [IMP_EJE] "
                myInsertQueryDatosTable += "FROM [lgp].[dbo].[RC] "
                myInsertQueryDatosTable += "WHERE RC_FEC_MOV between ''" + TextBoxFI.Text + "'' and ''" + TextBoxFF.Text + "'' "
                myInsertQueryDatosTable += "and [RC_SUB]=''" + DropDownSubdel.SelectedValue + "'' "
                myInsertQuery22 = " exec xp_cmdshell 'bcp """ + myInsertQueryNomTable + " union all " + myInsertQueryDatosTable + """ queryout """ + nomFile + """ -T -c -C -q -t"","" -r""\n""' "
                cmd22.CommandText = myInsertQuery22
                con22.Open()
                cmd22.ExecuteNonQuery()
                con22.Close()

                Response.Clear()
                Response.BufferOutput = False
                Response.ContentType = "application/zip"
                Response.AddHeader("content-disposition", "filename=" + TextBoxFI.Text.Replace("/", "-") + "_" + TextBoxFF.Text.Replace("/", "-") + ".zip")
                Using zip As ZipFile = New ZipFile
                    zip.AddFile(nomFile, "")
                    zip.Save(Response.OutputStream)
                    'zip.Save(Server.MapPath("~") + "/descargas/rale/" + Session.Item("SIRECAid").ToString + nomRale + ".zip")
                End Using
                Response.Close()
            Catch ex As Exception
                LabelError.Text = LabelError.Text + " _ " + ex.Message
            End Try
            'exportacion fin
        Else
            LabelError.Text = "Seleccione la fecha de mov. del los datos LGP a exportar."
        End If
    End Sub

    Protected Sub DropDownSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DropDownSubdel.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            DropDownSubdel.Items.Clear()
            For i As Int32 = 0 To (subdelDDList.Split(",").Length - 1)
                If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                    DropDownSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                Else
                    If Session.Item("SIRECAsubdel").ToString.Equals(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)) Then
                        DropDownSubdel.Items.Add(New ListItem(subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(1), subdelDDList.Split(",").GetValue(i).ToString.Split("_").GetValue(0)))
                    End If
                End If
            Next
        End If
    End Sub

    Protected Sub TextBoxFI_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TextBoxFI.Init
        TextBoxFI.Text = "01/" + Now.Month.ToString("D2") + "/" + Now.Year.ToString("D4")
    End Sub

    Protected Sub TextBoxFF_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TextBoxFF.Init
        TextBoxFF.Text = Now.ToShortDateString
    End Sub
End Class