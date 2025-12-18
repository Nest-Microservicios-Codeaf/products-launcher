#!/bin/bash

echo "🛑 Deteniendo microservicios..."

# Matar procesos Node.js de los microservicios
pkill -f "nest start"
pkill -f "npm run start:dev"

echo "🛑 Deteniendo infraestructura..."
docker-compose down

echo "✅ Todos los servicios han sido detenidos"