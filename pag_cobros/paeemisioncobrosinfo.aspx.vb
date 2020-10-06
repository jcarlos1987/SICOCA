﻿Imports System.Globalization

Public Class paeemisioncobrosinfo
    Inherits System.Web.UI.Page
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
        End If
    End Sub

    Protected Sub BLActualizar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BLActualizar.Click
        GridViewMunicipio.DataBind()
        GridViewMunicipioSector.DataBind()
    End Sub

    Protected Sub GridViewMunicipio_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewMunicipio.PreRender
        Try            
            GridViewMunicipio.FooterRow.Cells(2).Text = "0"
            GridViewMunicipio.FooterRow.Cells(3).Text = "0"
            GridViewMunicipio.FooterRow.Cells(4).Text = "0"
            For i As Int32 = 0 To (GridViewMunicipio.Rows.Count - 1)
                GridViewMunicipio.FooterRow.Cells(2).Text = Convert.ToDouble(GridViewMunicipio.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridViewMunicipio.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewMunicipio.FooterRow.Cells(3).Text = Convert.ToDouble(CType(GridViewMunicipio.Rows(i).Cells(3).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewMunicipio.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewMunicipio.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewMunicipio.Rows(i).Cells(4).Text.Replace(",", "").Replace("$", "")) + Convert.ToDouble(GridViewMunicipio.FooterRow.Cells(4).Text.Replace(",", "").Replace("$", ""))

            Next
            GridViewMunicipio.FooterRow.Cells(2).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewMunicipio.FooterRow.Cells(2).Text)) + "</strong>"
            GridViewMunicipio.FooterRow.Cells(3).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewMunicipio.FooterRow.Cells(3).Text)) + "</strong>"
            GridViewMunicipio.FooterRow.Cells(4).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewMunicipio.FooterRow.Cells(4).Text)) + "</strong>"
            GridViewMunicipio.Caption = "<strong>POR MUNICIPIO<hr/>PATRONES: " & GridViewMunicipio.FooterRow.Cells(3).Text & ", IMPORTE: " & GridViewMunicipio.FooterRow.Cells(4).Text & "</strong>"
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewMunicipioSector_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridViewMunicipioSector.PreRender
        Try            
            'GridViewMunicipioSector.FooterRow.Cells(2).Text = "0"
            GridViewMunicipioSector.FooterRow.Cells(3).Text = "0"
            GridViewMunicipioSector.FooterRow.Cells(4).Text = "0"
            For i As Int32 = 0 To (GridViewMunicipioSector.Rows.Count - 1)
                'GridViewMunicipioSector.FooterRow.Cells(2).Text = Convert.ToDouble(GridViewMunicipioSector.Rows(i).Cells(2).Text.Replace(",", "")) + Convert.ToDouble(GridViewMunicipioSector.FooterRow.Cells(2).Text.Replace(",", ""))
                GridViewMunicipioSector.FooterRow.Cells(3).Text = Convert.ToDouble(CType(GridViewMunicipioSector.Rows(i).Cells(3).FindControl("HyperLink1"), HyperLink).Text.Replace(",", "")) + Convert.ToDouble(GridViewMunicipioSector.FooterRow.Cells(3).Text.Replace(",", ""))
                GridViewMunicipioSector.FooterRow.Cells(4).Text = Convert.ToDouble(GridViewMunicipioSector.Rows(i).Cells(4).Text.Replace(",", "").Replace("$", "")) + Convert.ToDouble(GridViewMunicipioSector.FooterRow.Cells(4).Text.Replace(",", "").Replace("$", ""))

            Next
            'GridViewMunicipioSector.FooterRow.Cells(2).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewMunicipioSector.FooterRow.Cells(2).Text)) + "</strong>"
            GridViewMunicipioSector.FooterRow.Cells(3).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:N0}", Convert.ToDouble(GridViewMunicipioSector.FooterRow.Cells(3).Text)) + "</strong>"
            GridViewMunicipioSector.FooterRow.Cells(4).Text = "<strong>" + String.Format(New CultureInfo("es-MX"), "{0:C}", Convert.ToDouble(GridViewMunicipioSector.FooterRow.Cells(4).Text)) + "</strong>"
            GridViewMunicipioSector.Caption = "<strong>POR MUNICIPIO / SECTOR<hr/>PATRONES: " & GridViewMunicipioSector.FooterRow.Cells(3).Text & ", IMPORTE: " & GridViewMunicipioSector.FooterRow.Cells(4).Text & "</strong>"
        Catch ex As Exception

        End Try
    End Sub
End Class