#!/bin/bash

echo "🚀 Iniciando microservicios..."

# Liberar puerto 3001 si está ocupado
lsof -ti:3001 | xargs kill -9 2>/dev/null || true

# Construir y levantar todos los servicios
docker-compose up --build -d

echo "✅ Todos los servicios están ejecutándose:"
echo "   📊 Client Gateway: http://localhost:3001"
echo "   🛍️  Products MS: http://localhost:3000"
echo "   📦 Orders MS: http://localhost:3002"
echo "   💾 PostgreSQL: localhost:5433"
echo "   📡 NATS: localhost:4222"
echo ""
echo "Para ver los logs: docker-compose logs -f"
echo "Para detener: docker-compose down"