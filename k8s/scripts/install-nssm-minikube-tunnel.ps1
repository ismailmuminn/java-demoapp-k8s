# Minikube Tunnel NSSM servisini kurar
$nssmPath = "C:\tools\nssm.exe"
$serviceName = "MinikubeTunnel"
$minikubePath = "C:\minikube\minikube-windows-amd64.exe"

# NSSM ile servis kurulumu
& $nssmPath install $serviceName $minikubePath tunnel

# Servisi otomatik başlat ve çalıştır
& $nssmPath set $serviceName Start SERVICE_AUTO_START
Start-Service $serviceName
