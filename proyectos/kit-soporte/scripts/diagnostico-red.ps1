[CmdletBinding()]
param(
    [string]$OutputPath = (Join-Path $PSScriptRoot ("diagnostico-red-{0}.txt" -f (Get-Date -Format "yyyyMMdd-HHmmss")))
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Continue"

function Add-ReportSection {
    param(
        [Parameter(Mandatory = $true)][string]$Title,
        [Parameter(Mandatory = $true)][scriptblock]$Command
    )

    Add-Content -LiteralPath $OutputPath -Value ("===== {0} =====" -f $Title) -Encoding UTF8

    try {
        $result = (& $Command 2>&1 | Out-String -Width 180)
        if ([string]::IsNullOrWhiteSpace($result)) {
            $result = "Sin datos disponibles."
        }
        Add-Content -LiteralPath $OutputPath -Value $result -Encoding UTF8
    }
    catch {
        Add-Content -LiteralPath $OutputPath -Value ("No se pudo completar esta sección: {0}" -f $_.Exception.Message) -Encoding UTF8
    }
}

try {
    $parent = Split-Path -Parent $OutputPath
    if (-not [string]::IsNullOrWhiteSpace($parent) -and -not (Test-Path -LiteralPath $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }

    $header = "Informe local de diagnóstico de red" + [Environment]::NewLine + ("Generado: {0}" -f (Get-Date))
    Set-Content -LiteralPath $OutputPath -Value $header -Encoding UTF8

    Add-ReportSection -Title "Adaptadores de red" -Command {
        Get-NetAdapter | Sort-Object Status, Name | Format-Table Name, InterfaceDescription, Status, LinkSpeed -AutoSize
    }

    Add-ReportSection -Title "Configuración IP y DNS" -Command {
        Get-NetIPConfiguration | Format-List InterfaceAlias, IPv4Address, IPv4DefaultGateway, DNSServer
    }

    Add-ReportSection -Title "Prueba de puerta de enlace" -Command {
        $gateways = Get-NetIPConfiguration |
            Where-Object { $_.IPv4DefaultGateway -and $_.IPv4DefaultGateway.NextHop }

        if (-not $gateways) {
            "No se encontró una puerta de enlace IPv4."
        }
        else {
            foreach ($configuration in $gateways) {
                $gateway = $configuration.IPv4DefaultGateway.NextHop
                $reachable = Test-Connection -ComputerName $gateway -Count 2 -Quiet -ErrorAction SilentlyContinue
                "{0}: {1}" -f $gateway, $(if ($reachable) { "responde" } else { "sin respuesta" })
            }
        }
    }

    Add-ReportSection -Title "Resolución DNS" -Command {
        Resolve-DnsName -Name "example.com" -ErrorAction Stop |
            Select-Object Name, Type, IPAddress |
            Format-Table -AutoSize
    }

    Write-Host ("Informe guardado en: {0}" -f $OutputPath) -ForegroundColor Green
}
catch {
    Write-Error ("No se pudo generar el informe: {0}" -f $_.Exception.Message)
    exit 1
}
