Imports System.Data.OleDb
Imports email

Public Class ProVsEco
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If (Session.Item("SIRECAsubdel").ToString <> "00") And Session.Item("SIRECAuser_type").ToString.Equals("0") And Session.Item("SIRECAchmod1").ToString.Equals("x") Then

            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        LabelCOP.Text = CruzarProEcoCOP() & " COP's depurados del periodo " & DDLPeriodo.Text
        LabelCOMP.Text = CruzarProEcoCOMP() & " COMP's depurados del periodo " & DDLPeriodo.Text
        LabelRCV.Text = CruzarProEcoRCV() & " RCV's depurados del periodo " & DDLPeriodo.Text
        LabelRCVCOMP.Text = CruzarProRCVCOMP() & " RCVCOMP's depurados del periodo " & DDLPeriodo.Text
        setIncidencias()
    End Sub
    Function CruzarProEcoCOP() As Integer
        Dim COPDepurados As Integer = 0
        '-------------ini COP
        Dim periodo As String = DDLPeriodo.SelectedValue
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = "SELECT "
        textConmand += " eco.[id]"
        textConmand += " FROM [sireca].[dbo].[eco] as eco "
        textConmand += " left join "
        textConmand += " (select p.RCP_REGPAT as RCP_REGPAT, sum(p.RCP_IMP_COP) as importe from [procesar].[dbo].[RCPRO] as p "
        If periodo.Length = 5 Then
            textConmand += " where p.RCP_PER = '" & periodo.Substring(1, 4) & "/0" & periodo.Substring(0, 1) & "' "
        Else
            textConmand += " where p.RCP_PER = '" & periodo.Substring(2, 4) & "/" & periodo.Substring(0, 2) & "' "
        End If
        textConmand += " group by p.RCP_REGPAT "
        textConmand += " ) as pro on eco.REG#PATRONAL = pro.RCP_REGPAT "
        textConmand += " WHERE "
        textConmand += " eco.tipoECO ='COP' AND eco.subdel='" & Session.Item("SIRECAsubdel").ToString & "' "
        textConmand += " AND eco.fechaEco = '" & periodo & "' "
        textConmand += " AND (eco.incidencia not in ('RE','POR PROCESAR') or eco.incidencia is null) "
        textConmand += " AND pro.importe>=eco.omision "
        Response.Write(textConmand)
        catCMD.CommandText = textConmand
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Dim vId As String = ""
        Do While myReader.Read()
            COPDepurados += 1
            vId = myReader.GetValue(0)
            'ini asignar cobro---------------------------------------------------------------
            Dim con As New OleDbConnection(cadenaconexion)
            Dim cmd As New OleDbCommand()
            cmd.Connection = con

            Dim myInsertQuery As String = "update [sireca].[dbo].[eco] set [cambiarIncidencia]=?,[horaCitatorio]=?,[diasDisponibles]=?,[incidencia]=? WHERE [id]=? "
            cmd.CommandText = myInsertQuery

            'cmd.Parameters.Add("@cambiarIncidencia", OleDbType.Double).Value = 0
            'cmd.Parameters.Add("@fechaSeleccion", OleDbType.Date).Value = Now
            cmd.Parameters.Add("@cambiarIncidencia", OleDbType.Double).Value = 1
            cmd.Parameters.Add("@horaCitatorio", OleDbType.VarChar).Value = DBNull.Value
            cmd.Parameters.Add("@diasDisponibles", OleDbType.Double).Value = 0
            cmd.Parameters.Add("@incidencia", OleDbType.VarChar).Value = "POR PROCESAR"
            '            cmd.Parameters.Add("@grado1", OleDbType.VarChar).Value = "POR PROCESAR"
            cmd.Parameters.Add("@id", OleDbType.Double).Value = Convert.ToDouble(vId)

            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            'fin asignar cobro---------------------------------------------------------------
        Loop
        myReader.Close()
        nwindConn.Close()
        '-------------fin COP      
        Return COPDepurados
    End Function
    Function CruzarProRCVCOMP() As Integer
        Dim COPDepurados As Integer = 0
        '-------------ini COP
        Dim periodo As String = DDLPeriodo.SelectedValue
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = "SELECT "
        textConmand += " eco.[id] "
        textConmand += " FROM [sireca].[dbo].[eco] as eco "
        textConmand += " left join "
        textConmand += " (select p.RCP_REGPAT as RCP_REGPAT, sum(p.RCP_IMP_RCV) as importe from [procesar].[dbo].[RCPRO] as p "
        If periodo.Length = 5 Then
            textConmand += " where p.RCP_PER = '" & periodo.Substring(1, 4) & "/0" & periodo.Substring(0, 1) & "' "
        Else
            textConmand += " where p.RCP_PER = '" & periodo.Substring(2, 4) & "/" & periodo.Substring(0, 2) & "' "
        End If
        textConmand += " group by p.RCP_REGPAT "
        textConmand += " ) as pro on eco.REG#PATRONAL = pro.RCP_REGPAT "
        textConmand += " WHERE "
        textConmand += " eco.tipoECO ='RCVCOMP' AND eco.subdel='" & Session.Item("SIRECAsubdel").ToString & "' "
        textConmand += " AND eco.fechaEco = '" & periodo & "' "
        textConmand += " AND (eco.incidencia not in ('RE','POR PROCESAR') or eco.incidencia is null) "
        textConmand += " AND pro.importe>=eco.omision "
        Response.Write(textConmand)
        catCMD.CommandText = textConmand
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Dim vId As String = ""
        Do While myReader.Read()
            COPDepurados += 1
            vId = myReader.GetValue(0)
            'ini asignar cobro---------------------------------------------------------------
            Dim con As New OleDbConnection(cadenaconexion)
            Dim cmd As New OleDbCommand()
            cmd.Connection = con

            Dim myInsertQuery As String = "update [sireca].[dbo].[eco] set [cambiarIncidencia]=?,[horaCitatorio]=?,[diasDisponibles]=?,[incidencia]=? WHERE [id]=? "
            cmd.CommandText = myInsertQuery

            'cmd.Parameters.Add("@cambiarIncidencia", OleDbType.Double).Value = 0
            'cmd.Parameters.Add("@fechaSeleccion", OleDbType.Date).Value = Now
            cmd.Parameters.Add("@cambiarIncidencia", OleDbType.Double).Value = 1
            cmd.Parameters.Add("@horaCitatorio", OleDbType.VarChar).Value = DBNull.Value
            cmd.Parameters.Add("@diasDisponibles", OleDbType.Double).Value = 0
            cmd.Parameters.Add("@incidencia", OleDbType.VarChar).Value = "POR PROCESAR"
            'cmd.Parameters.Add("@grado1", OleDbType.VarChar).Value = "POR PROCESAR"
            cmd.Parameters.Add("@id", OleDbType.Double).Value = Convert.ToDouble(vId)

            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            'fin asignar cobro---------------------------------------------------------------
        Loop
        myReader.Close()
        nwindConn.Close()
        '-------------fin COP      
        Return COPDepurados
    End Function
    Function CruzarProEcoCOMP() As Integer
        Dim COPDepurados As Integer = 0
        '-------------ini COP
        Dim periodo As String = DDLPeriodo.SelectedValue
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = "SELECT "
        textConmand += " eco.[id] "
        textConmand += " FROM [sireca].[dbo].[eco] as eco "
        textConmand += " left join "
        textConmand += " (select p.RCP_REGPAT as RCP_REGPAT, sum(p.RCP_IMP_COP) as importe from [procesar].[dbo].[RCPRO] as p "
        If periodo.Length = 5 Then
            textConmand += " where p.RCP_PER = '" & periodo.Substring(1, 4) & "/0" & periodo.Substring(0, 1) & "' "
        Else
            textConmand += " where p.RCP_PER = '" & periodo.Substring(2, 4) & "/" & periodo.Substring(0, 2) & "' "
        End If
        textConmand += " group by p.RCP_REGPAT "
        textConmand += " ) as pro on eco.REG#PATRONAL = pro.RCP_REGPAT "
        textConmand += " WHERE "
        textConmand += " eco.tipoECO ='COMP' AND eco.subdel='" & Session.Item("SIRECAsubdel").ToString & "' "
        textConmand += " AND eco.fechaEco = '" & periodo & "' "
        textConmand += " AND (eco.incidencia not in ('RE','POR PROCESAR') or eco.incidencia is null) "
        textConmand += " AND pro.importe>=eco.omision "
        Response.Write(textConmand)
        catCMD.CommandText = textConmand
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Dim vId As String = ""
        Do While myReader.Read()
            COPDepurados += 1
            vId = myReader.GetValue(0)
            'ini asignar cobro---------------------------------------------------------------
            Dim con As New OleDbConnection(cadenaconexion)
            Dim cmd As New OleDbCommand()
            cmd.Connection = con

            Dim myInsertQuery As String = "update [sireca].[dbo].[eco] set [cambiarIncidencia]=?,[horaCitatorio]=?,[diasDisponibles]=?,[incidencia]=? WHERE [id]=? "
            cmd.CommandText = myInsertQuery

            'cmd.Parameters.Add("@cambiarIncidencia", OleDbType.Double).Value = 0
            'cmd.Parameters.Add("@fechaSeleccion", OleDbType.Date).Value = Now
            cmd.Parameters.Add("@cambiarIncidencia", OleDbType.Double).Value = 1
            cmd.Parameters.Add("@horaCitatorio", OleDbType.VarChar).Value = DBNull.Value
            cmd.Parameters.Add("@diasDisponibles", OleDbType.Double).Value = 0
            cmd.Parameters.Add("@incidencia", OleDbType.VarChar).Value = "POR PROCESAR"
            'cmd.Parameters.Add("@grado1", OleDbType.VarChar).Value = "POR PROCESAR"
            cmd.Parameters.Add("@id", OleDbType.Double).Value = Convert.ToDouble(vId)

            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            'fin asignar cobro---------------------------------------------------------------
        Loop
        myReader.Close()
        nwindConn.Close()
        '-------------fin COP      
        Return COPDepurados
    End Function
    Function CruzarProEcoRCV() As Integer
        Dim RCVDepurados As Integer = 0
        '-------------ini COP
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim periodo As String = DDLPeriodo.SelectedValue
        Dim textConmand As String = "SELECT "
        textConmand += " eco.[id] "
        textConmand += " FROM [sireca].[dbo].[eco] as eco "
        textConmand += " left join "
        textConmand += " (select p.RCP_REGPAT as RCP_REGPAT, sum(p.RCP_IMP_RCV) as importe from [procesar].[dbo].[RCPRO] as p "
        If periodo.Length = 5 Then
            textConmand += " where p.RCP_PER = '" & periodo.Substring(1, 4) & "/0" & periodo.Substring(0, 1) & "' "
        Else
            textConmand += " where p.RCP_PER = '" & periodo.Substring(2, 4) & "/" & periodo.Substring(0, 2) & "' "
        End If
        textConmand += " group by p.RCP_REGPAT "
        textConmand += " ) as pro on eco.REG#PATRONAL = pro.RCP_REGPAT "
        textConmand += " WHERE "
        textConmand += " eco.tipoECO ='RCV' AND eco.subdel='" & Session.Item("SIRECAsubdel").ToString & "' "
        textConmand += " AND eco.fechaEco = '" & periodo & "' "
        textConmand += " AND (eco.incidencia not in ('RE','POR PROCESAR') or eco.incidencia is null) "
        textConmand += " AND pro.importe>=eco.omision "
        Response.Write(textConmand)
        catCMD.CommandText = textConmand
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Dim vId As String = ""
        Do While myReader.Read()
            RCVDepurados += 1
            vId = myReader.GetValue(0)
            'ini asignar cobro---------------------------------------------------------------
            Dim con As New OleDbConnection(cadenaconexion)
            Dim cmd As New OleDbCommand()
            cmd.Connection = con

            Dim myInsertQuery As String = "update [sireca].[dbo].[eco] set [cambiarIncidencia]=?,[horaCitatorio]=?,[diasDisponibles]=?,[incidencia]=? WHERE [id]=? "
            cmd.CommandText = myInsertQuery

            'cmd.Parameters.Add("@cambiarIncidencia", OleDbType.Double).Value = 0
            'cmd.Parameters.Add("@fechaSeleccion", OleDbType.Date).Value = Now
            cmd.Parameters.Add("@cambiarIncidencia", OleDbType.Double).Value = 1
            cmd.Parameters.Add("@horaCitatorio", OleDbType.VarChar).Value = DBNull.Value
            cmd.Parameters.Add("@diasDisponibles", OleDbType.Double).Value = 0
            cmd.Parameters.Add("@incidencia", OleDbType.VarChar).Value = "POR PROCESAR"
            'cmd.Parameters.Add("@grado1", OleDbType.VarChar).Value = "POR PROCESAR"
            cmd.Parameters.Add("@id", OleDbType.Double).Value = Convert.ToDouble(vId)

            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            'fin asignar cobro---------------------------------------------------------------
        Loop
        myReader.Close()
        nwindConn.Close()
        '-------------fin COP
        Return RCVDepurados
    End Function
    Private Sub setIncidencias()

    End Sub
    Function CruzarLGP() As Integer
        Dim Depurados As Integer = 0
        '-------------ini LGP
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim periodo As String = DDLPeriodo.SelectedValue
        Dim textConmand As String = " SELECT eco.[id],eco.REG#PATRONAL "
        textConmand += " FROM [sireca].[dbo].[eco] as eco,[lgp].dbo.RC  as lgp "
        textConmand += " WHERE "
        textConmand += " eco.CREDITO = lgp.RC_CRED "
        textConmand += " AND RC_DOC in ('01','02') AND lgp.RC_SUB ='" & Session.Item("SIRECAsubdel").ToString & "' "
        If periodo.Length = 5 Then
            textConmand += " AND (eco.fechaEco = '" & periodo & "' AND lgp.RC_PER = '" & periodo.Substring(1, 4) & "/0" & periodo.Substring(0, 1) & "') "
        Else
            textConmand += " AND (eco.fechaEco = '" & periodo & "' AND lgp.RC_PER = '" & periodo.Substring(2, 4) & "/" & periodo.Substring(0, 2) & "') "
        End If
        textConmand += " AND (eco.incidencia not in ('POR PROCESAR','PAGADO','RE','BD') or incidencia is null) "
        textConmand += " group by eco.id,eco.REG#PATRONAL "
        textConmand += " having sum(lgp.[RC_IMP_TOT])>=sum(eco.omision) "
        Response.Write(textConmand)
        catCMD.CommandText = textConmand
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Dim vId As String = ""
        Do While myReader.Read()
            Depurados += 1
            vId = myReader.GetValue(0)
            'ini asignar cobro---------------------------------------------------------------
            Dim con As New OleDbConnection(cadenaconexion)
            Dim cmd As New OleDbCommand()
            cmd.Connection = con

            Dim myInsertQuery As String = "update [sireca].[dbo].[eco] set [cambiarIncidencia]=?,[horaCitatorio]=?,[diasDisponibles]=?,[incidencia]=? WHERE [id]=? "
            cmd.CommandText = myInsertQuery

            'cmd.Parameters.Add("@cambiarIncidencia", OleDbType.Double).Value = 0
            'cmd.Parameters.Add("@fechaSeleccion", OleDbType.Date).Value = Now
            cmd.Parameters.Add("@cambiarIncidencia", OleDbType.Double).Value = 1
            cmd.Parameters.Add("@horaCitatorio", OleDbType.VarChar).Value = DBNull.Value
            cmd.Parameters.Add("@diasDisponibles", OleDbType.Double).Value = 0
            cmd.Parameters.Add("@incidencia", OleDbType.VarChar).Value = "PAGADO"
            'cmd.Parameters.Add("@grado1", OleDbType.VarChar).Value = "PAGADO"
            cmd.Parameters.Add("@id", OleDbType.Double).Value = Convert.ToDouble(vId)

            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            'fin asignar cobro---------------------------------------------------------------
        Loop
        myReader.Close()
        nwindConn.Close()
        '-------------fin LGP
        Return Depurados
    End Function
    Function CruzarNoLocalizados() As Integer
        Dim Depurados As Integer = 0
        '-------------ini NO LOCALIZADOS
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim periodo As String = DDLPeriodo.SelectedValue.ToString
        Dim anio As String = ""
        If periodo.Length = 5 Then
            anio = periodo.Substring(1, 4)
        Else
            anio = periodo.Substring(2, 4)
        End If
        Dim mes As String = ""
        If periodo.Length = 5 Then
            mes = "0" + periodo.Substring(0, 1)
        Else
            mes = periodo.Substring(0, 2)
        End If
        Dim textConmand As String = " DECLARE @ANIO as VARCHAR(4) "
        textConmand += " DECLARE @MES as VARCHAR(2) "
        textConmand += " DECLARE @SUBDEL as VARCHAR(2)  "
        textConmand += " DECLARE @PERIODOANTERIOR as VARCHAR(6) "
        textConmand += " SET @ANIO='" + anio + "' "
        textConmand += " SET @MES='" + mes + "' "
        textConmand += " SET @SUBDEL='" + Session.Item("SIRECAsubdel").ToString + "' "
        textConmand += " SET @PERIODOANTERIOR=convert(varchar,month(dateadd(month,-1,('01/'+@MES+'/'+@ANIO))))+convert(varchar,year(dateadd(month,-1,('01/'+@MES+'/'+@ANIO)))) "
        textConmand += " ---------insert "
        textConmand += " insert [sireca].[dbo].[nolocalizados] "
        textConmand += " select "
        textConmand += " id,convert(datetime,getdate(),103),responsable,NULL,NULL,'I',reg#patronal "
        textConmand += " FROM sireca.dbo.eco as eco "
        textConmand += " where  "
        textConmand += " subdel=@SUBDEL  "
        textConmand += " and tipoeco in ('COP','COMP','RCV','RCVCOMP') "
        textConmand += " and fechaEco=@MES+@ANIO "
        textConmand += " and exists(select eco2.[reg#patronal] from sireca.dbo.eco as eco2 where eco2.[reg#patronal]=eco.[reg#patronal] and fechaeco=@PERIODOANTERIOR and incidencia='9') "
        textConmand += " and incidencia is null "
        textConmand += " and not exists(select top 1 max(nloc.fechaCaptura) FROM [sireca].[dbo].[nolocalizados] as nloc where nloc.[idEco]=eco.[id]) "
        textConmand += " ---------/insert "
        textConmand += " ---------update "
        textConmand += " update sireca.dbo.eco  "
        textConmand += " set incidencia='9' "
        textConmand += " , fechaCaptura=convert(datetime,getdate(),103)  "
        textConmand += " , cambiarincidencia='0'  "
        textConmand += " FROM sireca.dbo.eco as eco "
        textConmand += " where  "
        textConmand += " subdel=@SUBDEL  "
        textConmand += " and tipoeco in ('COP','COMP','RCV','RCVCOMP') "
        textConmand += " and fechaEco=@MES+@ANIO "
        textConmand += " and exists(select eco2.[reg#patronal] from sireca.dbo.eco as eco2 where eco2.[reg#patronal]=eco.[reg#patronal] and fechaeco=@PERIODOANTERIOR and incidencia='9') "
        textConmand += " and incidencia is null "
        textConmand += " ---------/update "
        textConmand += " select "
        textConmand += " eco.subdel as SUBDEL "
        textConmand += " ,max(ptn.sector) as SECTOR "
        textConmand += " ,(@MES+'/'+@ANIO) as PERIODO "
        textConmand += " ,noc.[regpat] as [REG.PATRONAL] "
        textConmand += " ,max(ptn.razonSocial) as RAZON_SOCIAL "
        textConmand += " ,max(ptn.cotiz) as COTIZANTES "
        textConmand += " ,max(dom) as DOMICILIO "
        textConmand += " ,max(loc) as LOCALIDAD "
        textConmand += " ,(select top 1 max(nloc.fechaCaptura) FROM [sireca].[dbo].[nolocalizados] as nloc where nloc.[regpat]=noc.[regpat]) as CAPTURADO "
        textConmand += " ,eco.incidencia as INCIDENCIA  "
        textConmand += " FROM sireca.dbo.eco as eco  "
        textConmand += " inner join   "
        textConmand += " [sireca].[dbo].[nolocalizados] as noc   "
        textConmand += " on  noc.regpat=reg#patronal left join sireca.dbo.patrones as ptn on substring(noc.regpat,1,10)=ptn.regpat  "
        textConmand += " where eco.[incidencia] in ('BD','9')   "
        textConmand += " and eco.subdel=@SUBDEL   "
        textConmand += " and fechaEco=@MES+@ANIO   "
        textConmand += " and tipoeco in ('COP','COMP','RCV','RCVCOMP')  "
        textConmand += " group by eco.subdel,noc.regpat,eco.incidencia   "
        textConmand += " order by COTIZANTES desc "
        Response.Write(textConmand)

        '"SELECT eco.[id],eco.[REG#PATRONAL],eco.[fechaEco],nl.incidencia FROM [sireca].[dbo].[eco] as eco INNER JOIN [sireca].[dbo].nolocalizados as nl ON eco.REG#PATRONAL like nl.regpat+'%' "
        'textConmand += " AND (eco.fechaEco = '" & periodo & "' AND eco.subdel = '" & Session.Item("SIRECAsubdel").ToString & "') AND nl.incidencia in ('BD','9','I') "

        catCMD.CommandText = textConmand
        nwindConn.Open()
        textConmand = ""
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Dim emailx As CorreoEnviar = New CorreoEnviar
        Dim correoMsg As String = "<strong>Lista de depuración de los NO LOCALIZADOS.</strong><br/>"
        correoMsg += "<table border='1'>"
        correoMsg += "	<tr>"
        correoMsg += "		<th>&nbsp;</th>"
        correoMsg += "		<th>SUBDEL</th>"
        correoMsg += "		<th>SECTOR</th>"
        correoMsg += "		<th>PERIODO</th>"
        correoMsg += "		<th>REG.PATRONAL</th>"
        correoMsg += "		<th>RAZON_SOCIAL</th>"
        correoMsg += "		<th>COTIZANTES</th>"
        correoMsg += "		<th>DOMICILIO</th>"
        correoMsg += "		<th>LOCALIDAD</th>"
        correoMsg += "		<th>CAPTURADO</th>"
        correoMsg += "		<th>INCIDENCIA</th>"
        correoMsg += "	</tr>"
        Do While myReader.Read()
            Depurados += 1            
            '-----
            correoMsg += " <tr>"
            correoMsg += "	<td>" + Depurados.ToString + "</td>"
            correoMsg += "	<td>" + myReader.GetValue(0).ToString + "</td>"
            correoMsg += "	<td>" + myReader.GetValue(1).ToString + "</td>"
            correoMsg += "	<td>" + myReader.GetValue(2).ToString + "</td>"
            correoMsg += "	<td>" + myReader.GetValue(3).ToString + "</td>"
            correoMsg += "	<td>" + myReader.GetValue(4).ToString + "</td>"
            correoMsg += "	<td>" + myReader.GetValue(5).ToString + "</td>"
            correoMsg += "	<td>" + myReader.GetValue(6).ToString + "</td>"
            correoMsg += "	<td>" + myReader.GetValue(7).ToString + "</td>"
            correoMsg += "	<td>" + myReader.GetValue(8).ToString + "</td>"
            correoMsg += "	<td>" + myReader.GetValue(9).ToString + "</td>"
            correoMsg += "</tr>"
            '-----
        Loop
        myReader.Close()
        nwindConn.Close()
        correoMsg += "</table>"
        If Session.Item("SIRECAsubdel").ToString.Equals("01") Then
            emailx.correoEnviar("alejandra.victorin@imss.gob.mx", "cc", "yamily.novelo@imss.gob.mx,jose.lizama@imss.gob.mx,geovani.medina@imss.gob.mx", " SIRECA, NO LOCALIZADO", "0", correoMsg)
        ElseIf Session.Item("SIRECAsubdel").ToString.Equals("33") Then
            emailx.correoEnviar("dea.hernandezoj@imss.gob.mx", "cc", "nora.guadiana@imss.gob.mx,roman.pech@imss.gob.mx,ligia.arceo@imss.gob.mx,aureo.medina@imss.gob.mx,julio.soberanis@imss.gob.mx", " SIRECA, NO LOCALIZADO", "0", correoMsg)
        End If
        emailx.correoEnviar("hector.duranb@imss.gob.mx", "pedro.cuevas@imss.gob.mx", "jesus.chi@imss.gob.mx", " SIRECA, NO LOCALIZADO", "0", correoMsg)
        '-------------fin NO LOCALIZADOS
        Return Depurados
    End Function
    Function CruzarAutodeterminados() As Integer
        Dim Depurados As Integer = 0
        '-------------ini AUTODETERMINADOS
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim periodo As String = DDLPeriodo.SelectedValue
        Dim textConmand As String = "SELECT eco.[id],eco.[REG#PATRONAL],eco.[fechaEco] FROM [sireca].[dbo].[eco] as eco INNER JOIN [sireca].[dbo].autodeterminados as aut ON eco.REG#PATRONAL like aut.regpat+'%' "
        textConmand += "AND (eco.fechaEco = '" & periodo & "' AND eco.subdel = '" & Session.Item("SIRECAsubdel").ToString & "') AND (aut.incidencia not in ('PAGADO') or aut.incidencia is null) AND eco.grado1 not in('A') AND eco.grado1 in ('SIN ASIGNAR')"

        catCMD.CommandText = textConmand
        nwindConn.Open()
        Dim myReader As OleDbDataReader = catCMD.ExecuteReader()
        Dim vId As String = ""
        Do While myReader.Read()
            Depurados += 1
            vId = myReader.GetValue(0)
            'ini asignar cobro---------------------------------------------------------------
            Dim con As New OleDbConnection(cadenaconexion)
            Dim cmd As New OleDbCommand()
            cmd.Connection = con

            Dim myInsertQuery As String = "update [sireca].[dbo].[eco] set [cambiarIncidencia]=?,[horaCitatorio]=?,[diasDisponibles]=?,[incidencia]=? WHERE [id]=?"
            cmd.CommandText = myInsertQuery

            'cmd.Parameters.Add("@cambiarIncidencia", OleDbType.Double).Value = 0
            'cmd.Parameters.Add("@fechaSeleccion", OleDbType.Date).Value = Now
            cmd.Parameters.Add("@cambiarIncidencia", OleDbType.Double).Value = 1
            cmd.Parameters.Add("@horaCitatorio", OleDbType.VarChar).Value = DBNull.Value
            cmd.Parameters.Add("@diasDisponibles", OleDbType.Double).Value = 0
            cmd.Parameters.Add("@incidencia", OleDbType.VarChar).Value = "A"
            'cmd.Parameters.Add("@grado1", OleDbType.VarChar).Value = "A"
            cmd.Parameters.Add("@id", OleDbType.Double).Value = Convert.ToDouble(vId)

            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            'fin asignar cobro---------------------------------------------------------------
        Loop
        myReader.Close()
        nwindConn.Close()
        '-------------fin AUTODETERMINADOS
        Return Depurados
    End Function

    Protected Sub BLGP_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BLGP.Click
        LabelLGP.Text = CruzarLGP() & " Depurados." & DDLPeriodo.Text
    End Sub

    Protected Sub BA_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BA.Click
        LabelAutodeterminado.Text = CruzarAutodeterminados() & " Autodeterminados." & DDLPeriodo.Text
    End Sub

    Protected Sub BNL_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BNL.Click
        LabelNL.Text = CruzarNoLocalizados() & " No Localizados." & DDLPeriodo.Text
    End Sub
End Class