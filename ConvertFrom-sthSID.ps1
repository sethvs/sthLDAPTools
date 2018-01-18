<#
.externalhelp sthLDAPTools.psm1-Help.xml
#>

function ConvertFrom-sthSID
{
    [CmdletBinding()]
    [OutputType([System.Byte])]
    Param(
        # SID in string form.
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [string[]]
        $SID
    )

    process
    {
        foreach ($s in $SID)
        {
            $SIDSplitted = $s -split '-' | Select-Object -Skip 1

            $Result = @()

            # Revision
            $Result += [byte]$SIDSplitted[0]

            # SubAuthorityCount
            $Result += [byte]$($SIDSplitted.Count - 2)

            # IdentifierAuthority
            for ($i = 0; $i -lt 5; $i++)
            {
                $Result += [byte]0
            }
            $Result += [byte]$SIDSplitted[1]

            # SubAuthority

            for ($i = 2; $i -lt $($SIDSplitted.Count); $i++)
            {
                $Result += [byte]$($SIDSplitted[$i] -band 255)
                $Result += [byte]$(($SIDSplitted[$i] -shr 8) -band 255)
                $Result += [byte]$(($SIDSplitted[$i] -shr 16) -band 255)
                $Result += [byte]$(($SIDSplitted[$i] -shr 24) -band 255)
            }

            $Result
        }
    }
}
