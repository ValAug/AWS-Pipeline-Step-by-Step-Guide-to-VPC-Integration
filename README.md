# AWS Pipeline Step-by-Step Guide to VPC Integration - Guía Paso a Paso de AWS Pipeline para Integración con VPC ⬇️ Abajo



Welcome to the **AWS Pipeline Step-by-Step Guide to VPC Integration**! This guide will help you set up an AWS Pipeline integrated with a Virtual Private Cloud (VPC) using Terraform.

# Diagram
![CICD](https://github.com/ValAug/AWS-Pipeline-Step-by-Step-Guide-to-VPC-Integration/blob/main/diagram/awscodepipelinemonitoringnotification.png)


## Table of Contents
- [Overview](#overview)
- [Main Function Points](#main-function-points)
- [Technology Stack](#technology-stack)
- [License](#license)

## Overview
This GitHub repository provides a comprehensive step-by-step guide to integrating an AWS Pipeline with a VPC. The project includes Terraform configuration files to set up the necessary infrastructure, including an S3 artifact bucket, CloudWatch logs, IAM roles, and an SNS topic for notifications.

## Main Function Points
- Provision an AWS Pipeline with VPC integration using Terraform
- Set up an S3 artifact bucket for storing build artifacts
- Configure CloudWatch logs for monitoring pipeline activities
- Establish IAM roles and permissions for the pipeline
- Implement an SNS topic for sending notifications

## Technology Stack
- **Terraform**: Infrastructure as Code (IaC) tool
- **AWS**: Cloud platform for hosting the pipeline and related resources

# Prerequisites

* You must have Terraform installed [How to install terraform guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Video

[![Watch the video](https://img.youtube.com/vi/2DONhPY84Gs/0.jpg)](https://www.youtube.com/watch?v=2DONhPY84Gs)

# Cautions

* As an AWS best practice, grant this code least privilege, or only the 
  permissions required to perform a task. For more information, see 
  [Grant Least Privilege](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege) 
  in the *AWS Identity and Access Management 
  User Guide*.
* This code has been tested in us-west-1 AWS Regions only. However it should work in any other region. 
* Running this code __it might__ result in charges to your AWS account.

# How to run this code

- [How to run this code](#how-to-run-this-code)
  - [Quick Start](#quick-start)
  - [Quick Destroy](#quick-destroy)
  - [Notes](#notes)

## Quick Start

It will deploy to the account setup for the aws cli called 'default' or 'profile' set it

```bash
clone this repo
cd AWS-Pipeline-Step-by-Step-Guide-to-VPC-Integration
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
```

## Quick Destroy

```bash
terraform destroy --auto-approve
```

## Notes

- clone this repo
- cd to the the directory AWS-Pipeline-Step-by-Step-Guide-to-VPC-Integration
- use terraform __init__ command prepare your working directory for other commands
- terraform __validate__ command check whether the configuration is valid
- terraform __plan__ command show changes required by the current configuration
- terraform __apply__ create or update infrastructure
- Alternate command : terraform apply -auto-approve
- terraform __destroy__ destroy previously-created infrastructure
- Alternate command : terraform destroy -auto-approve
- terraform __fmt__ reformat your configuration in the standard style

## License
This project is licensed under the MIT License.

----


# Guía Paso a Paso de AWS Pipeline para Integración con VPC

¡Bienvenido a la **Guía Paso a Paso de AWS Pipeline para Integración con VPC**! Esta guía te ayudará a configurar un AWS Pipeline integrado con una Nube Privada Virtual (VPC) utilizando Terraform.

## Tabla de Contenidos
- [Descripción General](#descripción-general)
- [Puntos de Función Principales](#puntos-de-función-principales)
- [Tecnologías Utilizadas](#tecnologías-utilizadas)
- [Licencia](#licencia)

## Descripción General
Este repositorio de GitHub proporciona una guía completa paso a paso para integrar un AWS Pipeline con una VPC. El proyecto incluye archivos de configuración de Terraform para establecer la infraestructura necesaria, incluyendo un bucket de artefactos S3, registros de CloudWatch, roles IAM y un tema SNS para notificaciones.

## Puntos de Función Principales
- Provisión de un AWS Pipeline con integración VPC utilizando Terraform
- Configuración de un bucket de artefactos S3 para almacenar artefactos de construcción
- Configuración de registros de CloudWatch para monitorear las actividades del pipeline
- Establecimiento de roles y permisos IAM para el pipeline
- Implementación de un tema SNS para enviar notificaciones

## Tecnologías Utilizadas
- **Terraform**: Herramienta de Infraestructura como Código (IaC)
- **AWS**: Plataforma en la nube para alojar el pipeline y recursos relacionados

Here’s the translation into Spanish:


# Prerrequisitos

* Debes tener Terraform instalado [Guía de instalación de Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Video

[![video](https://img.youtube.com/vi/2DONhPY84Gs/0.jpg)](https://www.youtube.com/watch?v=2DONhPY84Gs)


# Precauciones

* Como una mejor práctica de AWS, otorga a este código el principio de menor privilegio, o solo los permisos necesarios para realizar una tarea. Para más información, consulta [Otorgar el Menor Privilegio](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege) en la *Guía del Usuario de AWS Identity and Access Management*.
* Este código ha sido probado únicamente en las regiones de AWS us-west-1. Sin embargo, debería funcionar en cualquier otra región.
* Ejecutar este código __podría__ resultar en cargos a tu cuenta de AWS.

# Cómo ejecutar este código

- [Cómo ejecutar este código](#cómo-ejecutar-este-código)
  - [Inicio Rápido](#inicio-rápido)
  - [Destrucción Rápida](#destrucción-rápida)
  - [Notas](#notas)

## Inicio Rápido

Se desplegará en la cuenta configurada para el aws cli llamada 'default' o 'profile' establecida.

```bash
clona este repositorio
cd AWS-Pipeline-Step-by-Step-Guide-to-VPC-Integration
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
```

## Destrucción Rápida

```bash
terraform destroy --auto-approve
```

## Notas

- clona este repositorio
- cd al directorio AWS-Pipeline-Step-by-Step-Guide-to-VPC-Integration
- usa el comando terraform __init__ para preparar tu directorio de trabajo para otros comandos
- el comando terraform __validate__ verifica si la configuración es válida
- el comando terraform __plan__ muestra los cambios requeridos por la configuración actual
- el comando terraform __apply__ crea o actualiza la infraestructura
- Comando alternativo: terraform apply -auto-approve
- el comando terraform __destroy__ destruye la infraestructura creada previamente
- Comando alternativo: terraform destroy -auto-approve
- el comando terraform __fmt__ reformatea tu configuración en el estilo estándar


## Licencia
Este proyecto está licenciado bajo la Licencia MIT.
