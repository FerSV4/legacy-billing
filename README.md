# Legacy Billing 

## Descripción

Este proyecto corresponde al laboratorio práctico de Computación en la Nube utilizando:

- AWS Academy Learner Lab
- Terraform
- GitHub Actions
- CI/CD
- Infraestructura como Código (IaC)

La aplicación Node.js fue desplegada automáticamente en AWS EC2 mediante Terraform y pipelines de GitHub Actions.

---

# Arquitectura Implementada

## CI Pipeline

Se implementó un pipeline de Integración Continua utilizando GitHub Actions en la rama `develop`.

El pipeline realiza automáticamente:

- Checkout del repositorio
- Configuración de Node.js 20
- Instalación de dependencias
- Ejecución de pruebas automáticas (`npm test`)

---

## CD Pipeline

Se implementó un pipeline de Despliegue Continuo en la rama `main`.

El pipeline ejecuta automáticamente:

- terraform init
- terraform plan
- terraform apply

usando credenciales temporales de AWS Academy almacenadas como GitHub Secrets.

---

# Infraestructura Terraform

La infraestructura fue organizada de forma modular:

```text
terraform/
├── modules/network
└── modules/compute
```

## Módulo network
- Security Group
- Restricción de acceso mediante IP pública `/32`

## Módulo compute
- Instancia EC2 Amazon Linux 2023
- user_data automatizado
- Despliegue automático de la aplicación Node.js

---

# Backend Remoto

Terraform utiliza backend remoto S3 para almacenar el estado:

- Región: us-east-1
- Bucket S3 configurado manualmente

---

# Aplicación Desplegada

URL de validación:

```text
http://32.199.136.173:3000
```

---

# Tecnologías Utilizadas

- Terraform >= 1.6
- AWS EC2
- AWS S3
- GitHub Actions
- Node.js 20
- Amazon Linux 2023