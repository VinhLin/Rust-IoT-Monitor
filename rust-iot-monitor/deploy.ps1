# build Rust project for Linux
$target = "x86_64-unknown-linux-musl"
$buildType = "debug"

Write-Host "⏳ Building project for $target..."
# cargo build --release --target $target
cargo build

if ($LASTEXITCODE -ne 0) {
    Write-Error "❌ Build failed. Exiting..."
    exit 1
}

# get binary name from Cargo.toml
$cargoToml = Get-Content "./Cargo.toml"
$packageName = ($cargoToml | Where-Object { $_ -match '^name\s*=\s*' }) -replace '^name\s*=\s*["'']', '' -replace '["'']', ''
$binaryPath = "target/$target/$buildType/$packageName"

# check if binary exists
if (-Not (Test-Path $binaryPath)) {
    Write-Error "❌ Binary not found: $binaryPath"
    exit 1
}

# define destination
$remoteIP = '172.16.10.212'
$remoteUser = 'thingsboard'
$remotePath = '/home/thingsboard'

Write-Host "🚀 Copying binary to ${remoteUser}@${remoteIP}:${remotePath}"
scp $binaryPath "${remoteUser}@${remoteIP}:${remotePath}"

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Deployment successful!"
} else {
    Write-Error "❌ Failed to copy binary to remote machine."
}
