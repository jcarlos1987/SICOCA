Imports Ionic.Zip
Imports System.IO
Imports System.Data.OleDb

Public Class _default48
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LBCargar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LBCargar.Click
        Dim vsubdel As String = Session.Item("SIRECAsubdel").ToString
        If cargarSipare(vsubdel) = 1 Then
            If crearBaseSipare(vsubdel) = 1 Then
                depurarPorSipare(vsubdel)
                If actualizarBaseSipare(vsubdel) = 1 Then
                    LMsg.Text = "Base SIPARE Actualizada"
                End If
            End If
        End If
        GridViewCargadosSipare.DataBind()
    End Sub

    Private Function actualizarBaseSipare(ByVal vsubdel As String)
        Dim baseActualizada As Int16 = 0
        Try
            Dim conx As New OleDbConnection(cadenaconexion)
            Dim cmdx As New OleDbCommand()
            cmdx.Connection = conx
            Dim myInsertQueryx As String = " insert into [sirecaemisiones].[dbo].[sipare] "
            myInsertQueryx += " Select [EntidadReceptora]"
            myInsertQueryx += "       ,[Sucursal]"
            myInsertQueryx += "       ,[LC]"
            myInsertQueryx += "       ,[RegistroPatronal]"
            myInsertQueryx += "       ,[RazonSocial]"
            myInsertQueryx += "       ,[Delegacion]"
            myInsertQueryx += "       ,[SubDelegacion]"
            myInsertQueryx += "       ,[PeriodoPago]"
            myInsertQueryx += "       ,[Origen]"
            myInsertQueryx += "       ,[FechaLimitePago]"
            myInsertQueryx += "       ,[FechaPago]"
            myInsertQueryx += "       ,[FechaEnvio]"
            myInsertQueryx += "       ,[ImporteIMSS]"
            myInsertQueryx += "       ,[ImporteRCV]"
            myInsertQueryx += "       ,[ImporteVivienda]"
            myInsertQueryx += "       ,[ImporteACV]"
            myInsertQueryx += "       ,[ImporteTotal]"
            myInsertQueryx += "       ,[MediodePago]"
            myInsertQueryx += "       ,[NoPagos]"
            myInsertQueryx += "       ,'" & Request.UserHostAddress() & "'"
            myInsertQueryx += "       ,getdate()"
            myInsertQueryx += "       ,'" & Session.Item("SIRECAid").ToString & "'"
            myInsertQueryx += "   FROM [tempdb].[dbo].[sipare" + vsubdel + "] as sipareTemp "
            myInsertQueryx += "   where not exists( "
            myInsertQueryx += "   SELECT [EntidadReceptora],[Sucursal],[LC],[RegistroPatronal],[PeriodoPago] "
            myInsertQueryx += "   FROM [sirecaemisiones].[dbo].[sipare] as sipareBase "
            myInsertQueryx += "   WHERE sipareBase.[EntidadReceptora]=sipareTemp.[EntidadReceptora] "
            myInsertQueryx += "   and sipareBase.[Sucursal]=sipareTemp.[Sucursal] "
            myInsertQueryx += "   and sipareBase.[LC]=sipareTemp.[LC] "
            myInsertQueryx += "   and sipareBase.[RegistroPatronal]=sipareTemp.[RegistroPatronal] "
            myInsertQueryx += "   and sipareBase.[PeriodoPago]=sipareTemp.[PeriodoPago] "
            myInsertQueryx += "   ) "

            cmdx.CommandText = myInsertQueryx
            conx.Open()
            baseActualizada = cmdx.ExecuteNonQuery()
            LMsg.Text += baseActualizada.ToString()
            conx.Close()
        Catch ex As Exception

        End Try
        Return baseActualizada
    End Function

    Private Function cargarSipare(ByVal vsubdel As String)
        Dim cargado As Int32 = 0
        LMsg.Text = ""
        Dim ruta As String = ""
        Dim rutaContendZip As String = ""
        If Not System.IO.Directory.Exists(Server.MapPath("~\temp\sipare\cargados\")) Then
            System.IO.Directory.CreateDirectory(Server.MapPath("~\temp\sipare\cargados\"))
        End If
        If FUSipare.FileName.Replace(" ", "").Equals("") Then
            LMsg.Text = "SELECCIONE EL ARCHIVO A CARGAR"
        Else
            ruta = Server.MapPath("~\temp\sipare\cargados\") & Session.Item("SIRECAid").ToString & Now.ToShortDateString.Replace("/", "_") & FUSipare.FileName
            'ruta = ruta.Replace(".zip", "")
            If System.IO.File.Exists(ruta) Then
                System.IO.File.Delete(ruta)
            End If
            If System.IO.Directory.Exists(ruta.Replace(".zip", "")) Then
                System.IO.Directory.Delete(ruta.Replace(".zip", ""), True)
            End If
            Dim nombreRale As String = ""
            'carga del archivo
            FUSipare.SaveAs(ruta)
            'extraccion del archivo
            Using zip As ZipFile = ZipFile.Read(ruta)
                zip.StatusMessageTextWriter = System.Console.Out
                'Status Messages will be sent to the console during extraction
                zip.ExtractAll(ruta.Replace(".zip", ""))
            End Using
            rutaContendZip = System.IO.Directory.GetFiles(ruta.Replace(".zip", "")).GetValue(0).ToString()
            'cargar en sql server
            Try
                Dim nwindConn As New OleDbConnection(cadenaconexion)
                Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
                Dim textConmand As String = " if exists(select * from tempdb.dbo.sysobjects where name = 'sipare" + vsubdel + "') "
                textConmand += " begin"
                textConmand += " drop table [tempdb].[dbo].[sipare" + vsubdel + "] "
                textConmand += " end"
                textConmand += " CREATE TABLE [tempdb].[dbo].[sipare" + vsubdel + "]( "
                textConmand += " 	[EntidadReceptora] [nvarchar](255) NULL, "
                textConmand += " 	[Sucursal] [nvarchar](50) NULL, "
                textConmand += " 	[LC] [nvarchar](255) NULL, "
                textConmand += " 	[RegistroPatronal] [nvarchar](255) NULL, "
                textConmand += " 	[RazonSocial] [nvarchar](255) NULL, "
                textConmand += " 	[Delegacion] [nvarchar](255) NULL, "
                textConmand += " 	[SubDelegacion] [nvarchar](255) NULL, "
                textConmand += " 	[PeriodoPago] [float] NULL, "
                textConmand += " 	[Origen] [nvarchar](255) NULL, "
                textConmand += " 	[FechaLimitePago] [datetime] NULL, "
                textConmand += " 	[FechaPago] [float] NULL, "
                textConmand += " 	[FechaEnvio] [datetime] NULL, "
                textConmand += " 	[ImporteIMSS] [float] NULL, "
                textConmand += " 	[ImporteRCV] [float] NULL, "
                textConmand += " 	[ImporteVivienda] [float] NULL, "
                textConmand += " 	[ImporteACV] [float] NULL, "
                textConmand += " 	[ImporteTotal] [float] NULL, "
                textConmand += " 	[MediodePago] [nvarchar](255) NULL, "
                textConmand += " 	[NoPagos] [float] NULL "
                textConmand += " ) ON [PRIMARY] "
                textConmand += "BULK INSERT [tempdb].[dbo].[sipare" + vsubdel + "] "
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
        End If
        Return cargado
    End Function

    Private Function crearBaseSipare(ByVal vsubdel As String)
        Dim registrado As Int32 = 0
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = " if exists(select * from tempdb.dbo.sysobjects where name = 'pagossipare" + vsubdel + "') "
            textConmand += " begin"
            textConmand += " drop table [tempdb].[dbo].[pagossipare" + vsubdel + "] "
            textConmand += " end"
            textConmand += " SELECT * "
            textConmand += " INTO tempdb.dbo.pagossipare" + vsubdel + " "
            textConmand += " FROM ( "
            textConmand += " SELECT * FROM ( "
            textConmand += " SELECT SIPARE_REGPAT,SIPARE_SUBDEL,SIPARE_PERIODO "
            textConmand += " ,min([FechaPago]) AS [FechaPago] "
            textConmand += " ,SUM([ImporteIMSS]) AS [Importe] "
            textConmand += " ,COUNT(*) AS PAGOS "
            textConmand += " FROM ( "
            textConmand += " SELECT "
            textConmand += "       [RegistroPatronal] SIPARE_REGPAT "
            textConmand += "       ,(case  "
            textConmand += "       when [SubDelegacion]='MERIDA SUR' then '33' "
            textConmand += "       when [SubDelegacion]='MERIDA NORTE' then '01' "
            textConmand += "       end) as SIPARE_SUBDEL "
            textConmand += "       ,substring(convert(varchar(6),[PeriodoPago]),5,2)+'/'+substring(convert(varchar(6),[PeriodoPago]),1,4) as SIPARE_PERIODO "
            textConmand += "       ,[FechaPago] "
            textConmand += "       ,[ImporteIMSS] "
            textConmand += "       ,[ImporteRCV] "
            textConmand += "   FROM [tempdb].[dbo].[sipare" + vsubdel + "] "
            textConmand += "  ) AS RES "
            textConmand += "  GROUP BY SIPARE_REGPAT,SIPARE_SUBDEL,SIPARE_PERIODO "
            textConmand += " ) AS SIPARE "
            textConmand += " INNER JOIN "
            textConmand += " ( "
            textConmand += " SELECT "
            textConmand += " SUBDEL AS SIRECA_SUBDEL "
            textConmand += " ,RESPONSABLE "
            textConmand += " ,VALIDACION "
            textConmand += " ,REG#PATRONAL AS SIRECA_REGPAT "
            textConmand += " ,CREDITO AS SIRECA_CREDITO "
            textConmand += " ,(case "
            textConmand += " when [tipoECO] in ('COP','COMP') then "
            textConmand += " (case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end) "
            textConmand += " when [tipoECO] in ('RCV','RCVCOMP') then "
            textConmand += " (case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end) "
            textConmand += " end "
            textConmand += " ) as SIRECA_PERIODO "
            textConmand += " ,OMISION AS SIRECA_IMPORTE "
            textConmand += " ,tipoeco as SIRECA_TIPOECO "
            textConmand += " from sireca.dbo.eco as eco "
            textConmand += " where tipoeco in ('COP','COMP') "
            textConmand += " ) AS SIRECA ON SIRECA_REGPAT=SIPARE_REGPAT AND SIRECA_PERIODO=SIPARE_PERIODO "
            textConmand += " UNION ALL "
            textConmand += " SELECT * FROM ( "
            textConmand += " SELECT SIPARE_REGPAT,SIPARE_SUBDEL,SIPARE_PERIODO "
            textConmand += " ,min([FechaPago]) AS [FechaPago] "
            textConmand += " ,SUM([ImporteRCV]) AS [Importe] "
            textConmand += " ,COUNT(*) AS PAGOS "
            textConmand += " FROM ( "
            textConmand += " SELECT "
            textConmand += "       [RegistroPatronal] SIPARE_REGPAT "
            textConmand += "       ,(case  "
            textConmand += "       when [SubDelegacion]='MERIDA SUR' then '33' "
            textConmand += "       when [SubDelegacion]='MERIDA NORTE' then '01' "
            textConmand += "       end) as SIPARE_SUBDEL "
            textConmand += "       ,substring(convert(varchar(6),[PeriodoPago]),5,2)+'/'+substring(convert(varchar(6),[PeriodoPago]),1,4) as SIPARE_PERIODO "
            textConmand += "       ,[FechaPago] "
            textConmand += "       ,[ImporteIMSS] "
            textConmand += "       ,[ImporteRCV] "
            textConmand += "   FROM [tempdb].[dbo].[sipare" + vsubdel + "] "
            textConmand += "  ) AS RES "
            textConmand += "  GROUP BY SIPARE_REGPAT,SIPARE_SUBDEL,SIPARE_PERIODO "
            textConmand += " ) AS SIPARE "
            textConmand += " INNER JOIN "
            textConmand += " ( "
            textConmand += " SELECT "
            textConmand += " SUBDEL AS SIRECA_SUBDEL "
            textConmand += " ,RESPONSABLE "
            textConmand += " ,VALIDACION "
            textConmand += " ,REG#PATRONAL AS SIRECA_REGPAT "
            textConmand += " ,CREDITO AS SIRECA_CREDITO "
            textConmand += " ,(case  "
            textConmand += " when [tipoECO] in ('COP','COMP') then "
            textConmand += " (case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end) "
            textConmand += " when [tipoECO] in ('RCV','RCVCOMP') then "
            textConmand += " (case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end) "
            textConmand += " end "
            textConmand += " ) as SIRECA_PERIODO "
            textConmand += " ,OMISION AS SIRECA_IMPORTE "
            textConmand += " ,tipoeco as SIRECA_TIPOECO "
            textConmand += " from sireca.dbo.eco as eco "
            textConmand += " where tipoeco in ('RCV','RCVCOMP') "
            textConmand += " ) AS SIRECA ON SIRECA_REGPAT=SIPARE_REGPAT AND SIRECA_PERIODO=SIPARE_PERIODO "
            textConmand += " ) as RESUL "
            textConmand += " WHERE IMPORTE>0 "
            textConmand += " AND VALIDACION ='SIN PAGO' "
            catCMD.CommandText = textConmand
            nwindConn.Open()
            If (catCMD.ExecuteNonQuery() >= 0) Then
                registrado = 1
            End If
            nwindConn.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
            'registrado = 0
        End Try
        Return registrado
    End Function

    Private Function depurarPorSipare(ByVal vsubdel As String)
        Dim depurado As Int32 = 0
        Try
            Dim con As New OleDbConnection(cadenaconexion)
            Dim cmd As New OleDbCommand()
            con = New OleDbConnection(cadenaconexion)
            cmd = New OleDbCommand()
            cmd.Connection = con
            Dim myInsertQuery As String = " update sireca.dbo.eco "
            myInsertQuery += " SET validacion='SIPARE' "
            myInsertQuery += " ,pago=[Importe] "
            myInsertQuery += " ,fech_pago=convert(datetime,(substring(convert(varchar(50),convert(bigint,FechaPago)),7,2)+'/'+substring(convert(varchar(50),convert(bigint,FechaPago)),5,2)+'/'+substring(convert(varchar(50),convert(bigint,FechaPago)),1,4)),103) "
            myInsertQuery += " ,cambiarincidencia=(case when cambiarincidencia='9' then '1' else cambiarincidencia end) "
            myInsertQuery += " ,incidencia=(case when incidencia is null and eco.responsable is null then 'SIPARE' else incidencia end) "
            myInsertQuery += " FROM sireca.dbo.eco inner join [tempdb].[dbo].[pagossipare" + vsubdel + "] "
            myInsertQuery += " on reg#patronal=sipare_regpat and sireca_subdel=subdel "
            myInsertQuery += " and (case  "
            myInsertQuery += " when [tipoECO] in ('COP','COMP') then "
            myInsertQuery += " (case when len(fechaeco)=5 then '0'+substring(convert(varchar,fechaeco),1,1)+'/'+substring(convert(varchar,fechaeco),2,4) else substring(convert(varchar,fechaeco),1,2)+'/'+substring(convert(varchar,fechaeco),3,4) end) "
            myInsertQuery += " when [tipoECO] in ('RCV','RCVCOMP') then "
            myInsertQuery += " (case when len(fechaeco)=5 then '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,1))/2)+'/'+substring(convert(varchar,fechaeco),2,4) else '0'+convert(nvarchar(2),convert(int,substring(convert(varchar,fechaeco),1,2))/2)+'/'+substring(convert(varchar,fechaeco),3,4) end) "
            myInsertQuery += " end "
            myInsertQuery += " )=sipare_periodo and tipoeco=SIRECA_TIPOECO "
            cmd.CommandText = myInsertQuery
            con.Open()
            LMsg.Text += cmd.ExecuteNonQuery().ToString
            con.Close()
        Catch ex As Exception

        End Try
        Return depurado
    End Function

End Class