Imports System.IO
Imports System.Data.OleDb

Public Class registroaltasbajas
    Inherits System.Web.UI.Page
    Dim cadenaconexion As String = ConfigurationManager.ConnectionStrings("ConnectionStringMaster").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("SIRECAuser") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            If Not (Session.Item("SIRECAcredencial").ToString.Equals("admin") And Session.Item("SIRECAchmod7").ToString.Equals("x")) Then
                Server.Transfer("~/accesoDenegado.aspx")
            End If
        End If
    End Sub

    Protected Sub IBUsuarios_Load(ByVal sender As Object, ByVal e As EventArgs)
        If File.Exists(Server.MapPath("~/imagenes/usuarios/avatar/" & ListBoxUsuarios.SelectedValue & ".jpg")) Then
            CType(FormView1.FindControl("IBUsuarios"), ImageButton).ImageUrl = "~/imagenes/usuarios/avatar/" & ListBoxUsuarios.SelectedValue & ".jpg"
        Else
            CType(FormView1.FindControl("IBUsuarios"), ImageButton).ImageUrl = "~/imagenes/usuarios/avatar/usuarioSireca.jpg"
        End If
    End Sub

    Protected Sub DDLRol_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        If CType(sender, DropDownList).SelectedIndex = 0 Then
            setPersonalizado()
        ElseIf CType(sender, DropDownList).SelectedIndex = 1 Then
            setBaja()
        ElseIf CType(sender, DropDownList).SelectedIndex = 2 Then
            setJefes()
        ElseIf CType(sender, DropDownList).SelectedIndex = 3 Then
            setSupervisorC1()
        ElseIf CType(sender, DropDownList).SelectedIndex = 4 Then
            setSupervisorC2()
        ElseIf CType(sender, DropDownList).SelectedIndex = 5 Then
            setSupervisorC3()
        ElseIf CType(sender, DropDownList).SelectedIndex = 6 Then
            setInspectorA()
        ElseIf CType(sender, DropDownList).SelectedIndex = 7 Then
            setInspectorB()
        ElseIf CType(sender, DropDownList).SelectedIndex = 8 Then
            setIntegrador()
        ElseIf CType(sender, DropDownList).SelectedIndex = 9 Then
        End If
        'CType(FormView1.FindControl("us_usertype"), DropDownList).Enabled = False
    End Sub
    Protected Sub setPersonalizado()
        CType(FormView1.FindControl("us_usertype"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_del"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_subdel"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_accesoC1"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC2"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC3"), CheckBox).Enabled = True

        CType(FormView1.FindControl("us_asigC1"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_asigC2"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_asigC3"), CheckBox).Enabled = False

        CType(FormView1.FindControl("us_integrador"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_pagdirigir"), DropDownList).Enabled = True

        CType(FormView1.FindControl("cargaRale"), CheckBox).Enabled = True
        CType(FormView1.FindControl("descargaRale"), CheckBox).Enabled = True

        CType(FormView1.FindControl("cargaLgp"), CheckBox).Enabled = True
        CType(FormView1.FindControl("descargaLgp"), CheckBox).Enabled = True

        CType(FormView1.FindControl("cargaProcesar"), CheckBox).Enabled = True
        CType(FormView1.FindControl("descargaProcesar"), CheckBox).Enabled = True

        CType(FormView1.FindControl("us_alertas"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_printdoc"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_observaciones"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_acceso"), DropDownList).Enabled = True
    End Sub
    Protected Sub setBaja()
        CType(FormView1.FindControl("us_usertype"), DropDownList).Enabled = False

        CType(FormView1.FindControl("us_del"), DropDownList).Enabled = False

        CType(FormView1.FindControl("us_subdel"), DropDownList).Enabled = False

        CType(FormView1.FindControl("us_accesoC1"), CheckBox).Enabled = False
        CType(FormView1.FindControl("us_accesoC2"), CheckBox).Enabled = False
        CType(FormView1.FindControl("us_accesoC3"), CheckBox).Enabled = False

        CType(FormView1.FindControl("us_asigC1"), CheckBox).Enabled = False
        CType(FormView1.FindControl("us_asigC2"), CheckBox).Enabled = False
        CType(FormView1.FindControl("us_asigC3"), CheckBox).Enabled = False

        CType(FormView1.FindControl("us_integrador"), DropDownList).Enabled = False

        CType(FormView1.FindControl("us_pagdirigir"), DropDownList).Enabled = False

        CType(FormView1.FindControl("cargaRale"), CheckBox).Enabled = False
        CType(FormView1.FindControl("descargaRale"), CheckBox).Enabled = False

        CType(FormView1.FindControl("cargaLgp"), CheckBox).Enabled = False
        CType(FormView1.FindControl("descargaLgp"), CheckBox).Enabled = False

        CType(FormView1.FindControl("cargaProcesar"), CheckBox).Enabled = False
        CType(FormView1.FindControl("descargaProcesar"), CheckBox).Enabled = False

        CType(FormView1.FindControl("us_alertas"), DropDownList).Enabled = False

        CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).Enabled = False

        CType(FormView1.FindControl("us_printdoc"), DropDownList).Enabled = False

        CType(FormView1.FindControl("us_observaciones"), DropDownList).Enabled = False

        CType(FormView1.FindControl("us_acceso"), DropDownList).SelectedValue = "0"
        CType(FormView1.FindControl("us_acceso"), DropDownList).Enabled = False
    End Sub
    Protected Sub setJefes()
        Dim valorx As String = IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("0"), "0", IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("1"), "1", IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("9"), "9", "-")))
        CType(FormView1.FindControl("us_usertype"), DropDownList).SelectedValue = valorx

        CType(FormView1.FindControl("us_del"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_subdel"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_accesoC1"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC2"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC3"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC1"), CheckBox).Checked = True 'ciclo 1
        CType(FormView1.FindControl("us_accesoC2"), CheckBox).Checked = True  'ciclo 2
        CType(FormView1.FindControl("us_accesoC3"), CheckBox).Checked = True  'ciclo 3

        CType(FormView1.FindControl("us_asigC1"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_asigC2"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_asigC3"), CheckBox).Enabled = False

        CType(FormView1.FindControl("us_integrador"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_integrador"), DropDownList).SelectedValue = "4" 'ciclo 3

        CType(FormView1.FindControl("us_pagdirigir"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_pagdirigir"), DropDownList).SelectedValue = "p" 'pagina a direccionar despues del login

        CType(FormView1.FindControl("cargaRale"), CheckBox).Checked = True
        CType(FormView1.FindControl("descargaRale"), CheckBox).Checked = True
        CType(FormView1.FindControl("cargaRale"), CheckBox).Enabled = True
        CType(FormView1.FindControl("descargaRale"), CheckBox).Enabled = True

        CType(FormView1.FindControl("cargaLgp"), CheckBox).Checked = True
        CType(FormView1.FindControl("descargaLgp"), CheckBox).Checked = True
        CType(FormView1.FindControl("cargaLgp"), CheckBox).Enabled = True
        CType(FormView1.FindControl("descargaLgp"), CheckBox).Enabled = True

        CType(FormView1.FindControl("cargaProcesar"), CheckBox).Checked = True
        CType(FormView1.FindControl("descargaProcesar"), CheckBox).Checked = True
        CType(FormView1.FindControl("cargaProcesar"), CheckBox).Enabled = True
        CType(FormView1.FindControl("descargaProcesar"), CheckBox).Enabled = True

        CType(FormView1.FindControl("us_alertas"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_alertas"), DropDownList).SelectedValue = "1"

        CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).SelectedValue = "0"
        CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_printdoc"), DropDownList).SelectedValue = "0"
        CType(FormView1.FindControl("us_printdoc"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_observaciones"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_observaciones"), DropDownList).SelectedValue = "2"

        CType(FormView1.FindControl("us_acceso"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_acceso"), DropDownList).SelectedValue = "x"
    End Sub
    Protected Sub setSupervisorC1()
        Dim valorx As String = IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("0"), "0", IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("1"), "1", IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("9"), "9", "-")))
        CType(FormView1.FindControl("us_usertype"), DropDownList).SelectedValue = valorx

        CType(FormView1.FindControl("us_del"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_subdel"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_accesoC1"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC2"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC3"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC1"), CheckBox).Checked = True 'ciclo 1
        CType(FormView1.FindControl("us_accesoC2"), CheckBox).Checked = False 'ciclo 2
        CType(FormView1.FindControl("us_accesoC3"), CheckBox).Checked = False 'ciclo 3

        CType(FormView1.FindControl("us_asigC1"), CheckBox).Checked = True 'ciclo 1
        CType(FormView1.FindControl("us_asigC2"), CheckBox).Checked = False  'ciclo 2
        CType(FormView1.FindControl("us_asigC3"), CheckBox).Checked = False  'ciclo 3        
        CType(FormView1.FindControl("us_asigC1"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_asigC2"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_asigC3"), CheckBox).Enabled = False

        CType(FormView1.FindControl("us_integrador"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_integrador"), DropDownList).SelectedValue = "0" 'ciclo 3

        CType(FormView1.FindControl("us_pagdirigir"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_pagdirigir"), DropDownList).SelectedValue = "1" 'pagina a direccionar despues del login

        CType(FormView1.FindControl("cargaRale"), CheckBox).Checked = True
        CType(FormView1.FindControl("descargaRale"), CheckBox).Checked = True
        CType(FormView1.FindControl("cargaRale"), CheckBox).Enabled = True
        CType(FormView1.FindControl("descargaRale"), CheckBox).Enabled = True

        CType(FormView1.FindControl("cargaLgp"), CheckBox).Checked = True
        CType(FormView1.FindControl("descargaLgp"), CheckBox).Checked = True
        CType(FormView1.FindControl("cargaLgp"), CheckBox).Enabled = True
        CType(FormView1.FindControl("descargaLgp"), CheckBox).Enabled = True

        CType(FormView1.FindControl("cargaProcesar"), CheckBox).Checked = True
        CType(FormView1.FindControl("descargaProcesar"), CheckBox).Checked = True
        CType(FormView1.FindControl("cargaProcesar"), CheckBox).Enabled = True
        CType(FormView1.FindControl("descargaProcesar"), CheckBox).Enabled = True

        CType(FormView1.FindControl("us_alertas"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_alertas"), DropDownList).SelectedValue = "1"

        CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).SelectedValue = "0"
        CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_printdoc"), DropDownList).SelectedValue = "0"
        CType(FormView1.FindControl("us_printdoc"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_observaciones"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_observaciones"), DropDownList).SelectedValue = "2"

        CType(FormView1.FindControl("us_acceso"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_acceso"), DropDownList).SelectedValue = "x"
    End Sub
    Protected Sub setSupervisorC2()
        Dim valorx As String = IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("0"), "0", IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("1"), "1", IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("9"), "9", "-")))
        CType(FormView1.FindControl("us_usertype"), DropDownList).SelectedValue = valorx

        CType(FormView1.FindControl("us_del"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_subdel"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_accesoC1"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC2"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC3"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC1"), CheckBox).Checked = False  'ciclo 1
        CType(FormView1.FindControl("us_accesoC2"), CheckBox).Checked = True  'ciclo 2
        CType(FormView1.FindControl("us_accesoC3"), CheckBox).Checked = False 'ciclo 3

        CType(FormView1.FindControl("us_asigC1"), CheckBox).Checked = False  'ciclo 1
        CType(FormView1.FindControl("us_asigC2"), CheckBox).Checked = True 'ciclo 2
        CType(FormView1.FindControl("us_asigC3"), CheckBox).Checked = False  'ciclo 3
        CType(FormView1.FindControl("us_asigC1"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_asigC2"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_asigC3"), CheckBox).Enabled = False

        CType(FormView1.FindControl("us_integrador"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_integrador"), DropDownList).SelectedValue = "0" 'ciclo 3

        CType(FormView1.FindControl("us_pagdirigir"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_pagdirigir"), DropDownList).SelectedValue = "2" 'pagina a direccionar despues del login

        CType(FormView1.FindControl("cargaRale"), CheckBox).Checked = True
        CType(FormView1.FindControl("descargaRale"), CheckBox).Checked = True
        CType(FormView1.FindControl("cargaRale"), CheckBox).Enabled = True
        CType(FormView1.FindControl("descargaRale"), CheckBox).Enabled = True

        CType(FormView1.FindControl("cargaLgp"), CheckBox).Checked = True
        CType(FormView1.FindControl("descargaLgp"), CheckBox).Checked = True
        CType(FormView1.FindControl("cargaLgp"), CheckBox).Enabled = True
        CType(FormView1.FindControl("descargaLgp"), CheckBox).Enabled = True

        CType(FormView1.FindControl("cargaProcesar"), CheckBox).Checked = True
        CType(FormView1.FindControl("descargaProcesar"), CheckBox).Checked = True
        CType(FormView1.FindControl("cargaProcesar"), CheckBox).Enabled = True
        CType(FormView1.FindControl("descargaProcesar"), CheckBox).Enabled = True

        CType(FormView1.FindControl("us_alertas"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_alertas"), DropDownList).SelectedValue = "1"

        CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).SelectedValue = "0"
        CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_printdoc"), DropDownList).SelectedValue = "0"
        CType(FormView1.FindControl("us_printdoc"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_observaciones"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_observaciones"), DropDownList).SelectedValue = "2"

        CType(FormView1.FindControl("us_acceso"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_acceso"), DropDownList).SelectedValue = "x"
    End Sub
    Protected Sub setSupervisorC3()
        Dim valorx As String = IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("0"), "0", IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("1"), "1", IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("9"), "9", "-")))
        CType(FormView1.FindControl("us_usertype"), DropDownList).SelectedValue = valorx

        CType(FormView1.FindControl("us_del"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_subdel"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_accesoC1"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC2"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC3"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC1"), CheckBox).Checked = False  'ciclo 1
        CType(FormView1.FindControl("us_accesoC2"), CheckBox).Checked = False 'ciclo 2
        CType(FormView1.FindControl("us_accesoC3"), CheckBox).Checked = True  'ciclo 3

        CType(FormView1.FindControl("us_asigC1"), CheckBox).Checked = False  'ciclo 1
        CType(FormView1.FindControl("us_asigC2"), CheckBox).Checked = False  'ciclo 2
        CType(FormView1.FindControl("us_asigC3"), CheckBox).Checked = True 'ciclo 3        
        CType(FormView1.FindControl("us_asigC1"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_asigC2"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_asigC3"), CheckBox).Enabled = False

        CType(FormView1.FindControl("us_integrador"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_integrador"), DropDownList).SelectedValue = "3" 'ciclo 3

        CType(FormView1.FindControl("us_pagdirigir"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_pagdirigir"), DropDownList).SelectedValue = "3" 'pagina a direccionar despues del login

        CType(FormView1.FindControl("cargaRale"), CheckBox).Checked = True
        CType(FormView1.FindControl("descargaRale"), CheckBox).Checked = True
        CType(FormView1.FindControl("cargaRale"), CheckBox).Enabled = True
        CType(FormView1.FindControl("descargaRale"), CheckBox).Enabled = True

        CType(FormView1.FindControl("cargaLgp"), CheckBox).Checked = True
        CType(FormView1.FindControl("descargaLgp"), CheckBox).Checked = True
        CType(FormView1.FindControl("cargaLgp"), CheckBox).Enabled = True
        CType(FormView1.FindControl("descargaLgp"), CheckBox).Enabled = True

        CType(FormView1.FindControl("cargaProcesar"), CheckBox).Checked = True
        CType(FormView1.FindControl("descargaProcesar"), CheckBox).Checked = True
        CType(FormView1.FindControl("cargaProcesar"), CheckBox).Enabled = True
        CType(FormView1.FindControl("descargaProcesar"), CheckBox).Enabled = True

        CType(FormView1.FindControl("us_alertas"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_alertas"), DropDownList).SelectedValue = "1"

        CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).SelectedValue = "0"
        CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_printdoc"), DropDownList).SelectedValue = "0"
        CType(FormView1.FindControl("us_printdoc"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_observaciones"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_observaciones"), DropDownList).SelectedValue = "2"

        CType(FormView1.FindControl("us_acceso"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_acceso"), DropDownList).SelectedValue = "x"
    End Sub
    Protected Sub setInspectorA()
        Dim valorx As String = IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("0"), "0", IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("1"), "1", IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("9"), "9", "-")))
        CType(FormView1.FindControl("us_usertype"), DropDownList).SelectedValue = valorx

        CType(FormView1.FindControl("us_del"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_subdel"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_accesoC1"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC2"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC3"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC1"), CheckBox).Checked = True 'ciclo 1
        CType(FormView1.FindControl("us_accesoC2"), CheckBox).Checked = False 'ciclo 2
        CType(FormView1.FindControl("us_accesoC3"), CheckBox).Checked = False 'ciclo 3

        CType(FormView1.FindControl("us_asigC1"), CheckBox).Checked = False  'ciclo 1
        CType(FormView1.FindControl("us_asigC2"), CheckBox).Checked = False  'ciclo 2
        CType(FormView1.FindControl("us_asigC3"), CheckBox).Checked = False  'ciclo 3        
        CType(FormView1.FindControl("us_asigC1"), CheckBox).Enabled = False
        CType(FormView1.FindControl("us_asigC2"), CheckBox).Enabled = False
        CType(FormView1.FindControl("us_asigC3"), CheckBox).Enabled = False

        CType(FormView1.FindControl("us_integrador"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_integrador"), DropDownList).SelectedValue = "0" 'ciclo 3

        CType(FormView1.FindControl("us_pagdirigir"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_pagdirigir"), DropDownList).SelectedValue = "1" 'pagina a direccionar despues del login

        CType(FormView1.FindControl("cargaRale"), CheckBox).Checked = False
        CType(FormView1.FindControl("descargaRale"), CheckBox).Checked = False
        CType(FormView1.FindControl("cargaRale"), CheckBox).Enabled = False
        CType(FormView1.FindControl("descargaRale"), CheckBox).Enabled = False

        CType(FormView1.FindControl("cargaLgp"), CheckBox).Checked = False
        CType(FormView1.FindControl("descargaLgp"), CheckBox).Checked = False
        CType(FormView1.FindControl("cargaLgp"), CheckBox).Enabled = False
        CType(FormView1.FindControl("descargaLgp"), CheckBox).Enabled = False

        CType(FormView1.FindControl("cargaProcesar"), CheckBox).Checked = False
        CType(FormView1.FindControl("descargaProcesar"), CheckBox).Checked = False
        CType(FormView1.FindControl("cargaProcesar"), CheckBox).Enabled = False
        CType(FormView1.FindControl("descargaProcesar"), CheckBox).Enabled = False

        CType(FormView1.FindControl("us_alertas"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_alertas"), DropDownList).SelectedValue = "1"

        CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).SelectedValue = "0"
        CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).Enabled = False

        CType(FormView1.FindControl("us_printdoc"), DropDownList).SelectedValue = "0"
        CType(FormView1.FindControl("us_printdoc"), DropDownList).Enabled = False

        CType(FormView1.FindControl("us_observaciones"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_observaciones"), DropDownList).SelectedValue = "1"

        CType(FormView1.FindControl("us_acceso"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_acceso"), DropDownList).SelectedValue = "x"
    End Sub
    Protected Sub setInspectorB()
        Dim valorx As String = IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("0"), "0", IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("1"), "1", IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("9"), "9", "-")))
        CType(FormView1.FindControl("us_usertype"), DropDownList).SelectedValue = valorx

        CType(FormView1.FindControl("us_del"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_subdel"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_accesoC1"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC2"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC3"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC1"), CheckBox).Checked = False  'ciclo 1
        CType(FormView1.FindControl("us_accesoC2"), CheckBox).Checked = True  'ciclo 2
        CType(FormView1.FindControl("us_accesoC3"), CheckBox).Checked = False 'ciclo 3

        CType(FormView1.FindControl("us_asigC1"), CheckBox).Checked = False  'ciclo 1
        CType(FormView1.FindControl("us_asigC2"), CheckBox).Checked = False  'ciclo 2
        CType(FormView1.FindControl("us_asigC3"), CheckBox).Checked = False  'ciclo 3
        CType(FormView1.FindControl("us_asigC1"), CheckBox).Enabled = False
        CType(FormView1.FindControl("us_asigC2"), CheckBox).Enabled = False
        CType(FormView1.FindControl("us_asigC3"), CheckBox).Enabled = False

        CType(FormView1.FindControl("us_integrador"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_integrador"), DropDownList).SelectedValue = "0" 'ciclo 3

        CType(FormView1.FindControl("us_pagdirigir"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_pagdirigir"), DropDownList).SelectedValue = "2" 'pagina a direccionar despues del login

        CType(FormView1.FindControl("cargaRale"), CheckBox).Checked = False
        CType(FormView1.FindControl("descargaRale"), CheckBox).Checked = False
        CType(FormView1.FindControl("cargaRale"), CheckBox).Enabled = False
        CType(FormView1.FindControl("descargaRale"), CheckBox).Enabled = False

        CType(FormView1.FindControl("cargaLgp"), CheckBox).Checked = False
        CType(FormView1.FindControl("descargaLgp"), CheckBox).Checked = False
        CType(FormView1.FindControl("cargaLgp"), CheckBox).Enabled = False
        CType(FormView1.FindControl("descargaLgp"), CheckBox).Enabled = False

        CType(FormView1.FindControl("cargaProcesar"), CheckBox).Checked = False
        CType(FormView1.FindControl("descargaProcesar"), CheckBox).Checked = False
        CType(FormView1.FindControl("cargaProcesar"), CheckBox).Enabled = False
        CType(FormView1.FindControl("descargaProcesar"), CheckBox).Enabled = False

        CType(FormView1.FindControl("us_alertas"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_alertas"), DropDownList).SelectedValue = "1"

        CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).SelectedValue = "0"
        CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).Enabled = False

        CType(FormView1.FindControl("us_printdoc"), DropDownList).SelectedValue = "0"
        CType(FormView1.FindControl("us_printdoc"), DropDownList).Enabled = False

        CType(FormView1.FindControl("us_observaciones"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_observaciones"), DropDownList).SelectedValue = "1"

        CType(FormView1.FindControl("us_acceso"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_acceso"), DropDownList).SelectedValue = "x"
    End Sub
    Protected Sub setIntegrador()
        Dim valorx As String = IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("0"), "0", IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("1"), "1", IIf(CType(FormView1.FindControl("DDLRol"), DropDownList).SelectedValue.Contains("9"), "9", "-")))
        CType(FormView1.FindControl("us_usertype"), DropDownList).SelectedValue = valorx

        CType(FormView1.FindControl("us_del"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_subdel"), DropDownList).Enabled = True

        CType(FormView1.FindControl("us_accesoC1"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC2"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC3"), CheckBox).Enabled = True
        CType(FormView1.FindControl("us_accesoC1"), CheckBox).Checked = False  'ciclo 1
        CType(FormView1.FindControl("us_accesoC2"), CheckBox).Checked = False 'ciclo 2
        CType(FormView1.FindControl("us_accesoC3"), CheckBox).Checked = True  'ciclo 3

        CType(FormView1.FindControl("us_asigC1"), CheckBox).Checked = False  'ciclo 1
        CType(FormView1.FindControl("us_asigC2"), CheckBox).Checked = False  'ciclo 2
        CType(FormView1.FindControl("us_asigC3"), CheckBox).Checked = False  'ciclo 3
        CType(FormView1.FindControl("us_asigC1"), CheckBox).Enabled = False
        CType(FormView1.FindControl("us_asigC2"), CheckBox).Enabled = False
        CType(FormView1.FindControl("us_asigC3"), CheckBox).Enabled = False

        CType(FormView1.FindControl("us_integrador"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_integrador"), DropDownList).SelectedValue = "1" 'ciclo 3

        CType(FormView1.FindControl("us_pagdirigir"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_pagdirigir"), DropDownList).SelectedValue = "3" 'pagina a direccionar despues del login

        CType(FormView1.FindControl("cargaRale"), CheckBox).Checked = False
        CType(FormView1.FindControl("descargaRale"), CheckBox).Checked = False
        CType(FormView1.FindControl("cargaRale"), CheckBox).Enabled = False
        CType(FormView1.FindControl("descargaRale"), CheckBox).Enabled = False

        CType(FormView1.FindControl("cargaLgp"), CheckBox).Checked = False
        CType(FormView1.FindControl("descargaLgp"), CheckBox).Checked = False
        CType(FormView1.FindControl("cargaLgp"), CheckBox).Enabled = False
        CType(FormView1.FindControl("descargaLgp"), CheckBox).Enabled = False

        CType(FormView1.FindControl("cargaProcesar"), CheckBox).Checked = False
        CType(FormView1.FindControl("descargaProcesar"), CheckBox).Checked = False
        CType(FormView1.FindControl("cargaProcesar"), CheckBox).Enabled = False
        CType(FormView1.FindControl("descargaProcesar"), CheckBox).Enabled = False

        CType(FormView1.FindControl("us_alertas"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_alertas"), DropDownList).SelectedValue = "1"

        CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).SelectedValue = "0"
        CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).Enabled = False

        CType(FormView1.FindControl("us_printdoc"), DropDownList).SelectedValue = "0"
        CType(FormView1.FindControl("us_printdoc"), DropDownList).Enabled = False

        CType(FormView1.FindControl("us_observaciones"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_observaciones"), DropDownList).SelectedValue = "1"

        CType(FormView1.FindControl("us_acceso"), DropDownList).Enabled = True
        CType(FormView1.FindControl("us_acceso"), DropDownList).SelectedValue = "x"
    End Sub

    Protected Sub LBGPermisos_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim getusuariox As String = ListBoxUsuarios.SelectedValue
        If existeUsuario(getusuariox) Then
            actualizarUsuario(getusuariox)
        Else
            agregarUsuario(getusuariox)
        End If
    End Sub
    Protected Sub actualizarUsuario(ByVal usuariox As String)
        Try
            CType(FormView1.FindControl("LMsg"), Label).Text = ""
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = ""
            myInsertQuery22 = " UPDATE [sireca].[dbo].[usuarios] "
            myInsertQuery22 += " SET [del] = '" + CType(FormView1.FindControl("us_del"), DropDownList).SelectedValue + "'"
            myInsertQuery22 += " ,[subdel] = '" + CType(FormView1.FindControl("us_subdel"), DropDownList).SelectedValue + "'"
            myInsertQuery22 += " ,[user_type] = " + CType(FormView1.FindControl("us_usertype"), DropDownList).SelectedValue
            Dim vchmod As String = IIf(CType(FormView1.FindControl("us_accesoC1"), CheckBox).Checked, "x-", "0-") _
                                   & IIf(CType(FormView1.FindControl("us_accesoC2"), CheckBox).Checked, "x-", "0-") _
                                   & IIf(CType(FormView1.FindControl("us_accesoC3"), CheckBox).Checked, "x-", "0-") _
                                   & IIf(CType(FormView1.FindControl("us_asigC1"), CheckBox).Checked, "x-", "0-") _
                                   & IIf(CType(FormView1.FindControl("us_asigC2"), CheckBox).Checked, "x-", "0-") _
                                   & IIf(CType(FormView1.FindControl("us_asigC3"), CheckBox).Checked, "x-", "0-") _
                                   & IIf(CType(FormView1.FindControl("us_acceso"), DropDownList).SelectedValue.Equals("x"), "x-", "0-") _
                                   & IIf(CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).SelectedValue.Equals("l"), "l-", "0-") _
                                   & CType(FormView1.FindControl("us_pagdirigir"), DropDownList).SelectedValue
            myInsertQuery22 += " ,[chmod] = '" + vchmod + "'"
            Dim vchmod2 As String = IIf(CType(FormView1.FindControl("cargaRale"), CheckBox).Checked, "CR-", "0-") _
                                   & IIf(CType(FormView1.FindControl("descargaRale"), CheckBox).Checked, "DR-", "0-") _
                                   & IIf(CType(FormView1.FindControl("cargaLgp"), CheckBox).Checked, "CL-", "0-") _
                                   & IIf(CType(FormView1.FindControl("descargaLgp"), CheckBox).Checked, "DL-", "0-") _
                                   & IIf(CType(FormView1.FindControl("cargaProcesar"), CheckBox).Checked, "CP-", "0-") _
                                   & IIf(CType(FormView1.FindControl("descargaProcesar"), CheckBox).Checked, "DP-", "0-") _
                                   & "0-" _
                                   & "0-" _
                                   & "0"
            myInsertQuery22 += " ,[chmod2] = '" + vchmod2 + "' "
            myInsertQuery22 += " ,[alerta] = " + CType(FormView1.FindControl("us_alertas"), DropDownList).SelectedValue
            myInsertQuery22 += " ,[credencial] = '" + CType(FormView1.FindControl("us_credencialLabel"), TextBox).Text + "'"
            myInsertQuery22 += " ,[observacionPatronal] = " + CType(FormView1.FindControl("us_observaciones"), DropDownList).SelectedValue
            myInsertQuery22 += " ,[printPaeDoc] = " + CType(FormView1.FindControl("us_printdoc"), DropDownList).SelectedValue
            myInsertQuery22 += " ,[cargaebaema] = 0 "
            myInsertQuery22 += " ,[userIntegrador] = " + CType(FormView1.FindControl("us_integrador"), DropDownList).SelectedValue
            If CType(FormView1.FindControl("us_usertype"), DropDownList).SelectedValue.Equals("0") Then
                myInsertQuery22 += " ,[userPae2] = 0 "
            ElseIf CType(FormView1.FindControl("us_usertype"), DropDownList).SelectedValue.Equals("9") Then
                myInsertQuery22 += " ,[userPae2] = 1 "
            ElseIf CType(FormView1.FindControl("us_accesoC2"), CheckBox).Checked Then
                myInsertQuery22 += " ,[userPae2] = 1 "
            Else
                myInsertQuery22 += " ,[userPae2] = 0 "
            End If
            Dim vcorreoAuto As String = IIf(CType(FormView1.FindControl("us_correonl"), CheckBox).Checked, "NL-", "0-") _
                                   & IIf(CType(FormView1.FindControl("us_correoeedr"), CheckBox).Checked, "EEDR-", "0-") _
                                   & IIf(CType(FormView1.FindControl("us_correotramite"), CheckBox).Checked, "TRAMITE", "0")
            myInsertQuery22 += " ,[correoAuto] = '" + vcorreoAuto + "'"
            myInsertQuery22 += " WHERE [id]= " + usuariox
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            If cmd22.ExecuteNonQuery() > 0 Then
                CType(FormView1.FindControl("LMsg"), Label).Text = "Actualizado"
            Else
                CType(FormView1.FindControl("LMsg"), Label).Text = "Problemas al Actualizar los datos"
            End If
            con22.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
            CType(FormView1.FindControl("LMsg"), Label).Text = "Problemas al Actualizar"
        End Try
    End Sub
    Protected Sub agregarUsuario(ByVal usuariox As String)
        Try
            CType(FormView1.FindControl("LMsg"), Label).Text = ""
            Dim con22 As New OleDbConnection(cadenaconexion)
            Dim cmd22 As New OleDbCommand()
            cmd22.Connection = con22
            Dim myInsertQuery22 As String = " INSERT INTO [sireca] .[dbo] .[usuarios] "
            myInsertQuery22 += " ([id] "
            myInsertQuery22 += " ,[del] "
            myInsertQuery22 += " ,[subdel] "
            myInsertQuery22 += " ,[user_type] "
            myInsertQuery22 += " ,[chmod] "
            myInsertQuery22 += " ,[sectores] "
            myInsertQuery22 += " ,[totalFacturas] "
            myInsertQuery22 += " ,[chmod2] "
            myInsertQuery22 += " ,[alerta] "
            myInsertQuery22 += " ,[totalFacturasPae1] "
            myInsertQuery22 += " ,[userPae1] "
            myInsertQuery22 += " ,[userPae2] "
            myInsertQuery22 += " ,[userPae3] "
            myInsertQuery22 += " ,[totalFacturasPae2] "
            myInsertQuery22 += " ,[totalFacturasPae3] "
            myInsertQuery22 += " ,[sectoresPae2] "
            myInsertQuery22 += " ,[sectoresPae3] "
            myInsertQuery22 += " ,[credencial] "
            myInsertQuery22 += " ,[observacionPatronal] "
            myInsertQuery22 += " ,[printPaeDoc] "
            myInsertQuery22 += " ,[AdeudoZona] "
            myInsertQuery22 += " ,[baseNDRegistros] "
            myInsertQuery22 += " ,[cargaebaema] "
            myInsertQuery22 += " ,[userIntegrador],[correoAuto],[subir_doc],[ver_doc],[ind_desempenio],[datos_vehiculares] "
            myInsertQuery22 += " ,[emision_p1],[emision_p2],[printEmisionCitNot],[contprint]) "
            myInsertQuery22 += "  VALUES "
            myInsertQuery22 += " (" + usuariox + " "
            myInsertQuery22 += " ,'" + CType(FormView1.FindControl("us_del"), DropDownList).SelectedValue + "'"
            myInsertQuery22 += " ,'" + CType(FormView1.FindControl("us_subdel"), DropDownList).SelectedValue + "'"
            myInsertQuery22 += " ,'" + CType(FormView1.FindControl("us_usertype"), DropDownList).SelectedValue + "'"
            Dim vchmod As String = IIf(CType(FormView1.FindControl("us_accesoC1"), CheckBox).Checked, "x-", "0-") _
                                   & IIf(CType(FormView1.FindControl("us_accesoC2"), CheckBox).Checked, "x-", "0-") _
                                   & IIf(CType(FormView1.FindControl("us_accesoC3"), CheckBox).Checked, "x-", "0-") _
                                   & IIf(CType(FormView1.FindControl("us_asigC1"), CheckBox).Checked, "x-", "0-") _
                                   & IIf(CType(FormView1.FindControl("us_asigC2"), CheckBox).Checked, "x-", "0-") _
                                   & IIf(CType(FormView1.FindControl("us_asigC3"), CheckBox).Checked, "x-", "0-") _
                                   & IIf(CType(FormView1.FindControl("us_acceso"), DropDownList).SelectedValue.Equals("x"), "x-", "0-") _
                                   & IIf(CType(FormView1.FindControl("us_crearcopmpago"), DropDownList).SelectedValue.Equals("l"), "l-", "0-") _
                                   & CType(FormView1.FindControl("us_pagdirigir"), DropDownList).SelectedValue
            myInsertQuery22 += " ,'" + vchmod + "' "
            myInsertQuery22 += " ,0 "
            myInsertQuery22 += " ,0 "
            Dim vchmod2 As String = IIf(CType(FormView1.FindControl("cargaRale"), CheckBox).Checked, "CR-", "0-") _
                                   & IIf(CType(FormView1.FindControl("descargaRale"), CheckBox).Checked, "DR-", "0-") _
                                   & IIf(CType(FormView1.FindControl("cargaLgp"), CheckBox).Checked, "CL-", "0-") _
                                   & IIf(CType(FormView1.FindControl("descargaLgp"), CheckBox).Checked, "DL-", "0-") _
                                   & IIf(CType(FormView1.FindControl("cargaProcesar"), CheckBox).Checked, "CP-", "0-") _
                                   & IIf(CType(FormView1.FindControl("descargaProcesar"), CheckBox).Checked, "DP-", "0-") _
                                   & "0-" _
                                   & "0-" _
                                   & "0"
            myInsertQuery22 += " ,'" + vchmod2 + "'"
            myInsertQuery22 += " ," + CType(FormView1.FindControl("us_alertas"), DropDownList).SelectedValue
            myInsertQuery22 += " ,0 "
            myInsertQuery22 += " ,NULL "
            If CType(FormView1.FindControl("us_usertype"), DropDownList).SelectedValue.Equals("0") Then
                myInsertQuery22 += " ,0 "
            ElseIf CType(FormView1.FindControl("us_usertype"), DropDownList).SelectedValue.Equals("9") Then
                myInsertQuery22 += " ,1 "
            ElseIf CType(FormView1.FindControl("us_accesoC2"), CheckBox).Checked Then
                myInsertQuery22 += " ,1 "
            Else
                myInsertQuery22 += " ,0 "
            End If            
            myInsertQuery22 += " ,NULL "
            myInsertQuery22 += " ,0 "
            myInsertQuery22 += " ,0 "
            myInsertQuery22 += " ,NULL "
            myInsertQuery22 += " ,NULL "
            myInsertQuery22 += " ,'" + CType(FormView1.FindControl("us_credencialLabel"), TextBox).Text + "'"
            myInsertQuery22 += " ," + CType(FormView1.FindControl("us_observaciones"), DropDownList).SelectedValue
            myInsertQuery22 += " ," + CType(FormView1.FindControl("us_printdoc"), DropDownList).SelectedValue
            myInsertQuery22 += " ,NULL "
            myInsertQuery22 += " ,NULL "
            myInsertQuery22 += " ,0 "
            myInsertQuery22 += " ," + CType(FormView1.FindControl("us_integrador"), DropDownList).SelectedValue + " "
            Dim vcorreoAuto As String = IIf(CType(FormView1.FindControl("us_correonl"), CheckBox).Checked, "NL-", "0-") _
                       & IIf(CType(FormView1.FindControl("us_correoeedr"), CheckBox).Checked, "EEDR-", "0-") _
                       & IIf(CType(FormView1.FindControl("us_correotramite"), CheckBox).Checked, "TRAMITE", "0")
            myInsertQuery22 += " ,'" + vcorreoAuto + "',0,0,0,0,NULL,NULL,NULL,0) "
            cmd22.CommandText = myInsertQuery22
            con22.Open()
            If cmd22.ExecuteNonQuery() > 0 Then
                CType(FormView1.FindControl("LMsg"), Label).Text = "Registrado"
            Else
                CType(FormView1.FindControl("LMsg"), Label).Text = "Problemas al Registrar los datos"
            End If
            con22.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
            CType(FormView1.FindControl("LMsg"), Label).Text = "Problemas al Registrar"
        End Try
    End Sub
    Protected Function existeUsuario(ByVal usuariox As String) As Boolean
        Dim encontrado As Boolean = False
        Try
            Dim nwindConn2 As OleDbConnection = New OleDbConnection(cadenaconexion)
            Dim catCMD2 As OleDbCommand = nwindConn2.CreateCommand()
            Dim consulta As String = " SELECT [id] FROM [sireca].[dbo].[usuarios] WHERE [id]= " + usuariox
            catCMD2.CommandText = consulta
            nwindConn2.Open()
            Dim myReader2 As OleDbDataReader = catCMD2.ExecuteReader()
            Do While myReader2.Read()
                encontrado = True
                Exit Do
            Loop
            myReader2.Close()
            nwindConn2.Close()
        Catch ex As Exception
            'MsgBox(ex.StackTrace)
        End Try
        Return encontrado
    End Function

End Class