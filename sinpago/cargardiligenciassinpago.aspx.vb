Imports Ionic.Zip
Imports System.Data.OleDb

Public Class cargardiligenciassinpago
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        Label4.Text = ""
        If FileUpload1.FileName.Length > 4 Then
            cargarDiligencias(DDLSubdel.SelectedValue)
            registrarDiligencias(Session.Item("SIRECAdel").ToString, DDLSubdel.SelectedValue, DDLBase.SelectedValue)
        Else
            Label4.Text = " Seleccione el archivo .zip a cargar."
        End If

    End Sub

    Function cargarDiligencias(ByVal subdev As String) As Int32
        Dim cargado As Int32 = 0
        Dim ruta As String = ""
        Dim rutaContendZip As String = ""
        If Not System.IO.Directory.Exists(Server.MapPath("~\temp\cargadilisinpago\")) Then
            System.IO.Directory.CreateDirectory(Server.MapPath("~\temp\cargadilisinpago\"))
        End If
        If FileUpload1.FileName.Replace(" ", "").Equals("") Then
        Else
            ruta = Server.MapPath("~\temp\cargadilisinpago\") & Session.Item("SIRECAid").ToString & Now.ToShortDateString.Replace("/", "_") & FileUpload1.FileName
            'ruta = ruta.Replace(".zip", "")
            If System.IO.File.Exists(ruta) Then
                System.IO.File.Delete(ruta)
            End If
            If System.IO.Directory.Exists(ruta.Replace(".zip", "")) Then
                System.IO.Directory.Delete(ruta.Replace(".zip", ""), True)
            End If
            Dim nombreRale As String = ""
            'carga del archivo
            FileUpload1.SaveAs(ruta)
            'extraccion del archivo
            Using zip As ZipFile = ZipFile.Read(ruta)
                zip.StatusMessageTextWriter = System.Console.Out
                'Status Messages will be sent to the console during extraction
                zip.ExtractAll(ruta.Replace(".zip", ""))
            End Using
            rutaContendZip = System.IO.Directory.GetFiles(ruta.Replace(".zip", "")).GetValue(0).ToString()

        End If
        'cargar en sql server
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = " if exists(select * from tempdb.dbo.sysobjects where name = 'dilisinpago" + subdev + "') "
            textConmand += " begin"
            textConmand += " drop table [tempdb].[dbo].[dilisinpago" + subdev + "] "
            textConmand += " end"
            textConmand += " CREATE TABLE [tempdb].[dbo].[dilisinpago" + subdev + "]( "
            textConmand += " 	[REG_PATRONAL] [nvarchar](255) NULL, "
            textConmand += " 	[TD] [nvarchar](255) NULL, "
            textConmand += " 	[INC] [nvarchar](255) NULL, "
            textConmand += " 	[CREDITO] [nvarchar](255) NULL, "
            textConmand += " 	[PERIODO] [nvarchar](50) NULL, "
            textConmand += " 	[IMPORTE] [float] NULL, "
            textConmand += " 	[RAZON_SOCIAL] [nvarchar](255) NULL, "
            textConmand += " 	[COTIZANTES] [int] NULL, "
            textConmand += " 	[SECTOR] [nvarchar](50) NULL, "
            textConmand += " 	[DILIGENCIA] [nvarchar](255) NULL, "
            textConmand += " 	[FECH_DILIGENCIA] [datetime] NULL "
            textConmand += " ) ON [PRIMARY] "
            textConmand += "BULK INSERT [tempdb].[dbo].[dilisinpago" + subdev + "] "
            textConmand += "FROM '" + rutaContendZip + "' "
            textConmand += "WITH( "
            textConmand += "FIELDTERMINATOR=',' "
            textConmand += ",ROWTERMINATOR='\n' "
            textConmand += ",FIRSTROW=2 "
            'textConmand += ",FIRE_TRIGGERS "
            textConmand += ")"
            catCMD.CommandText = textConmand
            nwindConn.Open()
            If (catCMD.ExecuteNonQuery() > 0) Then
                cargado = 1
            End If
            nwindConn.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
        Return cargado
    End Function
    Function registrarDiligencias(ByVal delv As String, ByVal subdelv As String, ByVal basev As String)
        Dim registrado As Int32 = 0
        Dim mesv As String = basev.Split("_").GetValue(0).ToString
        Dim aniov As String = basev.Split("_").GetValue(1).ToString
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = " INSERT [sireca].[dbo].[C_SIN_PAGO] "
            textConmand += " select  "
            textConmand += " '" + Request.UserHostAddress + "' as IP_CLIENTE "
            textConmand += " ,getdate() as [FECH_SISTEM] "
            textConmand += " ,diligencias.[FECH_DILIGENCIA] as FECH_DILI "
            textConmand += " ,diligencias.[DILIGENCIA] "
            textConmand += " ,diligencias.[REG_PATRONAL] "
            textConmand += " ,diligencias.[CREDITO] "
            textConmand += " ,diligencias.[PERIODO] "
            textConmand += " from ( "
            textConmand += " select "
            textConmand += " substring(EMIP_PATRON,2,10) as REG_PATRONAL "
            textConmand += " ,TD "
            textConmand += " ,INC "
            textConmand += " ,NUMCRED as CREDITO "
            textConmand += " ,PERIODO "
            textConmand += " ,IMPORTE as IMPORTE "
            textConmand += " ,EMIP_NOM_PATRON as RAZON_SOCIAL "
            textConmand += " ,convert(varchar(50),EMIP_NUM_TRAB_COT) as COTIZANTES "
            textConmand += " ,convert(varchar(50),EMIP_SEC) as SECTOR "
            textConmand += " ,( "
            textConmand += " SELECT TOP 1 [SP_DILI] "
            textConmand += " FROM [sireca].[dbo].[C_SIN_PAGO] "
            textConmand += " WHERE substring([SP_REGPAT],1,10)=substring(EMIP_PATRON,2,10) "
            textConmand += " AND [SP_CREDITO]= NUMCRED "
            textConmand += " AND [SP_PERIODO]=PERIODO "
            textConmand += " ORDER BY [SP_FECH_DILI] DESC "
            textConmand += " ) AS DILIGENCIA "
            textConmand += " ,NULL AS FECH_DILIGENCIA "
            textConmand += " FROM [sireca].[dbo].[EMMA" + delv + subdelv + mesv + aniov.Substring(2) + "] "
            textConmand += " left join rale.dbo.[" + getrale(subdelv, "COP") + "] "
            textConmand += " on replace([REGPATR],'-','')=substring(EMIP_PATRON,2,10) and [PERIODO]='01/" + mesv + "/" + aniov + "' "
            textConmand += " where  "
            textConmand += " pagos is null "
            textConmand += " and td in ('02','01') "
            textConmand += " ) as resultado inner join  "
            textConmand += " ( "
            textConmand += " SELECT [REG_PATRONAL],[CREDITO],[PERIODO],[DILIGENCIA],[FECH_DILIGENCIA] "
            textConmand += " FROM [tempdb].[dbo].[dilisinpago" + subdelv + "] "
            textConmand += " where [DILIGENCIA] is not null and [FECH_DILIGENCIA] is not null "
            textConmand += " ) as diligencias  "
            textConmand += " on resultado.REG_PATRONAL=substring(diligencias.REG_PATRONAL,1,10) "
            textConmand += " and resultado.CREDITO=diligencias.CREDITO  "
            textConmand += " and resultado.PERIODO=diligencias.PERIODO "
            textConmand += " where (case when resultado.DILIGENCIA is null then 'x' else resultado.DILIGENCIA end)<>diligencias.DILIGENCIA "
            textConmand += " and exists(SELECT TOP 1 [CVE DILIG#] FROM [sireca].[dbo].[catalogo] WHERE [CVE_SIN_PAGO]='1' and [CVE DILIG#]=diligencias.DILIGENCIA) "

            catCMD.CommandText = textConmand
            nwindConn.Open()
            If (catCMD.ExecuteNonQuery() > 0) Then
                registrado = 1
            End If
            nwindConn.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
            'registrado = 0
        End Try
        Return registrado
    End Function
    Function getrale(ByVal subdel As String, ByVal tipoCopRcv As String) As String
        Dim nwindConnx As OleDbConnection = New OleDbConnection(cadenaconexion)
        Dim catCMDx As OleDbCommand = nwindConnx.CreateCommand()
        Dim textConx As String = " select top 1 name from rale.dbo.tablas where subdel='" + subdel + "' and tipo='" + tipoCopRcv + "' order by fecha desc "
        'textConx += " GROUP BY eco.responsable"
        'MsgBox(valorUser)
        'MsgBox(textConx)
        catCMDx.CommandText = textConx
        nwindConnx.Open()
        Dim myReaderx As OleDbDataReader = catCMDx.ExecuteReader()
        Dim ralex As String = 0
        Do While myReaderx.Read()
            Dim vvx As Object = myReaderx.GetValue(0)
            ralex = vvx.ToString
        Loop
        myReaderx.Close()
        nwindConnx.Close()

        Return ralex
    End Function

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