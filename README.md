# Creación de una Máquina Virtual en Azure con Terraform

## 📌 Descripción
Este proyecto implementa una **máquina virtual Windows en Azure** utilizando **Infrastructure as Code (IaC) con Terraform**. Se basa en la documentación oficial de Terraform, con dos modificaciones:
1. Se agrega la variable `vm_name` para personalizar el nombre de la máquina virtual.
2. La contraseña de administrador (`admin_password`) se define en `terraform.tfvars`, el cual está **ignorado** en el `.gitignore` por seguridad.

---

## ⚙️ **Prerrequisitos**
Antes de ejecutar Terraform, asegúrate de tener instalado:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

Verifica la instalación con:
```bash
terraform -version
az --version
```

---

## 📂 **Estructura del Proyecto**
```plaintext
.
├── main.tf              # Configuración principal de Terraform
├── variables.tf         # Definición de variables
├── terraform.tfvars     # Valores de variables (ignorado por Git)
├── outputs.tf           # Salida de Terraform
├── providers.tf         # Configuración de proveedores de Terraform
├── .gitignore           # Archivo para ignorar terraform.tfvars
└── README.md            # Documentación del proyecto
```

![pwd](img/structure.png)


### **Explicación de cada archivo**

- **`main.tf`**: Define los recursos principales, como la máquina virtual, redes y almacenamiento.
- **`variables.tf`**: Contiene las variables reutilizables para personalizar la infraestructura.
- **`terraform.tfvars`**: Almacena los valores de las variables (como la contraseña de la VM) y está ignorado por `.gitignore`.
- **`outputs.tf`**: Define las salidas, como la IP pública de la VM.
- **`providers.tf`**: Configura el proveedor de Azure para Terraform.
- **`.gitignore`**: Asegura que `terraform.tfvars` y otros archivos sensibles no se suban al repositorio.
- **`README.md`**: Documentación detallada sobre el proyecto.

---

## 🚀 **Pasos para Desplegar la Infraestructura**

### **1️⃣ Autenticarse en Azure**
```bash
az login
```
🔹 Esto abre el navegador para iniciar sesión en tu cuenta de Azure.


### **2️⃣ Inicializar Terraform**
```bash
terraform init
```
![init](img/init.png)
🔹 Descarga los proveedores necesarios y prepara el entorno.


### **3️⃣ Validar la Configuración**
```bash
terraform validate
```
![validate](img/validate.png)
🔹 Verifica que la configuración de Terraform sea correcta.


### **4️⃣ Generar el Plan de Ejecución**
```bash
terraform plan -out=tfplan
```
![plan](img/plan.png)
🔹 Muestra los cambios que se aplicarán en Azure.


### **5️⃣ Aplicar Terraform (Crear la VM)**
```bash
terraform apply
```
![apply](img/apply.png)
🔹 Despliega la máquina virtual en Azure.


### **6️⃣ Verificar la Máquina Virtual en Azure**
Una vez creada, accede al **portal de Azure** y verifica la VM en **Máquinas Virtuales**.

![vm](img/vm.png)

---

## ❌ **Eliminar la Infraestructura**
Si deseas eliminar todos los recursos creados por Terraform:
```bash
terraform destroy
```
![destroy](img/destroy.png)
🔹 Borra la máquina virtual y los recursos asociados en Azure.

---

## 📝 **Notas Finales**
- La contraseña de la VM se gestiona de forma segura en `terraform.tfvars` y **no debe subirse al repositorio**.
- Se recomienda almacenar el `terraform.tfstate` en un backend remoto para evitar pérdidas de estado.
- Si hay bloqueos en Terraform, usa `terraform force-unlock <ID>`.

🚀 ¡Ahora tienes una VM en Azure completamente automatizada con Terraform!