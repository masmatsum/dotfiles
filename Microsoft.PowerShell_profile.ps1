echo "Load Microsoft.PowerShell_profile.ps1"

<#
Tabキー押下時の挙動を設定する（補完の挙動を変更できる）。
PowerShellのデフォルト（`TabCompleteNext`）では、入力キーにマッチするもの（候補）が複数ある状態でTabキーを押すと、
1個めの候補を表示する（さらにTabキーを押していくと2個めの候補、3個めの候補、と順番に表示していく）。

`Complete`にすると、bash同様の振る舞いになる
#>
# Set-PSReadlineKeyHandler -Key Tab -Function Complete

# mise
# (&mise activate pwsh) | Out-String | Invoke-Expression
