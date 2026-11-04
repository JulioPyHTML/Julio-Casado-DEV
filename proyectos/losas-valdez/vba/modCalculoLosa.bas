Attribute VB_Name = "modCalculoLosa"
Option Explicit

' Funciones iniciales para el prototipo Losas Valdez.
' La tasa de ITBIS se recibe como parámetro para evitar fijarla en el código.

Public Function CalcularSubtotal(ByVal areaM2 As Double, _
                                 ByVal costoPorM2 As Double) As Currency
    If areaM2 <= 0 Or costoPorM2 < 0 Then
        CalcularSubtotal = 0
        Exit Function
    End If

    CalcularSubtotal = CCur(areaM2 * costoPorM2)
End Function

Public Function CalcularMontoITBIS(ByVal subtotal As Currency, _
                                   ByVal tasaITBIS As Double) As Currency
    If subtotal < 0 Or tasaITBIS < 0 Or tasaITBIS > 1 Then
        CalcularMontoITBIS = 0
        Exit Function
    End If

    CalcularMontoITBIS = CCur(subtotal * tasaITBIS)
End Function

Public Function CalcularTotalConITBIS(ByVal areaM2 As Double, _
                                      ByVal costoPorM2 As Double, _
                                      ByVal tasaITBIS As Double) As Currency
    Dim subtotal As Currency
    Dim impuesto As Currency

    subtotal = CalcularSubtotal(areaM2, costoPorM2)
    impuesto = CalcularMontoITBIS(subtotal, tasaITBIS)

    CalcularTotalConITBIS = subtotal + impuesto
End Function
