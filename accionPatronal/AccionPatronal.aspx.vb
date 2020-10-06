Imports System.Data.OleDb

Public Class AccionPatronal
    Inherits System.Web.UI.Page
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Session.Item("SIRECAprintPaeDoc").ToString.Equals("1") Then

            Else
                Response.Redirect("~/accesoDenegado.aspx")
            End If
        End If
        'Session.Item("SIRECAid") = "007"
        'Session.Item("SIRECAnombre") = "1234"
        'Session.Item("SIRECAsubdel") = "33"
        Try
            Dim nwindConn As New OleDbConnection(cadenaconexion)
            Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
            Dim textConmand As String = " if exists(select * from sirecacobros.dbo.sysobjects where name = 'ralecoprcvtemp" & Session.Item("SIRECAid").ToString & "') "
            textConmand += " begin "
            textConmand += " drop table sirecacobros.dbo.ralecoprcvtemp" & Session.Item("SIRECAid").ToString
            textConmand += " end "
            textConmand += " SELECT *,'COP' as TIPO "
            textConmand += " INTO sirecacobros.dbo.ralecoprcvtemp" & Session.Item("SIRECAid").ToString
            textConmand += " FROM [rale].[dbo].[" & DDLRCOP.SelectedValue & "] "
            textConmand += " INSERT INTO sirecacobros.dbo.ralecoprcvtemp" & Session.Item("SIRECAid").ToString
            textConmand += " SELECT *,'RCV' as TIPO FROM [rale].[dbo].[" & DDLRRCV.SelectedValue & "] "
            catCMD.CommandText = textConmand
            nwindConn.Open()
            Dim contDatos As Int32 = catCMD.ExecuteNonQuery()
            nwindConn.Close()
            SqlDataSource1.SelectCommand = SqlDataSource1.SelectCommand.Replace("[sirecacobros].[dbo].[ralecoprcvtemp]", "[sirecacobros].[dbo].[ralecoprcvtemp" & Session.Item("SIRECAid").ToString & "]")
            SqlDataSourceInc.SelectCommand = SqlDataSourceInc.SelectCommand.Replace("[sirecacobros].[dbo].[ralecoprcvtemp]", "[sirecacobros].[dbo].[ralecoprcvtemp" & Session.Item("SIRECAid").ToString & "]")
        Catch ex As Exception

        End Try



    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim nwindConn As New OleDbConnection(cadenaconexion)
        Dim catCMD As OleDbCommand = nwindConn.CreateCommand()
        Dim textConmand As String = " if exists(select * from sirecacobros.dbo.sysobjects where name = 'ralecoprcvtemp" & Session.Item("SIRECAid").ToString & "') "
        textConmand += " begin "
        textConmand += " drop table sirecacobros.dbo.ralecoprcvtemp" & Session.Item("SIRECAid").ToString
        textConmand += " end "
        textConmand += " SELECT *,'COP' as TIPO "
        textConmand += " INTO sirecacobros.dbo.ralecoprcvtemp" & Session.Item("SIRECAid").ToString
        textConmand += " FROM [rale].[dbo].[" & DDLRCOP.SelectedValue & "] "
        textConmand += " INSERT INTO sirecacobros.dbo.ralecoprcvtemp" & Session.Item("SIRECAid").ToString
        textConmand += " SELECT *,'RCV' as TIPO FROM [rale].[dbo].[" & DDLRRCV.SelectedValue & "] "
        catCMD.CommandText = textConmand
        nwindConn.Open()
        Dim contDatos As Int32 = catCMD.ExecuteNonQuery()
        nwindConn.Close()
    End Sub

    Private Sub actualizadorHLinck()
        If IsDate(TBFecha.Text) Then
            Dim fechaMandamiento As Date = TBFecha.Text
            'fechaMandamiento.ToLongDateString()
        Else
            TBFecha.Text = Now.ToShortDateString
        End If
        Dim incString As String = ""
        'Dim regpatString As String = (GridView1.Rows(0).Cells(1).Text.Substring(0, 3) & "-" & GridView1.Rows(0).Cells(1).Text.Substring(3, 5) & "-" & GridView1.Rows(0).Cells(1).Text.Substring(8, 2))
        Dim regpatString As String = GridView1.Rows(0).Cells(1).Text
        Dim razonString As String = GridView1.Rows(0).Cells(2).Text
        Dim ii As Int32 = 0
        For i As Int32 = 0 To (CheckBoxList1.Items.Count - 1)
            If CheckBoxList1.Items(i).Selected Then
                If ii = 0 Then
                    incString = "'" & CheckBoxList1.Items(i).Value & "'"
                    ii = 1
                Else
                    incString += ",'" & CheckBoxList1.Items(i).Value & "'"
                End If
            End If
        Next
        If incString.Equals("") Then
            HLMandamiento.NavigateUrl = "~/accionPatronal/MandamientoCOPRCV.aspx?regpat=" & regpatString & "&tipo=" & DDLTipo.SelectedValue & "&incidencias=" & incString & "&fecha=" & TBFecha.Text
            HLAmpliacion.NavigateUrl = "~/accionPatronal/AmpliacionCOPRCV.aspx?regpat=" & regpatString & "&tipo=" & DDLTipo.SelectedValue & "&incidencias=" & incString & "&fecha=" & TBFecha.Text
            HLRemocion.NavigateUrl = "~/accionPatronal/RemocionCOPRCV.aspx?regpat=" & regpatString & "&tipo=" & DDLTipo.SelectedValue & "&incidencias=" & incString & "&fecha=" & TBFecha.Text
            HLCerrajero.NavigateUrl = "~/accionPatronal/CerrajeroCOPRCV.aspx?regpat=" & regpatString & "&tipo=" & DDLTipo.SelectedValue & "&incidencias=" & incString & "&fecha=" & TBFecha.Text
            HLObservacion.NavigateUrl = "~/observacionPatronal/Default.aspx?regpat=" & regpatString & "&razon=" & razonString
            HLCitatorio.NavigateUrl = "~/accionPatronal/CitatorioCOPRCV.aspx?regpat=" & regpatString & "&tipo=" & DDLTipo.SelectedValue & "&incidencias=" & incString & "&fecha=" & TBFecha.Text
        Else
            HLMandamiento.NavigateUrl = "~/accionPatronal/MandamientoCOPRCV.aspx?regpat=" & regpatString & "&tipo=" & DDLTipo.SelectedValue & "&incidencias=" & incString & "&fecha=" & TBFecha.Text
            HLAmpliacion.NavigateUrl = "~/accionPatronal/AmpliacionCOPRCV.aspx?regpat=" & regpatString & "&tipo=" & DDLTipo.SelectedValue & "&incidencias=" & incString & "&fecha=" & TBFecha.Text
            HLRemocion.NavigateUrl = "~/accionPatronal/RemocionCOPRCV.aspx?regpat=" & regpatString & "&tipo=" & DDLTipo.SelectedValue & "&incidencias=" & incString & "&fecha=" & TBFecha.Text
            HLCerrajero.NavigateUrl = "~/accionPatronal/CerrajeroCOPRCV.aspx?regpat=" & regpatString & "&tipo=" & DDLTipo.SelectedValue & "&incidencias=" & incString & "&fecha=" & TBFecha.Text
            HLObservacion.NavigateUrl = "~/observacionPatronal/Default.aspx?regpat=" & regpatString & "&razon=" & razonString
            HLCitatorio.NavigateUrl = "~/accionPatronal/CitatorioCOPRCV.aspx?regpat=" & regpatString & "&tipo=" & DDLTipo.SelectedValue & "&incidencias=" & incString & "&fecha=" & TBFecha.Text
        End If
    End Sub
    Protected Sub CheckBoxList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles CheckBoxList1.SelectedIndexChanged
        actualizadorHLinck()
    End Sub

    Protected Sub DDLTipo_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLTipo.SelectedIndexChanged
        actualizadorHLinck()
    End Sub

    Protected Sub TBFecha_Init(ByVal sender As Object, ByVal e As EventArgs) Handles TBFecha.Init
        TBFecha.Text = Now.ToShortDateString
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.SelectedIndexChanged
        PanelImpresion.Visible = True
        actualizadorHLinck()
    End Sub

    Protected Sub TBBuscador_TextChanged(ByVal sender As Object, ByVal e As EventArgs) Handles TBBuscador.TextChanged
        PanelImpresion.Visible = False
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