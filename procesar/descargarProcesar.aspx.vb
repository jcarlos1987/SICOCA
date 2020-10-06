Imports System.IO
Imports System.Data.OleDb
Imports Ionic.Zip

Public Class descargarProcesar
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Not (Session.Item("SIRECA2chmod6").ToString.Equals("DP") And Session.Item("SIRECAchmod7").ToString.Equals("x")) Then
                Server.Transfer("~/accesoDenegado.aspx")
            End If            
        End If
    End Sub
    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        If IsDate(TextBoxFI.Text) And IsDate(TextBoxFF.Text) Then
            LabelError.Text = ""
            'exportacion inicio
            Try
                If Not Directory.Exists(Server.MapPath("~/descargas/procesar/")) Then
                    Directory.CreateDirectory(Server.MapPath("~/descargas/procesar/"))
                End If
                Dim con22 As New OleDbConnection(cadenaconexion)
                Dim cmd22 As New OleDbCommand()
                cmd22.Connection = con22
                Dim nomFile As String = Server.MapPath("~/descargas/procesar/") + Session.Item("SIRECAid").ToString + TextBoxFI.Text.Replace("/", "") + TextBoxFF.Text.Replace("/", "") + ".csv"
                Dim myInsertQueryNomTable As String = ""
                Dim myInsertQueryDatosTable As String = ""
                Dim myInsertQuery22 As String = ""
                myInsertQueryNomTable = " SELECT ''SUBDEL'',''PLAZA'',''REG_PAT'',''RAZON_SOCIAL'',''FOLIO'',''PERIODO'',''FEC_MOV'',''IMP_COP'',''IMP_RCV'' "
                myInsertQueryDatosTable = " SELECT [RCP_SUB] as SUBDEL "
                myInsertQueryDatosTable += ",[RCP_PLAZA] as PLAZA "
                myInsertQueryDatosTable += ",[RCP_REGPAT] as REGPAT "
                'myInsertQueryDatosTable += ",''""""''+razonSocial+''""""'' as NOM_PATRON "
                myInsertQueryDatosTable += ",'''' as NOM_PATRON "
                myInsertQueryDatosTable += ",[RCP_FOLIO] AS [FOLIO] "
                myInsertQueryDatosTable += ",[RCP_PER] AS [PERIODO] "
                myInsertQueryDatosTable += ",convert(varchar(10),[RCP_FEC_MOV],103) AS [FECH_MOV] "
                myInsertQueryDatosTable += ",convert(varchar(20),[RCP_IMP_COP]) as [IMP_COP] "
                myInsertQueryDatosTable += ",convert(varchar(20),[RCP_IMP_RCV]) as [IMP_RCV] "
                'myInsertQueryDatosTable += " FROM [procesar].[dbo].[RCPRO] left join sireca.dbo.patrones on regpat=substring([RCP_REGPAT],1,10) "
                myInsertQueryDatosTable += " FROM [procesar].[dbo].[RCPRO] "
                myInsertQueryDatosTable += "WHERE [RCP_FEC_MOV] between ''" + TextBoxFI.Text + "'' and ''" + TextBoxFF.Text + "'' "
                myInsertQueryDatosTable += "and [RCP_SUB]=''" + DDLSubdel.SelectedValue + "'' "
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
            LabelError.Text = "Seleccione la fecha de mov. del los datos PROCESAR a exportar."
        End If        
    End Sub

    Protected Sub TextBoxFI_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TextBoxFI.Init
        TextBoxFI.Text = "01/" + Now.Month.ToString("D2") + "/" + Now.Year.ToString("D4")
    End Sub

    Protected Sub TextBoxFF_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TextBoxFF.Init
        TextBoxFF.Text = Now.ToShortDateString
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
End Class