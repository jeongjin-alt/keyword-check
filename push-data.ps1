# dashboard-data.json 복사 후 GitHub push
param()

$src  = "C:\Users\wjdwl\Desktop\dashboard-data.json"
$dest = "C:\Users\wjdwl\blacklabel-dashboard\dashboard-data.json"
$repo = "C:\Users\wjdwl\blacklabel-dashboard"

# 파일 복사
Copy-Item $src $dest -Force

# git push
Set-Location $repo
git add dashboard-data.json

# dashboard-data.json 이 실제로 변경됐는지 확인
$staged = git diff --cached --name-only
if ($staged -match "dashboard-data.json") {
    $ts = Get-Date -Format "yyyy-MM-dd HH:mm"
    git commit -m "update rankings $ts"
    git push
    Write-Output "GitHub push 완료: $ts"
} else {
    Write-Output "변경 없음 - push 스킵"
}
