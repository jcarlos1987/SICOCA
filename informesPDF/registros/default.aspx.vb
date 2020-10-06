Imports CrystalDecisions.Shared
Imports System.IO
Imports Ionic.Zip
Imports System.Data.OleDb

Public Class _default26
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim salarioBase As String = ConfigurationSettings.AppSettings("salarioMinimo")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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

    Protected Sub LBCargar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBCargar.Click
        LMsg.Text = ""
        If FUBase.FileName.Replace(" ", "").Equals("") Then
            LMsg.Text = "SELECCIONE LA BASE A CARGAR COMPRIMIDO EN .zip"
        Else
            If FUBase.FileName.ToLower.Contains(".zip") Then
                cargarPatronesCancelar()
            Else
                LMsg.Text = "SELECCIONE LA BASE A CARGAR COMPRIMIDO EN .zip"
            End If
        End If
        GridViewPatrones.DataBind()
    End Sub
    Private Sub cargarPatronesCancelar()
        Dim ruta As String = ""
        If Not Directory.Exists(Server.MapPath("~") & "\temp\registroCancelacion\") Then
            Directory.CreateDirectory(Server.MapPath("~") & "\temp\registroCancelacion\")
        End If
        ruta = Server.MapPath("~") & "\temp\registroCancelacion\" & Session.Item("SIRECAsubdel").ToString & "_" & Session.Item("SIRECAid").ToString & Now.ToShortDateString.Replace("/", "_") & FUBase.FileName
        'ruta = ruta.Replace(".zip", "")
        If System.IO.File.Exists(ruta) Then
            LMsg.Text = "BASE " + FUBase.FileName + " CARGADA, DE NO SER ASI CAMBIE EL NOMBRE DEL ARCHIVO E INTENTE NUEVAMENTE."
        Else
            Dim fechaSivepa As String = ""
            Dim periodoSivepa As String = ""
            'carga del archivo
            FUBase.SaveAs(ruta)
            'extraccion del archivo
            Using zip As ZipFile = ZipFile.Read(ruta)
                zip.StatusMessageTextWriter = System.Console.Out
                zip.ExtractAll(ruta.Replace(".zip", ""))
            End Using
            Dim frale As String() = Directory.GetFiles(ruta.Replace(".zip", ""))
            For i As Int32 = 0 To (frale.Length - 1)
                ruta = frale.GetValue(i).ToString
                Exit For
            Next
            generarDBPatronesCancelar(ruta, ("basepatronescancelar" + Session.Item("SIRECAsubdel").ToString + Session.Item("SIRECAid").ToString))
        End If
    End Sub
    Private Sub generarDBPatronesCancelar(ByVal ruta As String, ByVal nomBase As String)
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = " if exists(select * from tempdb.dbo.sysobjects where name = '" + nomBase + "')  "
            textConmand += " begin  "
            textConmand += " drop table [tempdb].[dbo].[" + nomBase + "] "
            textConmand += " end  "
            textConmand += " CREATE TABLE [tempdb].[dbo].[" + nomBase + "]( "
            textConmand += " [B_REGPAT] [varchar](10) NULL, "
            textConmand += " [B_FECHA_CLASIFICACION] [datetime] NULL, "
            textConmand += " [B_AFIL_01] [varchar](1000) NULL, "
            textConmand += " [B_DOMICILIO_FISCAL] [varchar](1000) NULL, "
            textConmand += " [B_REFERENCIA] [varchar](50) NULL "
            textConmand += " ) ON [PRIMARY] "
            textConmand += "BULK INSERT [tempdb].[dbo].[" + nomBase + "] "
            textConmand += "FROM '" + ruta + "' "
            textConmand += "WITH( "
            textConmand += "FIELDTERMINATOR=',', "
            textConmand += "ROWTERMINATOR='\n', "
            textConmand += "FIRE_TRIGGERS "
            textConmand += ")"
            catCMD.CommandText = textConmand
            nwindConn.Open()
            catCMD.ExecuteNonQuery()
            nwindConn.Close()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub HiddenFieldSlarioMin_Init(ByVal sender As Object, ByVal e As EventArgs) Handles HiddenFieldSlarioMin.Init
        HiddenFieldSlarioMin.Value = salarioBase
    End Sub

    Protected Sub LBDictamen_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        Dim valores As String() = CType(sender, LinkButton).CommandArgument.Split("_")
        valores.GetValue(0).ToString()
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" _
                                                 & Request.Url.AbsoluteUri.ToString.ToLower.Replace("default.aspx", "dictamen_r3.aspx?" _
                                                                                                    & "subdel=" & valores.GetValue(0).ToString _
                                                                                                    & "&regpat=" & valores.GetValue(1).ToString _
                                                                                                    & "&credmax=" & valores.GetValue(2).ToString _
                                                                                                    & "&credcop=" & valores.GetValue(3).ToString _
                                                                                                    & "&credrcv=" & valores.GetValue(4).ToString _
                                                                                                    & "&integrador=" & valores.GetValue(5).ToString _
                                                                                                    & "&ralecop=" & valores.GetValue(6).ToString _
                                                                                                    & "&ralercv=" & valores.GetValue(7).ToString _
                                                                                                    & "&export=PDF") _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800');")
    End Sub

    Protected Sub LBSolicitud_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        Dim valores As String() = CType(sender, LinkButton).CommandArgument.Split("_")
        valores.GetValue(0).ToString()
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" _
                                                 & Request.Url.AbsoluteUri.ToString.ToLower.Replace("default.aspx", "solicitud.aspx?" _
                                                                                                    & "subdel=" & valores.GetValue(0).ToString _
                                                                                                    & "&regpat=" & valores.GetValue(1).ToString _
                                                                                                    & "&credmax=" & valores.GetValue(2).ToString _
                                                                                                    & "&credcop=" & valores.GetValue(3).ToString _
                                                                                                    & "&credrcv=" & valores.GetValue(4).ToString _
                                                                                                    & "&integrador=" & valores.GetValue(5).ToString _
                                                                                                    & "&ralecop=" & valores.GetValue(6).ToString _
                                                                                                    & "&ralercv=" & valores.GetValue(7).ToString _
                                                                                                    & "&export=PDF") _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800');")
    End Sub

    Protected Sub LBAnalisis_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        Dim valores As String() = CType(sender, LinkButton).CommandArgument.Split("_")
        valores.GetValue(0).ToString()
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" _
                                                 & Request.Url.AbsoluteUri.ToString.ToLower.Replace("default.aspx", "analisis.aspx?" _
                                                                                                    & "subdel=" & valores.GetValue(0).ToString _
                                                                                                    & "&regpat=" & valores.GetValue(1).ToString _
                                                                                                    & "&credmax=" & valores.GetValue(2).ToString _
                                                                                                    & "&credcop=" & valores.GetValue(3).ToString _
                                                                                                    & "&credrcv=" & valores.GetValue(4).ToString _
                                                                                                    & "&integrador=" & valores.GetValue(5).ToString _
                                                                                                    & "&ralecop=" & valores.GetValue(6).ToString _
                                                                                                    & "&ralercv=" & valores.GetValue(7).ToString _
                                                                                                    & "&export=PDF") _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800');")
    End Sub

    Protected Sub LBDictamenWord_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        Dim valores As String() = CType(sender, LinkButton).CommandArgument.Split("_")
        valores.GetValue(0).ToString()
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" _
                                                 & Request.Url.AbsoluteUri.ToString.ToLower.Replace("default.aspx", "dictamen_r3.aspx?" _
                                                                                                    & "subdel=" & valores.GetValue(0).ToString _
                                                                                                    & "&regpat=" & valores.GetValue(1).ToString _
                                                                                                    & "&credmax=" & valores.GetValue(2).ToString _
                                                                                                    & "&credcop=" & valores.GetValue(3).ToString _
                                                                                                    & "&credrcv=" & valores.GetValue(4).ToString _
                                                                                                    & "&integrador=" & valores.GetValue(5).ToString _
                                                                                                    & "&ralecop=" & valores.GetValue(6).ToString _
                                                                                                    & "&ralercv=" & valores.GetValue(7).ToString _
                                                                                                    & "&export=WORD") _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800');")
    End Sub

    Protected Sub LBSolicitudWord_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        Dim valores As String() = CType(sender, LinkButton).CommandArgument.Split("_")
        valores.GetValue(0).ToString()
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" _
                                                 & Request.Url.AbsoluteUri.ToString.ToLower.Replace("default.aspx", "solicitud.aspx?" _
                                                                                                    & "subdel=" & valores.GetValue(0).ToString _
                                                                                                    & "&regpat=" & valores.GetValue(1).ToString _
                                                                                                    & "&credmax=" & valores.GetValue(2).ToString _
                                                                                                    & "&credcop=" & valores.GetValue(3).ToString _
                                                                                                    & "&credrcv=" & valores.GetValue(4).ToString _
                                                                                                    & "&integrador=" & valores.GetValue(5).ToString _
                                                                                                    & "&ralecop=" & valores.GetValue(6).ToString _
                                                                                                    & "&ralercv=" & valores.GetValue(7).ToString _
                                                                                                    & "&export=WORD") _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800');")
    End Sub

    Protected Sub LBAnalisisWord_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        Dim valores As String() = CType(sender, LinkButton).CommandArgument.Split("_")
        valores.GetValue(0).ToString()
        CType(sender, LinkButton).Attributes.Add("onClick", "javascript:window.open('" _
                                                 & Request.Url.AbsoluteUri.ToString.ToLower.Replace("default.aspx", "analisis.aspx?" _
                                                                                                    & "subdel=" & valores.GetValue(0).ToString _
                                                                                                    & "&regpat=" & valores.GetValue(1).ToString _
                                                                                                    & "&credmax=" & valores.GetValue(2).ToString _
                                                                                                    & "&credcop=" & valores.GetValue(3).ToString _
                                                                                                    & "&credrcv=" & valores.GetValue(4).ToString _
                                                                                                    & "&integrador=" & valores.GetValue(5).ToString _
                                                                                                    & "&ralecop=" & valores.GetValue(6).ToString _
                                                                                                    & "&ralercv=" & valores.GetValue(7).ToString _
                                                                                                    & "&export=WORD") _
                                                 & "','imprimir','top=50, left=300,menubar=0,toolbar=0,directories=0, location=0, status=0, height=500, width=800');")
    End Sub
End Class