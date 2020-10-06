Public Class detallePAtronalAll
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            Try
                HiddenField1.Value = Request.QueryString("patron").Replace("-", "")

                SqlDataSourceCuotas.SelectCommand = SqlDataSourceCuotas.SelectCommand.Replace("3301ACOP101012", Request.QueryString("ralex"))
                SqlDataSourceCuotasMultas.SelectCommand = SqlDataSourceCuotasMultas.SelectCommand.Replace("3301ACOP101012", Request.QueryString("ralex"))
                SqlDataSourceSivep.SelectCommand = SqlDataSourceSivep.SelectCommand.Replace("3301ACOP101012", Request.QueryString("ralex"))
                SqlDataSourceMultSiv.SelectCommand = SqlDataSourceMultSiv.SelectCommand.Replace("3301ACOP101012", Request.QueryString("ralex"))

                SqlDataSourceCuotasRCV.SelectCommand = SqlDataSourceCuotasRCV.SelectCommand.Replace("3301ARCV101012", Request.QueryString("ralex").Replace("COP", "RCV"))
                SqlDataSourceMultRCV.SelectCommand = SqlDataSourceMultRCV.SelectCommand.Replace("3301ACOP101012", Request.QueryString("ralex"))
                SqlDataSourceSIVRCV.SelectCommand = SqlDataSourceSIVRCV.SelectCommand.Replace("3301ARCV101012", Request.QueryString("ralex").Replace("COP", "RCV"))

                SqlDataSourceCOPTOTAL.SelectCommand = SqlDataSourceCOPTOTAL.SelectCommand.Replace("3301ACOP101012", Request.QueryString("ralex"))
                SqlDataSourceCOPTOTAL.SelectCommand = SqlDataSourceCOPTOTAL.SelectCommand.Replace("3301ARCV101012", Request.QueryString("ralex").Replace("COP", "RCV"))


                GridView1.DataBind()
                GridViewCuotas.DataBind()
                GridViewCuotas0.DataBind()
                GridViewCuotas1.DataBind()
                GridViewCuotas2.DataBind()
                GridViewMultas.DataBind()
                GridViewCuotasSivepas.DataBind()
                GWMulSive.DataBind()
                GWMulSive0.DataBind()
            Catch ex As Exception

            End Try

        End If
    End Sub
End Class