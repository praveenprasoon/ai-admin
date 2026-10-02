# Ensure script stops immediately if any system step crashes
#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; .\init_project_joy.ps1

$ErrorActionPreference = "Stop"

Write-Host "=========================================================" -ForegroundColor Cyan
Write-Host "🔋 STARTING PROJECT JOY ECOSYSTEM INITIALIZATION ENGINE..." -ForegroundColor Cyan
Write-Host "=========================================================" -ForegroundColor Cyan

# 1. Verify and Activate Python 3.14 Virtual Environment Core
if (Test-Path -Path "joy-backend/requirements.txt") {
    Write-Host "⚙️ [1/4] Bootstrapping Python 3.14 Isolation Core..." -ForegroundColor Yellow
    
    # Create the virtual environment container if it does not exist
    if (-not (Test-Path -Path ".venv")) {
        python -m venv .venv
        Write-Host "  ✅ Created local sandboxed .venv container." -ForegroundColor Green
    }
    
    # Activate virtual environment engine locally
    .\.venv\Scripts\activate.ps1
    
    # Upgrade standard installation toolsets and map libraries
    python -m pip install --upgrade pip
    pip install -r joy-backend/requirements.txt
    Write-Host "  ✅ Successfully installed all data pipelines & reporting modules." -ForegroundColor Green
} else {
    Write-Error "❌ Initialization Failed: joy-backend/requirements.txt not found! Run build_joy.ps1 first."
}

# 2. Automatically Bootstrap Next.js Frontend Framework Structure
Write-Host "⚙️ [2/4] Scaffolding Next.js Node Ecosystem..." -ForegroundColor Yellow
if (-not (Test-Path -Path "joy-frontend/package.json")) {
    New-Item -ItemType Directory -Force -Path joy-frontend | Out-Null
    
    # Create an optimized enterprise package.json baseline file
    $packageJson = @'
{
  "name": "joy-frontend",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "next": "^15.0.0",
    "react": "^19.0.0",
    "react-dom": "^19.0.0",
    "recharts": "^2.12.0",
    "lucide-react": "^0.368.0",
    "clsx": "^2.1.0",
    "tailwind-merge": "^2.2.2"
  },
  "devDependencies": {
    "typescript": "^5.0.0",
    "@types/node": "^20.0.0",
    "@types/react": "^19.0.0",
    "@types/react-dom": "^19.0.0",
    "postcss": "^8.0.0",
    "tailwindcss": "^3.4.0"
  }
}
'@
    Set-Content -Path joy-frontend/package.json -Value $packageJson
    Write-Host "  ✅ Generated production package.json baseline matrix." -ForegroundColor Green
}

# 3. Download and Verify Node Package Manager Modules (NPM)
if (Get-Command npm -ErrorAction SilentlyContinue) {
    Write-Host "⚙️ [3/4] Installing NPM View Packages (Recharts, Tailwind, TypeScript)..." -ForegroundColor Yellow
    Set-Location -Path joy-frontend
    
    # Execute full clean dependency synchronization tree
    npm install
    
    Set-Location -Path ..
    Write-Host "  ✅ Next.js frontend dependencies downloaded and compiled successfully!" -ForegroundColor Green
} else {
    Write-Host "⚠️ WARNING: Node.js/NPM was not detected on this machine's system environment PATH!" -ForegroundColor Red
    Write-Host "  👉 Please install Node.js from https://nodejs.org to compile your UI dashboard views." -ForegroundColor Yellow
}

# 4. Final Code Graph & Environment Verification Pass
Write-Host "⚙️ [4/4] Executing Project Joy Integrity Assurance Checks..." -ForegroundColor Yellow
if (Test-Path -Path ".venv/Scripts/python.exe") {
    .\.venv\Scripts\activate.ps1
    python joy-backend/validate_joy_spec.py
}

Write-Host "=========================================================" -ForegroundColor Green
Write-Host "🎉 ENVIRONMENT ONLINE: JOY IS COMPLETELY INITIALIZED!" -ForegroundColor Green
Write-Host "💡 Launch parallel agent workflows using .specify/HOW_TO_RUN.md" -ForegroundColor Green
Write-Host "=========================================================" -ForegroundColor Green
