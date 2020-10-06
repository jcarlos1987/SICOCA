Public Class ralevsrale
    Inherits System.Web.UI.Page
    Dim delDDList As String = ConfigurationSettings.AppSettings("dellike")
    Dim subdelDDList As String = ConfigurationSettings.AppSettings("subdel")
    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        If Not Request.QueryString("tipo") Is Nothing Then
            If Request.QueryString("tipo").ToString.Equals("1") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo1.Master"
            ElseIf Request.QueryString("tipo").ToString.Equals("2") Then
                Page.MasterPageFile = "~/sitios/SiteCiclo2.Master"
            End If
        End If
    End Sub

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
            If Session.Item("SIRECAsubdel").ToString.Equals("00") Then
                If Not DDLSubdel.Items.Contains(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0))) Then
                    DDLSubdel.Items.Add(New ListItem(delDDList.Split("_").GetValue(1), delDDList.Split("_").GetValue(0)))
                End If
            End If
        End If
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton1.Click
        GridViewRale1.DataBind()
        GridViewRale3.DataBind()
    End Sub

    Protected Sub GridViewRale1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewRale1.PreRender
        For i As Int32 = 0 To (GridViewRale1.Rows.Count - 1)
            If i = 0 Then
                GridViewRale1.FooterRow.Cells(1).Text = "0"
                GridViewRale1.FooterRow.Cells(2).Text = "0"
                GridViewRale1.FooterRow.Cells(3).Text = "0"
            End If
            GridViewRale1.FooterRow.Cells(1).Text = CDbl(GridViewRale1.FooterRow.Cells(1).Text) + CDbl(GridViewRale1.Rows(i).Cells(1).Text.Replace(",", ""))
            GridViewRale1.FooterRow.Cells(2).Text = CDbl(GridViewRale1.FooterRow.Cells(2).Text) + CDbl(GridViewRale1.Rows(i).Cells(2).Text.Replace(",", ""))
            GridViewRale1.FooterRow.Cells(3).Text = CDbl(GridViewRale1.FooterRow.Cells(3).Text) + CDbl(GridViewRale1.Rows(i).Cells(3).Text.Replace(",", "").Replace("$", ""))
        Next
        GridViewRale1.FooterRow.Cells(1).Text = CDbl(GridViewRale1.FooterRow.Cells(1).Text).ToString("N0")
        GridViewRale1.FooterRow.Cells(2).Text = CDbl(GridViewRale1.FooterRow.Cells(2).Text).ToString("N0")
        GridViewRale1.FooterRow.Cells(3).Text = CDbl(GridViewRale1.FooterRow.Cells(3).Text).ToString("C")
    End Sub

    Protected Sub GridViewRale3_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewRale3.PreRender
        For i As Int32 = 0 To (GridViewRale3.Rows.Count - 1)
            If i = 0 Then
                GridViewRale3.FooterRow.Cells(1).Text = "0"
                GridViewRale3.FooterRow.Cells(2).Text = "0"
                GridViewRale3.FooterRow.Cells(3).Text = "0"
            End If
            GridViewRale3.FooterRow.Cells(1).Text = CDbl(GridViewRale3.FooterRow.Cells(1).Text) + CDbl(GridViewRale3.Rows(i).Cells(1).Text.Replace(",", ""))
            GridViewRale3.FooterRow.Cells(2).Text = CDbl(GridViewRale3.FooterRow.Cells(2).Text) + CDbl(GridViewRale3.Rows(i).Cells(2).Text.Replace(",", ""))
            GridViewRale3.FooterRow.Cells(3).Text = CDbl(GridViewRale3.FooterRow.Cells(3).Text) + CDbl(GridViewRale3.Rows(i).Cells(3).Text.Replace(",", "").Replace("$", ""))
        Next
        GridViewRale3.FooterRow.Cells(1).Text = CDbl(GridViewRale3.FooterRow.Cells(1).Text).ToString("N0")
        GridViewRale3.FooterRow.Cells(2).Text = CDbl(GridViewRale3.FooterRow.Cells(2).Text).ToString("N0")
        GridViewRale3.FooterRow.Cells(3).Text = CDbl(GridViewRale3.FooterRow.Cells(3).Text).ToString("C")
    End Sub
End Class