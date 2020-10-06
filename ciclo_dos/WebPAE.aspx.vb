Public Class WebPAE
    Inherits System.Web.UI.Page
    Dim verde As String = ConfigurationSettings.AppSettings("Color0")
    Dim amarillo As String = ConfigurationSettings.AppSettings("Color30")
    Dim rojo As String = ConfigurationSettings.AppSettings("Color90")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SqlDataSourcePae.SelectCommand = SqlDataSourcePae.SelectCommand.Replace("ecoTipos", "ecoTipos" & Request.UserHostAddress.Replace(".", "_"))
        SqlDataSourcePae.SelectCommand = SqlDataSourcePae.SelectCommand.Replace("paeTemp", "paeTemp" & Request.UserHostAddress.Replace(".", "_"))
        SqlDataSourcePae.SelectCommand = SqlDataSourcePae.SelectCommand.Replace("where [REGPATR]='000-000-000'", "")
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender
        GridView1.Caption = GridView1.Rows.Count & " Patrones"
        colorizar()
    End Sub
    Private Sub colorizar()
        Dim valor1 As Int32 = 100
        Dim valor2 As Int32 = 300
        For index As Integer = 0 To (GridView1.Rows.Count - 1)
            If Convert.ToDouble(GridView1.Rows(index).Cells(GridView1.Columns.Count - 1).Text) < valor1 Then
                GridView1.Rows(index).BackColor = Drawing.Color.FromName(verde)
            ElseIf Convert.ToDouble(GridView1.Rows(index).Cells(GridView1.Columns.Count - 1).Text) >= valor1 And Convert.ToDouble(GridView1.Rows(index).Cells(GridView1.Columns.Count - 1).Text) <= valor2 Then
                GridView1.Rows(index).BackColor = Drawing.Color.FromName(amarillo)
            ElseIf Convert.ToDouble(GridView1.Rows(index).Cells(GridView1.Columns.Count - 1).Text) > valor2 Then
                GridView1.Rows(index).BackColor = Drawing.Color.FromName(rojo)
            End If
        Next
    End Sub
    Protected Sub DDLSubdel_Init(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSubdel.Init
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
            'DDLSubdel.Items.Add(New ListItem("NORTE", "01"))
            'DDLSubdel.Items.Add(New ListItem("SUR", "33"))
        Else
            DDLSubdel.Items.Clear()
            If Session.Item("SIRECAsubdel").Equals("01") Then
                DDLSubdel.Items.Add(New ListItem("NORTE", "01"))
            ElseIf Session.Item("SIRECAsubdel").Equals("33") Then
                DDLSubdel.Items.Add(New ListItem("SUR", "33"))
            Else
                DDLSubdel.Items.Add(New ListItem("NORTE", "01"))
                DDLSubdel.Items.Add(New ListItem("SUR", "33"))
            End If
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Try
            'SqlDataSourcePae.SelectCommand = SqlDataSourcePae.SelectCommand.Replace("ecoTipos", "ecoTipos" & Request.UserHostAddress.Replace(".", "_"))
            'SqlDataSourcePae.SelectCommand = SqlDataSourcePae.SelectCommand.Replace("paeTemp", "paeTemp" & Request.UserHostAddress.Replace(".", "_"))
            Dim fecha As Date = DateAdd(DateInterval.Month, -1, Now)
            Dim mes As String = fecha.Month
            If fecha.Month.ToString().Length = 1 Then
                mes = "0" & mes
            End If
            SqlDataSourcePae.SelectCommand = SqlDataSourcePae.SelectCommand.Replace("D:\CDDATA\1012\EMIS3301.mdb", "D:\CDDATA\" & mes & fecha.Year.ToString.Substring(2, 2) & "\EMIS33" & DDLSubdel.SelectedValue & ".mdb")
            SqlDataSourcePae.SelectCommand = SqlDataSourcePae.SelectCommand.Replace("3301ACOP201112", DDLRale.SelectedValue)
            'SqlDataSourcePae.SelectCommand = SqlDataSourcePae.SelectCommand.Replace("where [REGPATR]='000-000-000'", "")
            GridView1.DataBind()
        Catch ex As Exception

        End Try
    End Sub
End Class