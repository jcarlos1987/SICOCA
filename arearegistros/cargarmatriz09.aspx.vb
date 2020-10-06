Imports System.Data.OleDb
Imports System.IO
Imports Ionic.Zip

Public Class cargarmatriz09
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub
    Protected Sub cargarMatriz09Zip()
        Dim ruta As String = Server.MapPath("~/temp/cargamatriz09/")
        If Not Directory.Exists(ruta) Then
            Directory.CreateDirectory(ruta)
        End If
        If FUMatriz09.FileName.Replace(" ", "").Equals("") Then
            Label1.Text = "Seleccione el un archivo zip a cargar con la matriz 09."
        Else
            Label1.Text = ""
            ruta = ruta & "\" & Session.Item("SIRECAid").ToString & Now.ToShortDateString.Replace("/", "_") & Now.Hour.ToString("D2") & Now.Minute.ToString("D2") & Now.Second.ToString("D2") & Now.Millisecond.ToString("D4") & FUMatriz09.FileName
            'ruta = ruta.Replace(".zip", "")
            If System.IO.File.Exists(ruta) Then
                Label1.Text = "MATRIZ " + FUMatriz09.FileName + " CARGADA."
            Else
                Dim nombreRale As String = ""
                'carga del archivo
                FUMatriz09.SaveAs(ruta)
                'extraccion del archivo
                Using zip As ZipFile = ZipFile.Read(ruta)
                    zip.StatusMessageTextWriter = System.Console.Out
                    'Status Messages will be sent to the console during extraction
                    zip.ExtractAll(ruta.Replace(".zip", ""))
                End Using
                Dim frale As String() = Directory.GetFiles(ruta.Replace(".zip", ""))
                For i As Int32 = 0 To (frale.Length - 1)
                    ruta = frale.GetValue(i).ToString
                    Exit For
                Next
                'lectura del archivo
                Dim fs As System.IO.StreamReader = System.IO.File.OpenText(ruta)

                fs.Close()
                cargarMatriz09Servidor(ruta, DDLSubdel.SelectedValue)
            End If
        End If
    End Sub
    Protected Sub cargarMatriz09Servidor(ByVal ruta As String, ByVal vsubdel As String)
        Try
            Dim accion As String = ""
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = ""

            textConmand += " IF EXISTS (SELECT * FROM  tempdb.sys.objects WHERE name = 'matriz09" + vsubdel + "') "
            textConmand += " BEGIN "
            textConmand += " 	drop table [tempdb].[dbo].[matriz09" + vsubdel + "] "
            textConmand += " END "
            textConmand += " CREATE TABLE [tempdb].[dbo].[matriz09" + vsubdel + "]( "
            textConmand += " [G_Estatus] [nvarchar](50) NULL, "
            textConmand += " [G_Rango] [nvarchar](255) NULL, "
            textConmand += " [G_RegPat] [nvarchar](255) NULL, "
            textConmand += " [G_RazonSocial] [varchar](500) NULL, "
            textConmand += " [G_ImporteCOP] [float] NULL, "
            'textConmand += " [G_ImporteRCV] [float] NULL, "
            textConmand += " [G_FechaBaja] [datetime] NULL, "
            textConmand += " [G_AreaSolicitaLaBaja] [nvarchar](255) NULL, "
            textConmand += " [G_DocInformaEsPatronNL] [nvarchar](255) NULL, "
            textConmand += " [G_ID_Integrador] [nvarchar](255) NULL, "
            textConmand += " [G_FechaAsignacion] [datetime] NULL, "
            'textConmand += " [G_IP_Regitro] [nvarchar](50) NULL, "
            'textConmand += " [G_FechaRegistro] [datetime] NULL, "
            'textConmand += " [G_ID_Registro] [nvarchar](50) NULL, "
            textConmand += " [II_FolioCatalogoContResultDeptoCobranza] [nvarchar](255) NULL, "
            textConmand += " [II_FSCatalogoContResultDeptoCobranza] [datetime] NULL, "
            textConmand += " [II_FRCatalogoContResultDeptoCobranza] [datetime] NULL, "
            textConmand += " [II_FolioOfnaEPO] [nvarchar](255) NULL, "
            textConmand += " [II_SOfnaEPO] [datetime] NULL, "
            textConmand += " [II_ROfnaEPO] [datetime] NULL, "
            textConmand += " [II_FolioOfnaCobros] [nvarchar](255) NULL, "
            textConmand += " [II_SOfnaCobros] [datetime] NULL, "
            textConmand += " [II_ROfnaCobros] [datetime] NULL, "
            textConmand += " [II_FolioExpeConveyGarantia] [nvarchar](255) NULL, "
            textConmand += " [II_SExpeConveyGarantia] [datetime] NULL, "
            textConmand += " [II_RExpeConveyGarantia] [datetime] NULL, "
            textConmand += " [II_SINDO] [datetime] NULL, "
            textConmand += " [II_FolioDeptoAfiliacion] [nvarchar](255) NULL, "
            textConmand += " [II_SDeptoAfiliacion] [datetime] NULL, "
            textConmand += " [II_RDeptoAfiliacion] [datetime] NULL, "
            textConmand += " [II_FolioDeptoAuditoria] [nvarchar](255) NULL, "
            textConmand += " [II_SDeptoAuditoria] [datetime] NULL, "
            textConmand += " [II_RDeptoAuditoria] [datetime] NULL, "
            textConmand += " [II_FolioServiciosJuridicos] [nvarchar](255) NULL, "
            textConmand += " [II_SServiciosJuridicos] [datetime] NULL, "
            textConmand += " [II_RServiciosJuridicos] [datetime] NULL, "
            textConmand += " [II_SeccBca] [datetime] NULL, "
            textConmand += " [II_SeccAma] [datetime] NULL, "
            textConmand += " [II_SIEM] [datetime] NULL, "
            textConmand += " [II_COMPRA_NET] [datetime] NULL, "
            textConmand += " [IE_SAT_DF_Folio] [nvarchar](255) NULL, "
            textConmand += " [IE_SAT_DF_S] [datetime] NULL, "
            textConmand += " [IE_SAT_DF_R] [datetime] NULL, "
            textConmand += " [IE_SAT_Foraneo_Folio] [nvarchar](255) NULL, "
            textConmand += " [IE_SAT_Foraneo_S] [datetime] NULL, "
            textConmand += " [IE_SAT_Foraneo_R] [datetime] NULL, "
            textConmand += " [IE_III_Tesoreria_DF_Folio] [nvarchar](255) NULL, "
            textConmand += " [IE_III_Tesoreria_DF_S] [datetime] NULL, "
            textConmand += " [IE_III_Tesoreria_DF_R] [datetime] NULL, "
            textConmand += " [IE_III_Tesoreria_Foraneo_Folio] [nvarchar](255) NULL, "
            textConmand += " [IE_III_Tesoreria_Foraneo_S] [datetime] NULL, "
            textConmand += " [IE_III_Tesoreria_Foraneo_R] [datetime] NULL, "
            textConmand += " [IE_IV_RPPC_DF_PATRON_FM_Folio] [nvarchar](255) NULL, "
            textConmand += " [IE_IV_RPPC_DF_PATRON_FM_S] [datetime] NULL, "
            textConmand += " [IE_IV_RPPC_DF_PATRON_FM_R] [datetime] NULL, "
            textConmand += " [IE_IV_RPPC_DF_PATRON_FR_Folio] [nvarchar](255) NULL, "
            textConmand += " [IE_IV_RPPC_DF_PATRON_FR_S] [datetime] NULL, "
            textConmand += " [IE_IV_RPPC_DF_PATRON_FR_R] [datetime] NULL, "
            textConmand += " [IE_IV_RPPC_DF_SOCIO_FR_Folio] [nvarchar](255) NULL, "
            textConmand += " [IE_IV_RPPC_DF_SOCIO_FR_S] [datetime] NULL, "
            textConmand += " [IE_IV_RPPC_DF_SOCIO_FR_R] [datetime] NULL, "
            textConmand += " [IE_IV_RPPC_Foraneo_PATRON_FM_Folio] [nvarchar](255) NULL, "
            textConmand += " [IE_IV_RPPC_Foraneo_PATRON_FM_S] [datetime] NULL, "
            textConmand += " [IE_IV_RPPC_Foraneo_PATRON_FM_R] [datetime] NULL, "
            textConmand += " [IE_IV_RPPC_Foraneo_PATRON_FR_Folio] [nvarchar](255) NULL, "
            textConmand += " [IE_IV_RPPC_Foraneo_PATRON_FR_S] [datetime] NULL, "
            textConmand += " [IE_IV_RPPC_Foraneo_PATRON_FR_R] [datetime] NULL, "
            textConmand += " [IE_IV_RPPC_Foraneo_SOCIO_FR_Folio] [nvarchar](255) NULL, "
            textConmand += " [IE_IV_RPPC_Foraneo_SOCIO_FR_S] [datetime] NULL, "
            textConmand += " [IE_IV_RPPC_Foraneo_SOCIO_FR_R] [datetime] NULL, "
            textConmand += " [IE_V_ArchivoGralNotarias_Folio] [nvarchar](255) NULL, "
            textConmand += " [IE_V_ArchivoGralNotarias_S] [datetime] NULL, "
            textConmand += " [IE_V_ArchivoGralNotarias_R] [datetime] NULL, "
            textConmand += " [IC_FolioVisitaDomFiscal] [nvarchar](255) NULL, "
            textConmand += " [IC_SVisitaDomFiscal] [datetime] NULL, "
            textConmand += " [IC_FolioVisitaSocios] [nvarchar](255) NULL, "
            textConmand += " [IC_SVisitaSocios] [datetime] NULL, "
            textConmand += " [IC_FolioEntrevista3Vecinos] [nvarchar](255) NULL, "
            textConmand += " [IC_SEntrevista3Vecinos] [datetime] NULL, "
            textConmand += " [IC_FolioEntrevista3Trabajadores] [nvarchar](255) NULL, "
            textConmand += " [IC_SEntrevista3Trabajadores] [datetime] NULL, "
            textConmand += " [IC_FolioVisitasForaneas] [nvarchar](255) NULL, "
            textConmand += " [IC_SVisitasForaneas] [datetime] NULL, "
            textConmand += " [IC_RVisitasForaneas] [datetime] NULL "
            textConmand += " ) ON [PRIMARY] "

            textConmand += "BULK INSERT [tempdb].[dbo].[matriz09" + vsubdel + "] "
            textConmand += "FROM '" + ruta + "' "
            textConmand += "WITH( "
            textConmand += "FIELDTERMINATOR=';', "
            textConmand += "ROWTERMINATOR='\n', "
            textConmand += "FIRSTROW=2, "
            textConmand += "FIRE_TRIGGERS "
            textConmand += ") "
            catCMD.CommandText = textConmand
            nwindConn.Open()
            If (catCMD.ExecuteNonQuery() <= 0) Then
                accion = "Problemas con la actualizacion"
            Else
                matrizG(vsubdel)
                matrizII(vsubdel)
                matrizIE(vsubdel)
                matrizIC(vsubdel)
                llenadoCamposAuto()
            End If
            nwindConn.Close()
        Catch ex As Exception
            Response.Write(ex.StackTrace)
        End Try
    End Sub
    Protected Sub llenadoCamposAuto()
        Dim accion As Int32 = 0
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = ""

        textConmand += " ---Registro Maximo 1397 "
        textConmand += " UPDATE [sirecaregistros].[dbo].[NL_InvestExterna] "
        textConmand += " SET [IE_III_Tesoreria_DF_Folio]='N/A' "
        textConmand += " ,[IE_III_Tesoreria_DF_S]='01/01/1900' "
        textConmand += " ,[IE_III_Tesoreria_DF_R]='01/01/1900' "
        textConmand += " ,[IE_III_Tesoreria_Foraneo_Folio]='N/A' "
        textConmand += " ,[IE_III_Tesoreria_Foraneo_S]='01/01/1900' "
        textConmand += " ,[IE_III_Tesoreria_Foraneo_R]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FM_Folio]='N/A' "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FM_S]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FM_R]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FR_Folio]='N/A' "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FR_S]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FR_R]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_DF_SOCIO_FR_Folio]='N/A' "
        textConmand += " ,[IE_IV_RPPC_DF_SOCIO_FR_S]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_DF_SOCIO_FR_R]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FM_Folio]='N/A' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FM_S]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FM_R]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FR_Folio]='N/A' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FR_S]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FR_R]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_SOCIO_FR_Folio]='N/A' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_SOCIO_FR_S]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_SOCIO_FR_R]='01/01/1900' "
        textConmand += " ,[IE_V_ArchivoGralNotarias_Folio]='N/A' "
        textConmand += " ,[IE_V_ArchivoGralNotarias_S]='01/01/1900' "
        textConmand += " ,[IE_V_ArchivoGralNotarias_R]='01/01/1900' "
        textConmand += " FROM [sirecaregistros].[dbo].[NL_General] "
        textConmand += " left join [sirecaregistros].[dbo].[NL_InvestExterna] "
        textConmand += " on IE_G_ID=G_ID "
        textConmand += " WHERE [G_Rango] in ('I','II') "
        textConmand += " ---------------------------------------------------------------- "
        textConmand += " UPDATE [sirecaregistros].[dbo].[NL_InvestExterna] "
        textConmand += " SET [IE_IV_RPPC_DF_PATRON_FM_Folio]='N/A' "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FM_S]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FM_R]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FR_Folio]='N/A' "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FR_S]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FR_R]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_DF_SOCIO_FR_Folio]='N/A' "
        textConmand += " ,[IE_IV_RPPC_DF_SOCIO_FR_S]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_DF_SOCIO_FR_R]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FM_Folio]='N/A' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FM_S]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FM_R]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FR_Folio]='N/A' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FR_S]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FR_R]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_SOCIO_FR_Folio]='N/A' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_SOCIO_FR_S]='01/01/1900' "
        textConmand += " ,[IE_IV_RPPC_Foraneo_SOCIO_FR_R]='01/01/1900' "
        textConmand += " ,[IE_V_ArchivoGralNotarias_Folio]='N/A' "
        textConmand += " ,[IE_V_ArchivoGralNotarias_S]='01/01/1900' "
        textConmand += " ,[IE_V_ArchivoGralNotarias_R]='01/01/1900' "
        textConmand += " FROM [sirecaregistros].[dbo].[NL_General] "
        textConmand += " left join [sirecaregistros].[dbo].[NL_InvestExterna] "
        textConmand += " on IE_G_ID=G_ID "
        textConmand += " WHERE [G_Rango] in ('III') "
        textConmand += " ---------------------------------------------------------------- "
        textConmand += " UPDATE [sirecaregistros].[dbo].[NL_InvestExterna] "
        textConmand += " SET [IE_V_ArchivoGralNotarias_Folio]='N/A' "
        textConmand += " ,[IE_V_ArchivoGralNotarias_S]='01/01/1900' "
        textConmand += " ,[IE_V_ArchivoGralNotarias_R]='01/01/1900' "
        textConmand += " FROM [sirecaregistros].[dbo].[NL_General] "
        textConmand += " left join [sirecaregistros].[dbo].[NL_InvestExterna] "
        textConmand += " on IE_G_ID=G_ID "
        textConmand += " WHERE [G_Rango] in ('IV') "
        textConmand += " ---------------------------------------------------------------- "
        textConmand += " UPDATE [sirecaregistros].[dbo].[NL_InvestCampo] "
        textConmand += " SET [IC_FolioEntrevista3Trabajadores]='N/A' "
        textConmand += " ,[IC_SEntrevista3Trabajadores]='01/01/1900' "
        textConmand += " FROM [sirecaregistros].[dbo].[NL_General] "
        textConmand += " left join [sirecaregistros].[dbo].[NL_InvestCampo] "
        textConmand += " on IC_G_ID=G_ID "
        textConmand += " WHERE [G_Rango] in ('I','II') "

        catCMD.CommandText = textConmand
        nwindConn.Open()
        accion = catCMD.ExecuteNonQuery()
        nwindConn.Close()
    End Sub

    Protected Function matrizG(ByVal vsubdel As String) As Int32
        Dim accion As Int32 = 0
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = ""

        textConmand += " update [sirecaregistros].[dbo].[NL_General] "
        textConmand += " SET "
        textConmand += " [G_Estatus]=m09.[G_Estatus] "
        textConmand += " ,[G_Rango]=m09.[G_Rango] "
        textConmand += " ,[G_RegPat]=m09.[G_RegPat] "
        textConmand += " ,[G_RazonSocial]=m09.[G_RazonSocial] "
        textConmand += " ,[G_ImporteCOP]=m09.[G_ImporteCOP] "
        textConmand += " ,[G_ImporteRCV]=0 "
        textConmand += " ,[G_FechaBaja]=m09.[G_FechaBaja] "
        textConmand += " ,[G_AreaSolicitaLaBaja]=m09.[G_AreaSolicitaLaBaja] "
        textConmand += " ,[G_DocInformaEsPatronNL]=m09.[G_DocInformaEsPatronNL] "
        textConmand += " ,[G_ID_Integrador]=m09.[G_ID_Integrador] "
        textConmand += " ,[G_FechaAsignacion]=m09.[G_FechaAsignacion] "
        textConmand += " ,[G_IP_Regitro]='" + Request.UserHostAddress + "' "
        textConmand += " ,[G_FechaRegistro]=getdate() "
        textConmand += " ,[G_ID_Registro]='" + Session.Item("SIRECAid").ToString + "'"
        textConmand += " FROM [tempdb].[dbo].[matriz09" + vsubdel + "] as m09 "
        textConmand += " inner join "
        textConmand += " sirecaregistros.dbo.NL_General as g09 "
        textConmand += " on g09.[G_RegPat] = m09.[G_RegPat] "
        textConmand += " where G_Subdel='" + vsubdel + "' "


        textConmand += " insert into [sirecaregistros].[dbo].[NL_General] "
        textConmand += " SELECT '" + vsubdel + "'"
        textConmand += " ,[G_Estatus] "
        textConmand += " ,[G_Rango] "
        textConmand += " ,[G_RegPat] "
        textConmand += " ,[G_RazonSocial] "
        textConmand += " ,[G_ImporteCOP] "
        textConmand += " ,0 "
        textConmand += " ,[G_FechaBaja] "
        textConmand += " ,[G_AreaSolicitaLaBaja] "
        textConmand += " ,[G_DocInformaEsPatronNL] "
        textConmand += " ,[G_ID_Integrador] "
        textConmand += " ,[G_FechaAsignacion] "
        textConmand += " ,'" + Request.UserHostAddress + "' "
        textConmand += " ,getdate() "
        textConmand += " ,'" + Session.Item("SIRECAid").ToString + "'"
        textConmand += " FROM [tempdb].[dbo].[matriz09" + vsubdel + "] as mtemp "
        textConmand += " WHERE not exists( "
        textConmand += " Select mg.[G_ID] "
        textConmand += " FROM [sirecaregistros].[dbo].[NL_General] as mg "
        textConmand += " WHERE mg.[G_RegPat]=mtemp.[G_RegPat] and mg.[G_Subdel]='" + vsubdel + "' ) "

        catCMD.CommandText = textConmand
        nwindConn.Open()
        accion = catCMD.ExecuteNonQuery()
        nwindConn.Close()

        Return accion
    End Function

    Protected Function matrizII(ByVal vsubdel As String) As Int32
        Dim accion As Int32 = 0
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = ""

        textConmand += " update [sirecaregistros].[dbo].[NL_InvestInterna] "
        textConmand += " SET [II_FolioCatalogoContResultDeptoCobranza]=m09.[II_FolioCatalogoContResultDeptoCobranza] "
        textConmand += " ,[II_FSCatalogoContResultDeptoCobranza]=m09.[II_FSCatalogoContResultDeptoCobranza] "
        textConmand += " ,[II_FRCatalogoContResultDeptoCobranza]=m09.[II_FRCatalogoContResultDeptoCobranza] "
        textConmand += " ,[II_FolioOfnaEPO]=m09.[II_FolioOfnaEPO] "
        textConmand += " ,[II_SOfnaEPO]=m09.[II_SOfnaEPO] "
        textConmand += " ,[II_ROfnaEPO]=m09.[II_ROfnaEPO] "
        textConmand += " ,[II_FolioOfnaCobros]=m09.[II_FolioOfnaCobros] "
        textConmand += " ,[II_SOfnaCobros]=m09.[II_SOfnaCobros] "
        textConmand += " ,[II_ROfnaCobros]=m09.[II_ROfnaCobros] "
        textConmand += " ,[II_FolioExpeConveyGarantia]=m09.[II_FolioExpeConveyGarantia] "
        textConmand += " ,[II_SExpeConveyGarantia]=m09.[II_SExpeConveyGarantia] "
        textConmand += " ,[II_RExpeConveyGarantia]=m09.[II_RExpeConveyGarantia] "
        textConmand += " ,[II_SINDO]=m09.[II_SINDO] "
        textConmand += " ,[II_FolioDeptoAfiliacion]=m09.[II_FolioDeptoAfiliacion] "
        textConmand += " ,[II_SDeptoAfiliacion]=m09.[II_SDeptoAfiliacion] "
        textConmand += " ,[II_RDeptoAfiliacion]=m09.[II_RDeptoAfiliacion] "
        textConmand += " ,[II_FolioDeptoAuditoria]=m09.[II_FolioDeptoAuditoria] "
        textConmand += " ,[II_SDeptoAuditoria]=m09.[II_SDeptoAuditoria] "
        textConmand += " ,[II_RDeptoAuditoria]=m09.[II_RDeptoAuditoria] "
        textConmand += " ,[II_FolioServiciosJuridicos]=m09.[II_FolioServiciosJuridicos] "
        textConmand += " ,[II_SServiciosJuridicos]=m09.[II_SServiciosJuridicos] "
        textConmand += " ,[II_RServiciosJuridicos]=m09.[II_RServiciosJuridicos] "
        textConmand += " ,[II_SeccBca]=m09.[II_SeccBca] "
        textConmand += " ,[II_SeccAma]=m09.[II_SeccAma] "
        textConmand += " ,[II_SIEM]=m09.[II_SIEM] "
        textConmand += " ,[II_COMPRA_NET]=m09.[II_COMPRA_NET] "
        textConmand += " FROM [tempdb].[dbo].[matriz09" + vsubdel + "] as m09 "
        textConmand += " inner join "
        textConmand += " sirecaregistros.dbo.NL_General as g09 "
        textConmand += " on g09.[G_RegPat] = m09.[G_RegPat] "
        textConmand += " inner join "
        textConmand += " sirecaregistros.dbo.NL_InvestInterna "
        textConmand += " on II_G_ID=G_ID "
        textConmand += " where G_Subdel='" + vsubdel + "' "

        textConmand += " insert into [sirecaregistros].[dbo].[NL_InvestInterna] "
        textConmand += " SELECT "
        textConmand += " (select top 1 gtemp.G_ID from [sirecaregistros].[dbo].[NL_General] as gtemp "
        textConmand += " where gtemp.G_RegPat=m09.[G_RegPat] and gtemp.G_Subdel='" + vsubdel + "') "
        textConmand += " ,[II_FolioCatalogoContResultDeptoCobranza]=m09.[II_FolioCatalogoContResultDeptoCobranza] "
        textConmand += " ,[II_FSCatalogoContResultDeptoCobranza]=m09.[II_FSCatalogoContResultDeptoCobranza] "
        textConmand += " ,[II_FRCatalogoContResultDeptoCobranza]=m09.[II_FRCatalogoContResultDeptoCobranza] "
        textConmand += " ,[II_FolioOfnaEPO]=m09.[II_FolioOfnaEPO] "
        textConmand += " ,[II_SOfnaEPO]=m09.[II_SOfnaEPO] "
        textConmand += " ,[II_ROfnaEPO]=m09.[II_ROfnaEPO] "
        textConmand += " ,[II_FolioOfnaCobros]=m09.[II_FolioOfnaCobros] "
        textConmand += " ,[II_SOfnaCobros]=m09.[II_SOfnaCobros] "
        textConmand += " ,[II_ROfnaCobros]=m09.[II_ROfnaCobros] "
        textConmand += " ,[II_FolioExpeConveyGarantia]=m09.[II_FolioExpeConveyGarantia] "
        textConmand += " ,[II_SExpeConveyGarantia]=m09.[II_SExpeConveyGarantia] "
        textConmand += " ,[II_RExpeConveyGarantia]=m09.[II_RExpeConveyGarantia] "
        textConmand += " ,[II_SINDO]=m09.[II_SINDO] "
        textConmand += " ,[II_FolioDeptoAfiliacion]=m09.[II_FolioDeptoAfiliacion] "
        textConmand += " ,[II_SDeptoAfiliacion]=m09.[II_SDeptoAfiliacion] "
        textConmand += " ,[II_RDeptoAfiliacion]=m09.[II_RDeptoAfiliacion] "
        textConmand += " ,[II_FolioDeptoAuditoria]=m09.[II_FolioDeptoAuditoria] "
        textConmand += " ,[II_SDeptoAuditoria]=m09.[II_SDeptoAuditoria] "
        textConmand += " ,[II_RDeptoAuditoria]=m09.[II_RDeptoAuditoria] "
        textConmand += " ,[II_FolioServiciosJuridicos]=m09.[II_FolioServiciosJuridicos] "
        textConmand += " ,[II_SServiciosJuridicos]=m09.[II_SServiciosJuridicos] "
        textConmand += " ,[II_RServiciosJuridicos]=m09.[II_RServiciosJuridicos] "
        textConmand += " ,[II_SeccBca]=m09.[II_SeccBca] "
        textConmand += " ,[II_SeccAma]=m09.[II_SeccAma] "
        textConmand += " ,[II_SIEM]=m09.[II_SIEM] "
        textConmand += " ,[II_COMPRA_NET]=m09.[II_COMPRA_NET] "
        textConmand += " FROM [tempdb].[dbo].[matriz09" + vsubdel + "] as m09 "
        textConmand += " WHERE  "
        textConmand += " not exists( "
        textConmand += " select II_G_ID from sirecaregistros.dbo.NL_InvestInterna where "
        textConmand += " II_G_ID=( "
        textConmand += " select top 1 gtemp.G_ID from [sirecaregistros].[dbo].[NL_General] as gtemp "
        textConmand += " where gtemp.G_RegPat=m09.[G_RegPat] and gtemp.G_Subdel='" + vsubdel + "' "
        textConmand += " ) "
        textConmand += " ) "

        catCMD.CommandText = textConmand
        nwindConn.Open()
        accion = catCMD.ExecuteNonQuery()
        nwindConn.Close()

        Return accion
    End Function

    Protected Function matrizIE(ByVal vsubdel As String) As Int32
        Dim accion As Int32 = 0
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = ""
        textConmand += " update [sirecaregistros].[dbo].[NL_InvestExterna] "
        textConmand += " SET  "
        textConmand += " [IE_SAT_DF_Folio]=m09.[IE_SAT_DF_Folio] "
        textConmand += " ,[IE_SAT_DF_S]=m09.[IE_SAT_DF_S] "
        textConmand += " ,[IE_SAT_DF_R]=m09.[IE_SAT_DF_R] "
        textConmand += " ,[IE_SAT_Foraneo_Folio]=m09.[IE_SAT_Foraneo_Folio] "
        textConmand += " ,[IE_SAT_Foraneo_S]=m09.[IE_SAT_Foraneo_S] "
        textConmand += " ,[IE_SAT_Foraneo_R]=m09.[IE_SAT_Foraneo_R] "
        textConmand += " ,[IE_III_Tesoreria_DF_Folio]=m09.[IE_III_Tesoreria_DF_Folio] "
        textConmand += " ,[IE_III_Tesoreria_DF_S]=m09.[IE_III_Tesoreria_DF_S] "
        textConmand += " ,[IE_III_Tesoreria_DF_R]=m09.[IE_III_Tesoreria_DF_R] "
        textConmand += " ,[IE_III_Tesoreria_Foraneo_Folio]=m09.[IE_III_Tesoreria_Foraneo_Folio] "
        textConmand += " ,[IE_III_Tesoreria_Foraneo_S]=m09.[IE_III_Tesoreria_Foraneo_S] "
        textConmand += " ,[IE_III_Tesoreria_Foraneo_R]=m09.[IE_III_Tesoreria_Foraneo_R] "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FM_Folio]=m09.[IE_IV_RPPC_DF_PATRON_FM_Folio] "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FM_S]=m09.[IE_IV_RPPC_DF_PATRON_FM_S] "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FM_R]=m09.[IE_IV_RPPC_DF_PATRON_FM_R] "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FR_Folio]=m09.[IE_IV_RPPC_DF_PATRON_FR_Folio] "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FR_S]=m09.[IE_IV_RPPC_DF_PATRON_FR_S] "
        textConmand += " ,[IE_IV_RPPC_DF_PATRON_FR_R]=m09.[IE_IV_RPPC_DF_PATRON_FR_R] "
        textConmand += " ,[IE_IV_RPPC_DF_SOCIO_FR_Folio]=m09.[IE_IV_RPPC_DF_SOCIO_FR_Folio] "
        textConmand += " ,[IE_IV_RPPC_DF_SOCIO_FR_S]=m09.[IE_IV_RPPC_DF_SOCIO_FR_S] "
        textConmand += " ,[IE_IV_RPPC_DF_SOCIO_FR_R]=m09.[IE_IV_RPPC_DF_SOCIO_FR_R] "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FM_Folio]=m09.[IE_IV_RPPC_Foraneo_PATRON_FM_Folio] "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FM_S]=m09.[IE_IV_RPPC_Foraneo_PATRON_FM_S] "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FM_R]=m09.[IE_IV_RPPC_Foraneo_PATRON_FM_R] "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FR_Folio]=m09.[IE_IV_RPPC_Foraneo_PATRON_FR_Folio] "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FR_S]=m09.[IE_IV_RPPC_Foraneo_PATRON_FR_S] "
        textConmand += " ,[IE_IV_RPPC_Foraneo_PATRON_FR_R]=m09.[IE_IV_RPPC_Foraneo_PATRON_FR_R] "
        textConmand += " ,[IE_IV_RPPC_Foraneo_SOCIO_FR_Folio]=m09.[IE_IV_RPPC_Foraneo_SOCIO_FR_Folio] "
        textConmand += " ,[IE_IV_RPPC_Foraneo_SOCIO_FR_S]=m09.[IE_IV_RPPC_Foraneo_SOCIO_FR_S] "
        textConmand += " ,[IE_IV_RPPC_Foraneo_SOCIO_FR_R]=m09.[IE_IV_RPPC_Foraneo_SOCIO_FR_R] "
        textConmand += " ,[IE_V_ArchivoGralNotarias_Folio]=m09.[IE_V_ArchivoGralNotarias_Folio] "
        textConmand += " ,[IE_V_ArchivoGralNotarias_S]=m09.[IE_V_ArchivoGralNotarias_S] "
        textConmand += " ,[IE_V_ArchivoGralNotarias_R]=m09.[IE_V_ArchivoGralNotarias_R] "
        textConmand += " FROM [tempdb].[dbo].[matriz09" + vsubdel + "] as m09 "
        textConmand += " inner join "
        textConmand += " sirecaregistros.dbo.NL_General as g09 "
        textConmand += " on g09.[G_RegPat] = m09.[G_RegPat] "
        textConmand += " inner join "
        textConmand += " sirecaregistros.dbo.NL_InvestExterna "
        textConmand += " on IE_G_ID=G_ID "
        textConmand += " where G_Subdel='" + vsubdel + "' "


        textConmand += " insert into [sirecaregistros].[dbo].[NL_InvestExterna] "
        textConmand += " SELECT  "
        textConmand += " (select top 1 gtemp.G_ID from [sirecaregistros].[dbo].[NL_General] as gtemp "
        textConmand += " where gtemp.G_RegPat=m09.[G_RegPat] and gtemp.G_Subdel='" + vsubdel + "') "
        textConmand += " ,m09.[IE_SAT_DF_Folio] "
        textConmand += " ,m09.[IE_SAT_DF_S] "
        textConmand += " ,m09.[IE_SAT_DF_R] "
        textConmand += " ,m09.[IE_SAT_Foraneo_Folio] "
        textConmand += " ,m09.[IE_SAT_Foraneo_S] "
        textConmand += " ,m09.[IE_SAT_Foraneo_R] "
        textConmand += " ,m09.[IE_III_Tesoreria_DF_Folio] "
        textConmand += " ,m09.[IE_III_Tesoreria_DF_S] "
        textConmand += " ,m09.[IE_III_Tesoreria_DF_R] "
        textConmand += " ,m09.[IE_III_Tesoreria_Foraneo_Folio] "
        textConmand += " ,m09.[IE_III_Tesoreria_Foraneo_S] "
        textConmand += " ,m09.[IE_III_Tesoreria_Foraneo_R] "
        textConmand += " ,m09.[IE_IV_RPPC_DF_PATRON_FM_Folio] "
        textConmand += " ,m09.[IE_IV_RPPC_DF_PATRON_FM_S] "
        textConmand += " ,m09.[IE_IV_RPPC_DF_PATRON_FM_R] "
        textConmand += " ,m09.[IE_IV_RPPC_DF_PATRON_FR_Folio] "
        textConmand += " ,m09.[IE_IV_RPPC_DF_PATRON_FR_S] "
        textConmand += " ,m09.[IE_IV_RPPC_DF_PATRON_FR_R] "
        textConmand += " ,m09.[IE_IV_RPPC_DF_SOCIO_FR_Folio] "
        textConmand += " ,m09.[IE_IV_RPPC_DF_SOCIO_FR_S] "
        textConmand += " ,m09.[IE_IV_RPPC_DF_SOCIO_FR_R] "
        textConmand += " ,m09.[IE_IV_RPPC_Foraneo_PATRON_FM_Folio] "
        textConmand += " ,m09.[IE_IV_RPPC_Foraneo_PATRON_FM_S] "
        textConmand += " ,m09.[IE_IV_RPPC_Foraneo_PATRON_FM_R] "
        textConmand += " ,m09.[IE_IV_RPPC_Foraneo_PATRON_FR_Folio] "
        textConmand += " ,m09.[IE_IV_RPPC_Foraneo_PATRON_FR_S] "
        textConmand += " ,m09.[IE_IV_RPPC_Foraneo_PATRON_FR_R] "
        textConmand += " ,m09.[IE_IV_RPPC_Foraneo_SOCIO_FR_Folio] "
        textConmand += " ,m09.[IE_IV_RPPC_Foraneo_SOCIO_FR_S] "
        textConmand += " ,m09.[IE_IV_RPPC_Foraneo_SOCIO_FR_R] "
        textConmand += " ,m09.[IE_V_ArchivoGralNotarias_Folio] "
        textConmand += " ,m09.[IE_V_ArchivoGralNotarias_S] "
        textConmand += " ,m09.[IE_V_ArchivoGralNotarias_R] "
        textConmand += " FROM [tempdb].[dbo].[matriz09" + vsubdel + "] as m09 "
        textConmand += " WHERE "
        textConmand += " not exists( "
        textConmand += " select IE_G_ID from sirecaregistros.dbo.NL_InvestExterna where "
        textConmand += " IE_G_ID=( "
        textConmand += " select top 1 gtemp.G_ID from [sirecaregistros].[dbo].[NL_General] as gtemp "
        textConmand += " where gtemp.G_RegPat=m09.[G_RegPat] and gtemp.G_Subdel='" + vsubdel + "' "
        textConmand += " ) "
        textConmand += " ) "

        catCMD.CommandText = textConmand
        nwindConn.Open()
        accion = catCMD.ExecuteNonQuery()
        nwindConn.Close()

        Return accion
    End Function

    Protected Function matrizIC(ByVal vsubdel As String) As Int32
        Dim accion As Int32 = 0
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = ""
        textConmand += " update [sirecaregistros].[dbo].[NL_InvestCampo] "
        textConmand += " SET  "
        textConmand += " [IC_FolioVisitaDomFiscal]=m09.[IC_FolioVisitaDomFiscal] "
        textConmand += " ,[IC_SVisitaDomFiscal]=m09.[IC_SVisitaDomFiscal] "
        textConmand += " ,[IC_FolioVisitaSocios]=m09.[IC_FolioVisitaSocios] "
        textConmand += " ,[IC_SVisitaSocios]=m09.[IC_SVisitaSocios] "
        textConmand += " ,[IC_FolioEntrevista3Vecinos]=m09.[IC_FolioEntrevista3Vecinos] "
        textConmand += " ,[IC_SEntrevista3Vecinos]=m09.[IC_SEntrevista3Vecinos] "
        textConmand += " ,[IC_FolioEntrevista3Trabajadores]=m09.[IC_FolioEntrevista3Trabajadores] "
        textConmand += " ,[IC_SEntrevista3Trabajadores]=m09.[IC_SEntrevista3Trabajadores] "
        textConmand += " ,[IC_FolioVisitasForaneas]=m09.[IC_FolioVisitasForaneas] "
        textConmand += " ,[IC_SVisitasForaneas]=m09.[IC_SVisitasForaneas] "
        textConmand += " ,[IC_RVisitasForaneas]=m09.[IC_RVisitasForaneas] "
        textConmand += " FROM [tempdb].[dbo].[matriz09" + vsubdel + "] as m09 "
        textConmand += " inner join "
        textConmand += " sirecaregistros.dbo.NL_General as g09 "
        textConmand += " on g09.[G_RegPat] = m09.[G_RegPat] "
        textConmand += " inner join "
        textConmand += " sirecaregistros.dbo.NL_InvestCampo "
        textConmand += " on IC_G_ID=G_ID "
        textConmand += " where G_Subdel='" + vsubdel + "' "


        textConmand += " insert into [sirecaregistros].[dbo].[NL_InvestCampo] "
        textConmand += " SELECT  "
        textConmand += " (select top 1 gtemp.G_ID from [sirecaregistros].[dbo].[NL_General] as gtemp "
        textConmand += " where gtemp.G_RegPat=m09.[G_RegPat] and gtemp.G_Subdel='" + vsubdel + "') "
        textConmand += " ,m09.[IC_FolioVisitaDomFiscal] "
        textConmand += " ,m09.[IC_SVisitaDomFiscal] "
        textConmand += " ,m09.[IC_FolioVisitaSocios] "
        textConmand += " ,m09.[IC_SVisitaSocios] "
        textConmand += " ,m09.[IC_FolioEntrevista3Vecinos] "
        textConmand += " ,m09.[IC_SEntrevista3Vecinos] "
        textConmand += " ,m09.[IC_FolioEntrevista3Trabajadores] "
        textConmand += " ,m09.[IC_SEntrevista3Trabajadores] "
        textConmand += " ,m09.[IC_FolioVisitasForaneas] "
        textConmand += " ,m09.[IC_SVisitasForaneas] "
        textConmand += " ,m09.[IC_RVisitasForaneas] "
        textConmand += " FROM [tempdb].[dbo].[matriz09" + vsubdel + "] as m09 "
        textConmand += " WHERE "
        textConmand += " not exists( "
        textConmand += " select IC_G_ID from sirecaregistros.dbo.NL_InvestCampo where "
        textConmand += " IC_G_ID=( "
        textConmand += " select top 1 gtemp.G_ID from [sirecaregistros].[dbo].[NL_General] as gtemp "
        textConmand += " where gtemp.G_RegPat=m09.[G_RegPat] and gtemp.G_Subdel='" + vsubdel + "' "
        textConmand += " ) "
        textConmand += " ) "

        catCMD.CommandText = textConmand
        nwindConn.Open()
        accion = catCMD.ExecuteNonQuery()
        nwindConn.Close()

        Return accion
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

    Protected Sub LBCargar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBCargar.Click
        cargarMatriz09Zip()
    End Sub
End Class