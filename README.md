# Microservicios Launcher

Este proyecto utiliza Git submodules para gestionar múltiples microservicios de forma centralizada.

## Submodules

### ¿Qué son los submodules?

Los Git submodules permiten incluir otros repositorios Git como subdirectorios dentro de este proyecto principal. Cada submodule mantiene su propio historial de commits y puede ser desarrollado independientemente.

### Comandos básicos para submodules

#### Clonar el proyecto con todos los submodules
```bash
git clone --recursive https://github.com/Nest-Microservicios-Codeaf/products-launcher.git
```

#### Si ya clonaste el proyecto, inicializar los submodules
```bash
git submodule init
git submodule update
```

#### Reconstruir todos los submodules (inicializar y actualizar recursivamente)
```bash
git submodule update --init --recursive
```

#### Agregar un nuevo submodule
```bash
git submodule add <url-del-repositorio> <directorio-destino>
```

#### Actualizar todos los submodules a la última versión
```bash
git submodule update --remote
```

#### Actualizar un submodule específico
```bash
git submodule update --remote <nombre-del-submodule>
```

#### Ver el estado de los submodules
```bash
git submodule status
```

### Estructura del proyecto

```
microservicios-launcher/
├── docker-compose.yml
├── start-all.sh
├── stop-all.sh
└── [submodules de microservicios]
```

### Scripts disponibles

- `start-all.sh`: Inicia todos los microservicios
- `stop-all.sh`: Detiene todos los microservicios
- `start.sh`: Script de inicio individual
- `stop.sh`: Script de parada individual

## Docker

### Ejecutar todos los microservicios con Docker

#### Construir e iniciar todos los servicios
```bash
docker compose up --build
```

#### Ejecutar en segundo plano
```bash
docker compose up --build -d
```

#### Detener todos los servicios
```bash
docker compose down
```

#### Ver logs de los servicios
```bash
docker compose logs -f
```

### Solución de problemas

#### Error: Container name already in use
Si obtienes un error de que el nombre del contenedor ya está en uso:

```bash
# Detener y remover todos los contenedores
docker compose down

# Remover contenedores específicos si es necesario
docker rm -f nats-server client-gateway

# Luego ejecutar nuevamente
docker compose up --build
```

### Notas importantes

- Cada submodule apunta a un commit específico
- Para actualizar un submodule, navega a su directorio y haz pull de los cambios
- Recuerda hacer commit de los cambios en el proyecto principal después de actualizar submodules